using System;
using System.Data;
using System.Data.SqlClient;
using AdvLaser.AdvLaserObjects;
using System.Collections;


namespace AdvLaser.AdvLaserDataAccess
{

     public static class CreditCardDataAccess
     {
          public static int SaveCreditCard(CreditCard aCreditCard)
          {
               if(aCreditCard.CreditCardKey == 0)
               {
                    return createNewCreditCard(aCreditCard);
               }
               else
               {
                    return updateCreditCard(aCreditCard);
               }
          }

          public static SqlCommand SaveCreditCardCommand(CreditCard aCreditCard)
          {
               if(aCreditCard.CreditCardKey == 0)
               {
                    return createNewCreditCardCommand(aCreditCard);
               }
               else
               {
                    return createUpdateCreditCardCommand(aCreditCard);
               }
          }

          public static CreditCard GetOne(int aCreditCardKey)
          {
               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Id", SqlDbType.Int, 0, ParameterDirection.Input, aCreditCardKey);
               BaseDataAccess.SetCommandType( sqlCmd, CommandType.StoredProcedure, "CreditCard_GetOne");
               BaseDataAccess.GenerateObjectFromReader sqlData = new BaseDataAccess.GenerateObjectFromReader (CreateCreditCard);
               CreditCard aCreditCard = (CreditCard) BaseDataAccess.ExecuteObjectReader(sqlCmd, sqlData);
               return aCreditCard;
          }

          public static Object CreateCreditCard (SqlDataReader returnData)
          {
               CreditCard aCreditCard = null;

               while (returnData.Read()) 
               {
                    aCreditCard = new CreditCard();
                    aCreditCard.CreditCardKey = (int)returnData["CreditCardKey"];
                    aCreditCard.CustomerKey = (int)returnData["CustomerKey"];
                    aCreditCard.CreditCardTypeKey = (int)returnData["CreditCardTypeKey"];
                    aCreditCard.Number = (string)returnData["Number"];
                    aCreditCard.ExpirationMonth = (int)returnData["ExpirationMonth"];
                    aCreditCard.ExpirationYear = (int)returnData["ExpirationYear"];
                    aCreditCard.CCV = (string)returnData["CCV"];
                    aCreditCard.CCNumber = (byte[])returnData["CCNumber"];
            }
               return aCreditCard;
          }

          private static int createNewCreditCard(CreditCard aCreditCard)
          {

               SqlCommand sqlCmd = createNewCreditCardCommand(aCreditCard);

               BaseDataAccess.ExecuteScalarCmd(sqlCmd);
               return ((int)sqlCmd.Parameters["@retval"].Value); 
          }

          private static SqlCommand createNewCreditCardCommand(CreditCard aCreditCard)
          {

               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@CustomerKey", SqlDbType.Int, 0, ParameterDirection.Input, aCreditCard.CustomerKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@CreditCardTypeKey", SqlDbType.Int, 0, ParameterDirection.Input, aCreditCard.CreditCardTypeKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Number", SqlDbType.VarChar, 20, ParameterDirection.Input, aCreditCard.Number);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ExpirationMonth", SqlDbType.Int, 0, ParameterDirection.Input, aCreditCard.ExpirationMonth);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ExpirationYear", SqlDbType.Int, 0, ParameterDirection.Input, aCreditCard.ExpirationYear);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@CCV", SqlDbType.VarChar, 4, ParameterDirection.Input, aCreditCard.CCV);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@CCNumber", SqlDbType.VarBinary, 128, ParameterDirection.Input, aCreditCard.CCNumber);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@CCExpMonth", SqlDbType.VarBinary, 128, ParameterDirection.Input, aCreditCard.CCExpMonth);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@CCExpYear", SqlDbType.VarBinary, 128, ParameterDirection.Input, aCreditCard.CCExpYear);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@CCCCV", SqlDbType.VarBinary, 128, ParameterDirection.Input, aCreditCard.CCCCV);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@retval", SqlDbType.Int, 0, ParameterDirection.Output, null);
               BaseDataAccess.SetCommandType(sqlCmd,CommandType.StoredProcedure, "CreditCard_Create");
               return sqlCmd;
          }

          private static SqlCommand createUpdateCreditCardCommand(CreditCard aCreditCard)
          {

               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ID", SqlDbType.Int, 0, ParameterDirection.Input, aCreditCard.CreditCardKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@CustomerKey", SqlDbType.Int, 0, ParameterDirection.Input, aCreditCard.CustomerKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@CreditCardTypeKey", SqlDbType.Int, 0, ParameterDirection.Input, aCreditCard.CreditCardTypeKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Number", SqlDbType.VarChar, 20, ParameterDirection.Input, aCreditCard.Number);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ExpirationMonth", SqlDbType.Int, 0, ParameterDirection.Input, aCreditCard.ExpirationMonth);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ExpirationYear", SqlDbType.Int, 0, ParameterDirection.Input, aCreditCard.ExpirationYear);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@CCV", SqlDbType.VarChar, 4, ParameterDirection.Input, aCreditCard.CCV);
               BaseDataAccess.SetCommandType(sqlCmd,CommandType.StoredProcedure, "CreditCard_Update");
               return sqlCmd;
          }
          private static int updateCreditCard(CreditCard aCreditCard)
          {

               SqlCommand sqlCmd = createUpdateCreditCardCommand(aCreditCard);

               BaseDataAccess.ExecuteScalarCmd(sqlCmd);
               return aCreditCard.CreditCardKey;
          }

          
     }
}
