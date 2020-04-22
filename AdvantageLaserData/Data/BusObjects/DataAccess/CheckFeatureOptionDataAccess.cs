using System;
using System.Data;
using System.Data.SqlClient;
using AdvLaser.AdvLaserObjects;
using System.Collections;


namespace AdvLaser.AdvLaserDataAccess
{

     public static class CheckFeatureOptionDataAccess
     {
          public static int SaveCheckFeatureOption(CheckFeatureOption aCheckFeatureOption)
          {
               if(aCheckFeatureOption.CheckFeatureOptionKey == 0)
               {
                    return createNewCheckFeatureOption(aCheckFeatureOption);
               }
               else
               {
                    return updateCheckFeatureOption(aCheckFeatureOption);
               }
          }

          public static SqlCommand SaveCheckFeatureOptionCommand(CheckFeatureOption aCheckFeatureOption)
          {
               if(aCheckFeatureOption.CheckFeatureOptionKey == 0)
               {
                    return createNewCheckFeatureOptionCommand(aCheckFeatureOption);
               }
               else
               {
                    return createUpdateCheckFeatureOptionCommand(aCheckFeatureOption);
               }
          }

          public static CheckFeatureOption GetOne(int aCheckFeatureOptionKey)
          {
               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Id", SqlDbType.Int, 0, ParameterDirection.Input, aCheckFeatureOptionKey);
               BaseDataAccess.SetCommandType( sqlCmd, CommandType.StoredProcedure, "CheckFeatureOption_GetOne");
               BaseDataAccess.GenerateObjectFromReader sqlData = new BaseDataAccess.GenerateObjectFromReader (CreateCheckFeatureOption);
               CheckFeatureOption aCheckFeatureOption = (CheckFeatureOption) BaseDataAccess.ExecuteObjectReader(sqlCmd, sqlData);
               return aCheckFeatureOption;
          }

          public static Object CreateCheckFeatureOption (SqlDataReader returnData)
          {
               CheckFeatureOption aCheckFeatureOption = null;

               while (returnData.Read()) 
               {
                    aCheckFeatureOption = new CheckFeatureOption();
                    aCheckFeatureOption.CheckFeatureOptionKey = (int)returnData["CheckFeatureOptionKey"];
                    aCheckFeatureOption.Description = (string)returnData["Description"];
               }
               return aCheckFeatureOption;
          }

          private static int createNewCheckFeatureOption(CheckFeatureOption aCheckFeatureOption)
          {

               SqlCommand sqlCmd = createNewCheckFeatureOptionCommand(aCheckFeatureOption);

               BaseDataAccess.ExecuteScalarCmd(sqlCmd);
               return ((int)sqlCmd.Parameters["@retval"].Value); 
          }

          private static SqlCommand createNewCheckFeatureOptionCommand(CheckFeatureOption aCheckFeatureOption)
          {

               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Description", SqlDbType.VarChar, 50, ParameterDirection.Input, aCheckFeatureOption.Description);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@retval", SqlDbType.Int, 0, ParameterDirection.Output, null);
               BaseDataAccess.SetCommandType(sqlCmd,CommandType.StoredProcedure, "CheckFeatureOption_Create");
               return sqlCmd;
          }

          private static SqlCommand createUpdateCheckFeatureOptionCommand(CheckFeatureOption aCheckFeatureOption)
          {

               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ID", SqlDbType.Int, 0, ParameterDirection.Input, aCheckFeatureOption.CheckFeatureOptionKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Description", SqlDbType.VarChar, 50, ParameterDirection.Input, aCheckFeatureOption.Description);
               BaseDataAccess.SetCommandType(sqlCmd,CommandType.StoredProcedure, "CheckFeatureOption_Update");
               return sqlCmd;
          }
          private static int updateCheckFeatureOption(CheckFeatureOption aCheckFeatureOption)
          {

               SqlCommand sqlCmd = createUpdateCheckFeatureOptionCommand(aCheckFeatureOption);

               BaseDataAccess.ExecuteScalarCmd(sqlCmd);
               return aCheckFeatureOption.CheckFeatureOptionKey;
          }

          public static ArrayList GetList(string aSQL)
          {
              ArrayList list = new ArrayList();
              SqlCommand sqlCmd = new SqlCommand();
              BaseDataAccess.SetCommandType(sqlCmd, CommandType.Text, aSQL);
              using (SqlConnection cn = new SqlConnection(BaseDataAccess.ConnectionString))
              {
                  sqlCmd.Connection = cn;
                  cn.Open();
                  SqlDataReader reader = sqlCmd.ExecuteReader();
                  CheckFeatureOption aCheckFeatureOption = null;
                  while (reader.Read())
                  {
                      aCheckFeatureOption = new CheckFeatureOption();
                      aCheckFeatureOption.CheckFeatureOptionKey = (int)reader["CheckFeatureOptionKey"];
                      aCheckFeatureOption.Description = (string)reader["Description"];
                      list.Add(aCheckFeatureOption);
                  }
              }
              return list;
          }
     }
}
