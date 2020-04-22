using System;
using System.Data;
using System.Data.SqlClient;
using AdvLaser.AdvLaserObjects;


namespace AdvLaser.AdvLaserDataAccess
{

     public static class DepositStampDataAccess
     {
          public static int SaveDepositStamp(DepositStamp aDepositStamp)
          {
               if(aDepositStamp.DepositStampKey == 0)
               {
                    return createNewDepositStamp(aDepositStamp);
               }
               else
               {
                    return updateDepositStamp(aDepositStamp);
               }
          }

          public static SqlCommand SaveDepositStampCommand(DepositStamp aDepositStamp)
          {
               if(aDepositStamp.DepositStampKey == 0)
               {
                    return createNewDepositStampCommand(aDepositStamp);
               }
               else
               {
                    return createUpdateDepositStampCommand(aDepositStamp);
               }
          }

          public static DepositStamp GetOne(int aDepositStampKey)
          {
               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Id", SqlDbType.Int, 0, ParameterDirection.Input, aDepositStampKey);
               BaseDataAccess.SetCommandType( sqlCmd, CommandType.StoredProcedure, "DepositStamp_GetOne");
               BaseDataAccess.GenerateObjectFromReader sqlData = new BaseDataAccess.GenerateObjectFromReader (CreateDepositStamp);
               DepositStamp aDepositStamp = (DepositStamp) BaseDataAccess.ExecuteObjectReader(sqlCmd, sqlData);
               return aDepositStamp;
          }

          public static Object CreateDepositStamp (SqlDataReader returnData)
          {
               DepositStamp aDepositStamp = null;

               while (returnData.Read()) 
               {
                    aDepositStamp = new DepositStamp();
                    aDepositStamp.DepositStampKey = (int)returnData["DepositStampKey"];
                    aDepositStamp.CustomerKey = (int)returnData["CustomerKey"];
                    aDepositStamp.AccountNumber = (string)returnData["AccountNumber"];
                    aDepositStamp.BankName = (string)returnData["BankName"];
                    aDepositStamp.Line1 = (string)returnData["Line1"];
                    aDepositStamp.AcctNumber = (byte[])returnData["AcctNumber"];
            }
               return aDepositStamp;
          }

          private static int createNewDepositStamp(DepositStamp aDepositStamp)
          {

               SqlCommand sqlCmd = createNewDepositStampCommand(aDepositStamp);

               BaseDataAccess.ExecuteScalarCmd(sqlCmd);
               return ((int)sqlCmd.Parameters["@retval"].Value); 
          }

          private static SqlCommand createNewDepositStampCommand(DepositStamp aDepositStamp)
          {

               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@CustomerKey", SqlDbType.Int, 0, ParameterDirection.Input, aDepositStamp.CustomerKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@AccountNumber", SqlDbType.VarChar, 20, ParameterDirection.Input, String.Empty);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@BankName", SqlDbType.VarChar, 50, ParameterDirection.Input, aDepositStamp.BankName);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Line1", SqlDbType.VarChar, 50, ParameterDirection.Input, aDepositStamp.Line1);
            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@AcctNumber", SqlDbType.VarBinary, 128, ParameterDirection.Input, aDepositStamp.AcctNumber);
            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@retval", SqlDbType.Int, 0, ParameterDirection.Output, null);
               BaseDataAccess.SetCommandType(sqlCmd,CommandType.StoredProcedure, "DepositStamp_Create");
               return sqlCmd;
          }

          private static SqlCommand createUpdateDepositStampCommand(DepositStamp aDepositStamp)
          {

               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ID", SqlDbType.Int, 0, ParameterDirection.Input, aDepositStamp.DepositStampKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@CustomerKey", SqlDbType.Int, 0, ParameterDirection.Input, aDepositStamp.CustomerKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@AccountNumber", SqlDbType.VarChar, 20, ParameterDirection.Input, aDepositStamp.AccountNumber);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@BankName", SqlDbType.VarChar, 50, ParameterDirection.Input, aDepositStamp.BankName);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Line1", SqlDbType.VarChar, 50, ParameterDirection.Input, aDepositStamp.Line1);
               BaseDataAccess.SetCommandType(sqlCmd,CommandType.StoredProcedure, "DepositStamp_Update");
               return sqlCmd;
          }
          private static int updateDepositStamp(DepositStamp aDepositStamp)
          {

               SqlCommand sqlCmd = createUpdateDepositStampCommand(aDepositStamp);

               BaseDataAccess.ExecuteScalarCmd(sqlCmd);
               return aDepositStamp.DepositStampKey;
          }
     }
}
