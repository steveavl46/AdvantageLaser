using System;
using System.Data;
using System.Data.SqlClient;
using AdvLaser.AdvLaserObjects;


namespace AdvLaser.AdvLaserDataAccess
{

     public static class InvoiceItemDataAccess
     {
          public static int SaveInvoiceItem(InvoiceItem aInvoiceItem)
          {
               if(aInvoiceItem.InvoiceItemKey == 0)
               {
                    return createNewInvoiceItem(aInvoiceItem);
               }
               else
               {
                    return updateInvoiceItem(aInvoiceItem);
               }
          }

          public static SqlCommand SaveInvoiceItemCommand(InvoiceItem aInvoiceItem)
          {
               if(aInvoiceItem.InvoiceItemKey == 0)
               {
                    return createNewInvoiceItemCommand(aInvoiceItem);
               }
               else
               {
                    return createUpdateInvoiceItemCommand(aInvoiceItem);
               }
          }

          public static InvoiceItem GetOne(int aInvoiceItemKey)
          {
               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Id", SqlDbType.Int, 0, ParameterDirection.Input, aInvoiceItemKey);
               BaseDataAccess.SetCommandType( sqlCmd, CommandType.StoredProcedure, "InvoiceItem_GetOne");
               BaseDataAccess.GenerateObjectFromReader sqlData = new BaseDataAccess.GenerateObjectFromReader (CreateInvoiceItem);
               InvoiceItem aInvoiceItem = (InvoiceItem) BaseDataAccess.ExecuteObjectReader(sqlCmd, sqlData);
               return aInvoiceItem;
          }

          public static Object CreateInvoiceItem (SqlDataReader returnData)
          {
               InvoiceItem aInvoiceItem = null;

               while (returnData.Read()) 
               {
                    aInvoiceItem = new InvoiceItem();
                    aInvoiceItem.InvoiceItemKey = (int)returnData["InvoiceItemKey"];
                    aInvoiceItem.InvoiceKey = (int)returnData["InvoiceKey"];
                    aInvoiceItem.ProductKey = (int)returnData["ProductKey"];
                    aInvoiceItem.DepositSlipKey = (int)returnData["DepositSlipKey"];
                    aInvoiceItem.Description = (string)returnData["Description"];
                    aInvoiceItem.Quantity = (int)returnData["Quantity"];
                    aInvoiceItem.Price = (decimal)returnData["Price"];
                    aInvoiceItem.ShippingRate = (decimal)returnData["ShippingRate"];
                    aInvoiceItem.DepositStampKey = (int)returnData["DepositStampKey"];
                    aInvoiceItem.CheckDetailKey = (int)returnData["CheckDetailKey"];
                    aInvoiceItem.SoftwareName = (string)returnData["SoftwareName"];
                    aInvoiceItem.DepositBookKey = (int)returnData["DepositBookKey"];
               }
               return aInvoiceItem;
          }

          private static int createNewInvoiceItem(InvoiceItem aInvoiceItem)
          {

               SqlCommand sqlCmd = createNewInvoiceItemCommand(aInvoiceItem);

               BaseDataAccess.ExecuteScalarCmd(sqlCmd);
               return ((int)sqlCmd.Parameters["@retval"].Value); 
          }

          private static SqlCommand createNewInvoiceItemCommand(InvoiceItem aInvoiceItem)
          {

               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@InvoiceKey", SqlDbType.Int, 0, ParameterDirection.Input, aInvoiceItem.InvoiceKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ProductKey", SqlDbType.Int, 0, ParameterDirection.Input, aInvoiceItem.ProductKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@DepositSlipKey", SqlDbType.Int, 0, ParameterDirection.Input, aInvoiceItem.DepositSlipKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Description", SqlDbType.VarChar,100 , ParameterDirection.Input, aInvoiceItem.Description);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Quantity", SqlDbType.Int, 0, ParameterDirection.Input, aInvoiceItem.Quantity);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Price", SqlDbType.Float, 18, ParameterDirection.Input, aInvoiceItem.Price);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ShippingRate", SqlDbType.Float, 18, ParameterDirection.Input, aInvoiceItem.ShippingRate);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@DepositStampKey", SqlDbType.Int, 0, ParameterDirection.Input, aInvoiceItem.DepositStampKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@CheckDetailKey", SqlDbType.Int, 0, ParameterDirection.Input, aInvoiceItem.CheckDetailKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@SoftwareName", SqlDbType.VarChar, 50, ParameterDirection.Input, aInvoiceItem.SoftwareName);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@DepositBookKey", SqlDbType.Int, 0, ParameterDirection.Input, aInvoiceItem.DepositBookKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@retval", SqlDbType.Int, 0, ParameterDirection.Output, null);
               BaseDataAccess.SetCommandType(sqlCmd,CommandType.StoredProcedure, "InvoiceItem_Create");
               return sqlCmd;
          }

          private static SqlCommand createUpdateInvoiceItemCommand(InvoiceItem aInvoiceItem)
          {

               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ID", SqlDbType.Int, 0, ParameterDirection.Input, aInvoiceItem.InvoiceItemKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@InvoiceKey", SqlDbType.Int, 0, ParameterDirection.Input, aInvoiceItem.InvoiceKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ProductKey", SqlDbType.Int, 0, ParameterDirection.Input, aInvoiceItem.ProductKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@DepositSlipKey", SqlDbType.Int, 0, ParameterDirection.Input, aInvoiceItem.DepositSlipKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Description", SqlDbType.VarChar,100 , ParameterDirection.Input, aInvoiceItem.Description);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Quantity", SqlDbType.Int, 0, ParameterDirection.Input, aInvoiceItem.Quantity);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Price", SqlDbType.Float, 18, ParameterDirection.Input, aInvoiceItem.Price);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ShippingRate", SqlDbType.Float, 18, ParameterDirection.Input, aInvoiceItem.ShippingRate);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@DepositStampKey", SqlDbType.Int, 0, ParameterDirection.Input, aInvoiceItem.DepositStampKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@CheckDetailKey", SqlDbType.Int, 0, ParameterDirection.Input, aInvoiceItem.CheckDetailKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@SoftwareName", SqlDbType.VarChar, 50, ParameterDirection.Input, aInvoiceItem.SoftwareName);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@DepositBookKey", SqlDbType.Int, 0, ParameterDirection.Input, aInvoiceItem.DepositBookKey);
               BaseDataAccess.SetCommandType(sqlCmd,CommandType.StoredProcedure, "InvoiceItem_Update");
               return sqlCmd;
          }
          private static int updateInvoiceItem(InvoiceItem aInvoiceItem)
          {

               SqlCommand sqlCmd = createUpdateInvoiceItemCommand(aInvoiceItem);

               BaseDataAccess.ExecuteScalarCmd(sqlCmd);
               return aInvoiceItem.InvoiceItemKey;
          }
     }
}
