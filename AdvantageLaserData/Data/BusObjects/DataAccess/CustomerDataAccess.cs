using System;
using System.Data;
using System.Data.SqlClient;
using AdvLaser.AdvLaserObjects;
using AdvLaser.Logging;

namespace AdvLaser.AdvLaserDataAccess
{

     public static class CustomerDataAccess 
     {
          public static int SaveCustomer(Customer aCustomer)
          {
               if(aCustomer.CustomerKey == 0)
               {
                    return createNewCustomer(aCustomer);
               }
               else
               {
                    return updateCustomer(aCustomer);
               }
          }

          public static SqlCommand SaveCustomerCommand(Customer aCustomer)
          {
               if(aCustomer.CustomerKey == 0)
               {
                    return createNewCustomerCommand(aCustomer);
               }
               else
               {
                    return createUpdateCustomerCommand(aCustomer);
               }
          }

          public static Customer GetOne(int aCustomerKey)
          {
               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Id", SqlDbType.Int, 0, ParameterDirection.Input, aCustomerKey);
               BaseDataAccess.SetCommandType( sqlCmd, CommandType.StoredProcedure, "Customer_GetOne");
               BaseDataAccess.GenerateObjectFromReader sqlData = new BaseDataAccess.GenerateObjectFromReader (CreateCustomer);
               Customer aCustomer = (Customer) BaseDataAccess.ExecuteObjectReader(sqlCmd, sqlData);
               return aCustomer;
          }

          public static Customer GetOne(string aEmailAddress)
          {
              string aSqlStmt = "select * from customer where emailaddress = '" + aEmailAddress + "'";
              SqlCommand sqlCmd = new SqlCommand();
              BaseDataAccess.SetCommandType(sqlCmd, CommandType.Text, aSqlStmt);
              BaseDataAccess.GenerateObjectFromReader sqlData = new BaseDataAccess.GenerateObjectFromReader(CreateCustomer);
              Customer aCustomer = (Customer)BaseDataAccess.ExecuteObjectReader(sqlCmd, sqlData);
              return aCustomer;
          }

          public static Object CreateCustomer (SqlDataReader returnData)
          {
               Customer aCustomer = null;

               while (returnData.Read()) 
               {
                    aCustomer = new Customer();
                    aCustomer.CustomerKey = (int)returnData["CustomerKey"];
                    aCustomer.FirstName = (string)returnData["FirstName"];
                    aCustomer.LastName = (string)returnData["LastName"];
                    aCustomer.BusinessName = BaseDataAccess.GetString(returnData["BusinessName"]);
                    aCustomer.EMailAddress = BaseDataAccess.GetString(returnData["EMailAddress"]);
                    aCustomer.AlternateEMailAddress = BaseDataAccess.GetString(returnData["AlternateEMailAddress"]);
                    aCustomer.DayPhone = BaseDataAccess.GetString(returnData["DayPhone"]);
                    aCustomer.EveningPhone = BaseDataAccess.GetString(returnData["EveningPhone"]);
                    aCustomer.CellPhone = BaseDataAccess.GetString(returnData["CellPhone"]);
                    aCustomer.FaxNumber = BaseDataAccess.GetString(returnData["FaxNumber"]);
               }
               return aCustomer;
          }

          private static int createNewCustomer(Customer aCustomer)
          {

               SqlCommand sqlCmd = createNewCustomerCommand(aCustomer);

               BaseDataAccess.ExecuteScalarCmd(sqlCmd);
               return ((int)sqlCmd.Parameters["@retval"].Value); 
          }

          private static SqlCommand createNewCustomerCommand(Customer aCustomer)
          {

               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@FirstName", SqlDbType.VarChar, 100, ParameterDirection.Input, aCustomer.FirstName);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@LastName", SqlDbType.VarChar, 100, ParameterDirection.Input, aCustomer.LastName);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@BusinessName", SqlDbType.VarChar, 100, ParameterDirection.Input, aCustomer.BusinessName);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@EMailAddress", SqlDbType.VarChar, 100, ParameterDirection.Input, aCustomer.EMailAddress);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@AlternateEMailAddress", SqlDbType.VarChar, 100, ParameterDirection.Input, aCustomer.AlternateEMailAddress);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@DayPhone", SqlDbType.VarChar, 30, ParameterDirection.Input, aCustomer.DayPhone);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@EveningPhone", SqlDbType.VarChar, 30, ParameterDirection.Input, aCustomer.EveningPhone);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@CellPhone", SqlDbType.VarChar, 30, ParameterDirection.Input, aCustomer.CellPhone);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@FaxNumber", SqlDbType.VarChar, 30, ParameterDirection.Input, aCustomer.FaxNumber);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@retval", SqlDbType.Int, 0, ParameterDirection.Output, null);
               BaseDataAccess.SetCommandType(sqlCmd,CommandType.StoredProcedure, "Customer_Create");
               return sqlCmd;
          }

          private static SqlCommand createUpdateCustomerCommand(Customer aCustomer)
          {

               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ID", SqlDbType.Int, 0, ParameterDirection.Input, aCustomer.CustomerKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@FirstName", SqlDbType.VarChar, 100, ParameterDirection.Input, aCustomer.FirstName);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@LastName", SqlDbType.VarChar, 100, ParameterDirection.Input, aCustomer.LastName);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@BusinessName", SqlDbType.VarChar, 100, ParameterDirection.Input, aCustomer.BusinessName);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@EMailAddress", SqlDbType.VarChar, 100, ParameterDirection.Input, aCustomer.EMailAddress);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@AlternateEMailAddress", SqlDbType.VarChar, 100, ParameterDirection.Input, aCustomer.AlternateEMailAddress);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@DayPhone", SqlDbType.VarChar, 30, ParameterDirection.Input, aCustomer.DayPhone);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@EveningPhone", SqlDbType.VarChar, 30, ParameterDirection.Input, aCustomer.EveningPhone);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@CellPhone", SqlDbType.VarChar, 30, ParameterDirection.Input, aCustomer.CellPhone);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@FaxNumber", SqlDbType.VarChar, 30, ParameterDirection.Input, aCustomer.FaxNumber);
               BaseDataAccess.SetCommandType(sqlCmd,CommandType.StoredProcedure, "Customer_Update");
               return sqlCmd;
          }
          private static int updateCustomer(Customer aCustomer)
          {

               SqlCommand sqlCmd = createUpdateCustomerCommand(aCustomer);

               BaseDataAccess.ExecuteScalarCmd(sqlCmd);
               return aCustomer.CustomerKey;
          }
     }
}
