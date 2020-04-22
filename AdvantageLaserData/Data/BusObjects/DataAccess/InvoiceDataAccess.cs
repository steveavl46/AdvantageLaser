using System;
using System.Data;
using System.Data.SqlClient;
using AdvLaser.AdvLaserObjects;


namespace AdvLaser.AdvLaserDataAccess
{

     public static class InvoiceDataAccess
     {
          public static int SaveInvoice(Invoice aInvoice)
          {
               if(aInvoice.InvoiceKey == 0)
               {
                    return createNewInvoice(aInvoice);
               }
               else
               {
                    return updateInvoice(aInvoice);
               }
          }

          public static SqlCommand SaveInvoiceCommand(Invoice aInvoice)
          {
               if(aInvoice.InvoiceKey == 0)
               {
                    return createNewInvoiceCommand(aInvoice);
               }
               else
               {
                    return createUpdateInvoiceCommand(aInvoice);
               }
          }

          public static Invoice GetOne(int aInvoiceKey)
          {
               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Id", SqlDbType.Int, 0, ParameterDirection.Input, aInvoiceKey);
               BaseDataAccess.SetCommandType( sqlCmd, CommandType.StoredProcedure, "Invoice_GetOne");
               BaseDataAccess.GenerateObjectFromReader sqlData = new BaseDataAccess.GenerateObjectFromReader (CreateInvoice);
               Invoice aInvoice = (Invoice) BaseDataAccess.ExecuteObjectReader(sqlCmd, sqlData);
               return aInvoice;
          }

          public static Object CreateInvoice(SqlDataReader returnData)
          {
              Invoice aInvoice = null;

              while (returnData.Read())
              {
                  aInvoice = new Invoice();
                  aInvoice.InvoiceKey = (int)returnData["InvoiceKey"];
                  aInvoice.CustomerKey = BaseDataAccess.GetInt(returnData["CustomerKey"]);
                  aInvoice.OrderDate = BaseDataAccess.GetDate(returnData["OrderDate"]);
                  aInvoice.ShippingDate = BaseDataAccess.GetDate(returnData["ShippingDate"]);
                  aInvoice.Comment = BaseDataAccess.GetString(returnData["Comment"]);
                  aInvoice.ShippingTotal = BaseDataAccess.GetDecimal(returnData["ShippingTotal"]);
                  aInvoice.CreditCardKey = BaseDataAccess.GetInt(returnData["CreditCardKey"]);
                  aInvoice.ShippingTypeKey = BaseDataAccess.GetInt(returnData["ShippingTypeKey"]);
                  aInvoice.ExpediteTypeKey = BaseDataAccess.GetInt(returnData["ExpediteTypeKey"]);
                  aInvoice.BillCharges = (bool)returnData["BillCharges"];
                  aInvoice.DebitAccount = BaseDataAccess.GetString(returnData["DebitAccount"]);
                  aInvoice.ExpediteAmount = BaseDataAccess.GetDecimal(returnData["ExpediteAmount"]);
                  aInvoice.ComputerIP = BaseDataAccess.GetString(returnData["ComputerIP"]);
                  aInvoice.SalesPersonID = BaseDataAccess.GetString(returnData["SalesPersonID"]);
                  aInvoice.ExpediteSubTypeKey = BaseDataAccess.GetInt(returnData["ExpediteSubTypeKey"]);
                  aInvoice.CouponKey = BaseDataAccess.GetInt(returnData["CouponKey"]);
                  aInvoice.ReferralCode = BaseDataAccess.GetString(returnData["ReferralCode"]);
                  aInvoice.CouponDiscount = BaseDataAccess.GetDecimal(returnData["CouponDiscount"]);
                aInvoice.DebitAcct = BaseDataAccess.GetByteArray(returnData["DebitAcct"]);
            }
              return aInvoice;
          }

          private static int createNewInvoice(Invoice aInvoice)
          {
              int aNewInvoiceKey = Int32.MinValue;
              if (aInvoice.CouponKey == 0)
              {
                  aInvoice.CouponKey = Int32.MinValue;
              }
              using (SqlConnection cn = new SqlConnection())
              {
                  SqlCommand sqlCmd;
                  cn.ConnectionString = BaseDataAccess.ConnectionString;
                  cn.Open();
                  SqlTransaction trans = cn.BeginTransaction();

                  Customer aCustomer = aInvoice.CustomerObject;
                  sqlCmd = CustomerDataAccess.SaveCustomerCommand(aCustomer);
                  sqlCmd.Connection = cn;
                  sqlCmd.Transaction = trans;
                  sqlCmd.ExecuteNonQuery();
                  int aCustomerKey = ((int)sqlCmd.Parameters["@retval"].Value);

                var test = BaseDataAccess.Encrypt(aCustomer.FirstName);

                  int aCreditCardKey = Int32.MinValue;
                  if (aInvoice.CreditCardObject != null)
                  {
                      CreditCard aCreditCard = aInvoice.CreditCardObject;
                      aCreditCard.CustomerKey = aCustomerKey;
                    aCreditCard.CCNumber = BaseDataAccess.Encrypt(aCreditCard.Number);
                    aCreditCard.CCExpMonth = BaseDataAccess.Encrypt(aCreditCard.ExpirationMonth);
                    aCreditCard.CCExpYear = BaseDataAccess.Encrypt(aCreditCard.ExpirationYear);
                    aCreditCard.CCCCV = BaseDataAccess.Encrypt(aCreditCard.CCV);
                    sqlCmd = CreditCardDataAccess.SaveCreditCardCommand(aCreditCard);
                      sqlCmd.Connection = cn;
                      sqlCmd.Transaction = trans;
                      sqlCmd.ExecuteNonQuery();
                      aCreditCardKey = ((int)sqlCmd.Parameters["@retval"].Value);
                  }

                  int aShippingTypeKey = Int32.MinValue;
                  ShippingType aShippingType = aInvoice.ShippingTypeObject;
                  if (aShippingType != null)
                  {
                      aShippingTypeKey = aShippingType.ShippingTypeKey;
                  }

                  int aExpediteTypeKey = Int32.MinValue;
                  decimal aExpediteAmount = 0;
                  ExpediteType aExpediteType = aInvoice.ExpediteTypeObject;
                  if (aExpediteType != null)
                  {
                      aExpediteTypeKey = aExpediteType.ExpediteTypeKey;
                      aExpediteAmount = aExpediteType.AdditionalCharge;
                  }

                  ExpediteSubType expediteSubType = aInvoice.ExpediteSubTypeObject;
                  int aExpediteSubTypeKey = Int32.MinValue;
                  if (expediteSubType != null)
                  {
                      aExpediteSubTypeKey = expediteSubType.ExpediteSubTypeKey;
                  }

                  foreach (Address aAddress in aCustomer.Addresses)
                  {
                      aAddress.CustomerKey = aCustomerKey;
                      sqlCmd = AddressDataAccess.SaveAddressCommand(aAddress);
                      sqlCmd.Connection = cn;
                      sqlCmd.Transaction = trans;
                      sqlCmd.ExecuteNonQuery();
                  }

                  aInvoice.CustomerKey = aCustomerKey;
                  aInvoice.CreditCardKey = aCreditCardKey;
                  aInvoice.ShippingTypeKey = aShippingTypeKey;
                  aInvoice.ShippingTotal = aInvoice.CalculateShipping();
                  aInvoice.OrderDate = DateTime.Now;
                  aInvoice.ShippingDate = DateTime.MinValue;
                aInvoice.DebitAcct = BaseDataAccess.Encrypt(aInvoice.DebitAccount);
                  if (aExpediteTypeKey > Int32.MinValue)
                  {
                      aInvoice.ExpediteTypeKey = aExpediteTypeKey;
                      aInvoice.ExpediteAmount = aExpediteAmount;
                  }
                  else
                  {
                      aInvoice.ExpediteTypeKey = Int32.MinValue;
                      aInvoice.ExpediteAmount = 0;
                  }

                  /*
                   * if (aExpediteSubTypeKey > Int32.MinValue)
                  {
                      aInvoice.ExpediteSubTypeKey = aExpediteSubTypeKey;
                  }
                  */
                  aInvoice.ExpediteSubTypeKey = aExpediteSubTypeKey;

                  sqlCmd = createNewInvoiceCommand(aInvoice);
                  sqlCmd.Connection = cn;
                  sqlCmd.Transaction = trans;
                  sqlCmd.ExecuteNonQuery();
                  aNewInvoiceKey = ((int)sqlCmd.Parameters["@retval"].Value);

                  foreach (InvoiceItem item in aInvoice.InvoiceItems)
                  {
                      int aNewDepositSlipKey = Int32.MinValue;
                      int aNewDepositStampKey = Int32.MinValue;
                      int aNewCheckDetailKey = Int32.MinValue;
                      int aNewDepositBookKey = Int32.MinValue;
                      if (item.DepositSlipObject != null)
                      {
                          DepositSlip aDepositSlip = item.DepositSlipObject;
                          aDepositSlip.CustomerKey = aCustomerKey;
                        aDepositSlip.AcctNumber = BaseDataAccess.Encrypt(aDepositSlip.AccountNumber);
                        aDepositSlip.RNumber = BaseDataAccess.Encrypt(aDepositSlip.RoutingNumber);
                          sqlCmd = DepositSlipDataAccess.SaveDepositSlipCommand(aDepositSlip);
                          sqlCmd.Connection = cn;
                          sqlCmd.Transaction = trans;
                          sqlCmd.ExecuteNonQuery();
                          aNewDepositSlipKey = (int)sqlCmd.Parameters["@retval"].Value;
                      }

                      if (item.DepositStampObject != null)
                      {
                          DepositStamp aDepositStamp = item.DepositStampObject;
                          aDepositStamp.CustomerKey = aCustomerKey;
                        aDepositStamp.AcctNumber = BaseDataAccess.Encrypt(aDepositStamp.AccountNumber);
                          sqlCmd = DepositStampDataAccess.SaveDepositStampCommand(aDepositStamp);
                          sqlCmd.Connection = cn;
                          sqlCmd.Transaction = trans;
                          sqlCmd.ExecuteNonQuery();
                          aNewDepositStampKey = (int)sqlCmd.Parameters["@retval"].Value;
                      }

                      if (item.DepositBookObject != null)
                      {
                          DepositBook aDepositBook = item.DepositBookObject;
                          aDepositBook.CustomerKey = aCustomerKey;
                        aDepositBook.AcctNumber = BaseDataAccess.Encrypt(aDepositBook.AccountNumber);
                        aDepositBook.RNumber = BaseDataAccess.Encrypt(aDepositBook.RoutingNumber);
                          sqlCmd = DepositBookDataAccess.SaveDepositBookCommand(aDepositBook);
                          sqlCmd.Connection = cn;
                          sqlCmd.Transaction = trans;
                          sqlCmd.ExecuteNonQuery();
                          aNewDepositBookKey = (int)sqlCmd.Parameters["@retval"].Value;
                      }

                      if (item.CheckDetailObject != null)
                      {
                          CheckDetail aCheckDetail = item.CheckDetailObject;
                          aCheckDetail.CustomerKey = aCustomerKey;
                        aCheckDetail.AcctNumber = BaseDataAccess.Encrypt(aCheckDetail.BankAccountNumber);
                        aCheckDetail.RNumber = BaseDataAccess.Encrypt(aCheckDetail.RoutingNumber);
                        aCheckDetail.Preview = BaseDataAccess.Encrypt(aCheckDetail.PreviewPath);
                        //aCheckDetail.Logo = BaseDataAccess.Encrypt(aCheckDetail.LogoPath);
                        sqlCmd = CheckDetailDataAccess.SaveCheckDetailCommand(aCheckDetail);
                          sqlCmd.Connection = cn;
                          sqlCmd.Transaction = trans;
                          sqlCmd.ExecuteNonQuery();
                          aNewCheckDetailKey = (int)sqlCmd.Parameters["@retval"].Value;
                      }

                      item.InvoiceKey = aNewInvoiceKey;
                      item.DepositSlipKey = aNewDepositSlipKey;
                      item.DepositStampKey = aNewDepositStampKey;
                      item.CheckDetailKey = aNewCheckDetailKey;
                      item.DepositBookKey = aNewDepositBookKey;
                      sqlCmd = InvoiceItemDataAccess.SaveInvoiceItemCommand(item);
                      sqlCmd.Connection = cn;
                      sqlCmd.Transaction = trans;
                      sqlCmd.ExecuteNonQuery();
                      int aNewItemKey = (int)sqlCmd.Parameters["@retval"].Value;

                      
                  }

                  trans.Commit();
              }
               
              return aNewInvoiceKey;
          }

          private static SqlCommand createNewInvoiceCommand(Invoice aInvoice)
          {

              SqlCommand sqlCmd = new SqlCommand();

              BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@CustomerKey", SqlDbType.Int, 0, ParameterDirection.Input, aInvoice.CustomerKey);
              BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@OrderDate", SqlDbType.DateTime, 8, ParameterDirection.Input, aInvoice.OrderDate);
              BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ShippingDate", SqlDbType.DateTime, 8, ParameterDirection.Input, aInvoice.ShippingDate);
              BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Comment", SqlDbType.VarChar, 200, ParameterDirection.Input, aInvoice.Comment);
              BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ShippingTotal", SqlDbType.Float, 18, ParameterDirection.Input, aInvoice.ShippingTotal);
              BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@CreditCardKey", SqlDbType.Int, 0, ParameterDirection.Input, aInvoice.CreditCardKey);
              BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ShippingTypeKey", SqlDbType.Int, 0, ParameterDirection.Input, aInvoice.ShippingTypeKey);
              BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ExpediteTypeKey", SqlDbType.Int, 0, ParameterDirection.Input, aInvoice.ExpediteTypeKey);
              BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@DebitAccount", SqlDbType.VarChar, 20, ParameterDirection.Input, String.Empty);
              BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@BillCharges", SqlDbType.Bit, 0, ParameterDirection.Input, aInvoice.BillCharges);
              BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ExpediteAmount", SqlDbType.Float, 18, ParameterDirection.Input, aInvoice.ExpediteAmount);
              BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@retval", SqlDbType.Int, 0, ParameterDirection.Output, null);
              BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ComputerIP", SqlDbType.VarChar, 50, ParameterDirection.Input, aInvoice.ComputerIP);
              BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@SalesPersonID", SqlDbType.VarChar, 100, ParameterDirection.Input, aInvoice.SalesPersonID);
              BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ExpediteSubTypeKey", SqlDbType.Int, 0, ParameterDirection.Input, aInvoice.ExpediteSubTypeKey);
              BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@CouponKey", SqlDbType.Int, 0, ParameterDirection.Input, aInvoice.CouponKey);
              BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ReferralCode", SqlDbType.VarChar, 30, ParameterDirection.Input, aInvoice.ReferralCode);
              BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@CouponDiscount", SqlDbType.Float, 18, ParameterDirection.Input, aInvoice.CouponDiscount);
            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@DebitAcct", SqlDbType.VarBinary, 128, ParameterDirection.Input, aInvoice.DebitAcct);
            BaseDataAccess.SetCommandType(sqlCmd, CommandType.StoredProcedure, "Invoice_Create");
              return sqlCmd;
          }

          private static SqlCommand createUpdateInvoiceCommand(Invoice aInvoice)
          {

              SqlCommand sqlCmd = new SqlCommand();

              BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ID", SqlDbType.Int, 0, ParameterDirection.Input, aInvoice.InvoiceKey);
              BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@CustomerKey", SqlDbType.Int, 0, ParameterDirection.Input, aInvoice.CustomerKey);
              BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@OrderDate", SqlDbType.DateTime, 8, ParameterDirection.Input, aInvoice.OrderDate);
              BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ShippingDate", SqlDbType.DateTime, 8, ParameterDirection.Input, aInvoice.ShippingDate);
              BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Comment", SqlDbType.VarChar, 200, ParameterDirection.Input, aInvoice.Comment);
              BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ShippingTotal", SqlDbType.Float, 18, ParameterDirection.Input, aInvoice.ShippingTotal);
              BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@CreditCardKey", SqlDbType.Int, 0, ParameterDirection.Input, aInvoice.CreditCardKey);
              BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ShippingTypeKey", SqlDbType.Int, 0, ParameterDirection.Input, aInvoice.ShippingTypeKey);
              BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ExpediteTypeKey", SqlDbType.Int, 0, ParameterDirection.Input, aInvoice.ExpediteTypeKey);
              BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@DebitAccount", SqlDbType.VarChar, 20, ParameterDirection.Input, aInvoice.DebitAccount);
              BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@BillCharges", SqlDbType.Bit, 0, ParameterDirection.Input, aInvoice.BillCharges);
              BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ExpediteAmount", SqlDbType.Float, 18, ParameterDirection.Input, aInvoice.ExpediteAmount);
              BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ComputerIP", SqlDbType.VarChar, 50, ParameterDirection.Input, aInvoice.ComputerIP);
              BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@SalesPersonID", SqlDbType.VarChar, 100, ParameterDirection.Input, aInvoice.SalesPersonID);
              BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ExpediteSubTypeKey", SqlDbType.Int, 0, ParameterDirection.Input, aInvoice.ExpediteSubTypeKey);
              BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@CouponKey", SqlDbType.Int, 0, ParameterDirection.Input, aInvoice.CouponKey);
              BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ReferralCode", SqlDbType.VarChar, 30, ParameterDirection.Input, aInvoice.ReferralCode);
              BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@CouponDiscount", SqlDbType.Float, 18, ParameterDirection.Input, aInvoice.CouponDiscount);
              BaseDataAccess.SetCommandType(sqlCmd, CommandType.StoredProcedure, "Invoice_Update");
              return sqlCmd;
          }

          private static int updateInvoice(Invoice aInvoice)
          {
              if (aInvoice.CouponKey == 0)
              {
                  aInvoice.CouponKey = Int32.MinValue;
              }
               SqlCommand sqlCmd = createUpdateInvoiceCommand(aInvoice);

               BaseDataAccess.ExecuteScalarCmd(sqlCmd);
               return aInvoice.InvoiceKey;
          }
     }
}
