using System;
using System.Data;
using System.Data.SqlClient;
using AdvLaser.AdvLaserObjects;


namespace AdvLaser.AdvLaserDataAccess
{

     public static class DepositSlipDataAccess
     {
          public static int SaveDepositSlip(DepositSlip aDepositSlip)
          {
               if(aDepositSlip.DepositSlipKey == 0)
               {
                    return createNewDepositSlip(aDepositSlip);
               }
               else
               {
                    return updateDepositSlip(aDepositSlip);
               }
          }

          public static SqlCommand SaveDepositSlipCommand(DepositSlip aDepositSlip)
          {
               if(aDepositSlip.DepositSlipKey == 0)
               {
                    return createNewDepositSlipCommand(aDepositSlip);
               }
               else
               {
                    return createUpdateDepositSlipCommand(aDepositSlip);
               }
          }

          public static DepositSlip GetOne(int aDepositSlipKey)
          {
               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Id", SqlDbType.Int, 0, ParameterDirection.Input, aDepositSlipKey);
               BaseDataAccess.SetCommandType( sqlCmd, CommandType.StoredProcedure, "DepositSlip_GetOne");
               BaseDataAccess.GenerateObjectFromReader sqlData = new BaseDataAccess.GenerateObjectFromReader (CreateDepositSlip);
               DepositSlip aDepositSlip = (DepositSlip) BaseDataAccess.ExecuteObjectReader(sqlCmd, sqlData);
               return aDepositSlip;
          }

          public static Object CreateDepositSlip (SqlDataReader returnData)
          {
               DepositSlip aDepositSlip = null;

               while (returnData.Read()) 
               {
                    aDepositSlip = new DepositSlip();
                    aDepositSlip.DepositSlipKey = (int)returnData["DepositSlipKey"];
                    aDepositSlip.CustomerKey = (int)returnData["CustomerKey"];
                    aDepositSlip.RoutingNumber = (string)returnData["RoutingNumber"];
                    aDepositSlip.AccountNumber = (string)returnData["AccountNumber"];
                    aDepositSlip.Fraction = (string)returnData["Fraction"];
                    aDepositSlip.Line1 = (string)returnData["Line1"];
                    aDepositSlip.Line2 = (string)returnData["Line2"];
                    aDepositSlip.Line3 = (string)returnData["Line3"];
                    aDepositSlip.Line4 = (string)returnData["Line4"];
                    aDepositSlip.Line5 = (string)returnData["Line5"];
                    aDepositSlip.BankInfoLine1 = (string)returnData["BankInfoLine1"];
                    aDepositSlip.BankInfoLine2 = (string)returnData["BankInfoLine2"];
                    aDepositSlip.BankInfoLine3 = (string)returnData["BankInfoLine3"];
                    aDepositSlip.AcctNumber = (byte[])returnData["AcctNumber"];
                    aDepositSlip.RNumber = (byte[])returnData["RNumber"];
            }
               return aDepositSlip;
          }

          private static int createNewDepositSlip(DepositSlip aDepositSlip)
          {

               SqlCommand sqlCmd = createNewDepositSlipCommand(aDepositSlip);

               BaseDataAccess.ExecuteScalarCmd(sqlCmd);
               return ((int)sqlCmd.Parameters["@retval"].Value); 
          }

          private static SqlCommand createNewDepositSlipCommand(DepositSlip aDepositSlip)
          {

               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@CustomerKey", SqlDbType.Int, 0, ParameterDirection.Input, aDepositSlip.CustomerKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@RoutingNumber", SqlDbType.VarChar, 20, ParameterDirection.Input, String.Empty);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@AccountNumber", SqlDbType.VarChar, 20, ParameterDirection.Input, String.Empty);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Fraction", SqlDbType.VarChar, 20, ParameterDirection.Input, aDepositSlip.Fraction);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Line1", SqlDbType.VarChar, 100, ParameterDirection.Input, aDepositSlip.Line1);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Line2", SqlDbType.VarChar, 100, ParameterDirection.Input, aDepositSlip.Line2);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Line3", SqlDbType.VarChar, 100, ParameterDirection.Input, aDepositSlip.Line3);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Line4", SqlDbType.VarChar, 100, ParameterDirection.Input, aDepositSlip.Line4);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Line5", SqlDbType.VarChar, 100, ParameterDirection.Input, aDepositSlip.Line5);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@BankInfoLine1", SqlDbType.VarChar, 35, ParameterDirection.Input, aDepositSlip.BankInfoLine1);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@BankInfoLine2", SqlDbType.VarChar, 35, ParameterDirection.Input, aDepositSlip.BankInfoLine2);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@BankInfoLine3", SqlDbType.VarChar, 35, ParameterDirection.Input, aDepositSlip.BankInfoLine3);
            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@AcctNumber", SqlDbType.VarBinary, 128, ParameterDirection.Input, aDepositSlip.AcctNumber);
            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@RNumber", SqlDbType.VarBinary, 128, ParameterDirection.Input, aDepositSlip.RNumber);
            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@retval", SqlDbType.Int, 0, ParameterDirection.Output, null);
               BaseDataAccess.SetCommandType(sqlCmd,CommandType.StoredProcedure, "DepositSlip_Create");
               return sqlCmd;
          }

          private static SqlCommand createUpdateDepositSlipCommand(DepositSlip aDepositSlip)
          {

               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ID", SqlDbType.Int, 0, ParameterDirection.Input, aDepositSlip.DepositSlipKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@CustomerKey", SqlDbType.Int, 0, ParameterDirection.Input, aDepositSlip.CustomerKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@RoutingNumber", SqlDbType.VarChar, 20, ParameterDirection.Input, aDepositSlip.RoutingNumber);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@AccountNumber", SqlDbType.VarChar, 20, ParameterDirection.Input, aDepositSlip.AccountNumber);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Fraction", SqlDbType.VarChar, 20, ParameterDirection.Input, aDepositSlip.Fraction);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Line1", SqlDbType.VarChar, 100, ParameterDirection.Input, aDepositSlip.Line1);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Line2", SqlDbType.VarChar, 100, ParameterDirection.Input, aDepositSlip.Line2);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Line3", SqlDbType.VarChar, 100, ParameterDirection.Input, aDepositSlip.Line3);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Line4", SqlDbType.VarChar, 100, ParameterDirection.Input, aDepositSlip.Line4);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Line5", SqlDbType.VarChar, 100, ParameterDirection.Input, aDepositSlip.Line5);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@BankInfoLine1", SqlDbType.VarChar, 35, ParameterDirection.Input, aDepositSlip.BankInfoLine1);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@BankInfoLine2", SqlDbType.VarChar, 35, ParameterDirection.Input, aDepositSlip.BankInfoLine2);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@BankInfoLine3", SqlDbType.VarChar, 35, ParameterDirection.Input, aDepositSlip.BankInfoLine3);
               BaseDataAccess.SetCommandType(sqlCmd,CommandType.StoredProcedure, "DepositSlip_Update");
               return sqlCmd;
          }
          private static int updateDepositSlip(DepositSlip aDepositSlip)
          {

               SqlCommand sqlCmd = createUpdateDepositSlipCommand(aDepositSlip);

               BaseDataAccess.ExecuteScalarCmd(sqlCmd);
               return aDepositSlip.DepositSlipKey;
          }
     }
}
