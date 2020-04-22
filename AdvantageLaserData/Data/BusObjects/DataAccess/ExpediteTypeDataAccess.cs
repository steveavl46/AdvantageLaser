using System;
using System.Data;
using System.Data.SqlClient;
using AdvLaser.AdvLaserObjects;
using System.Collections;


namespace AdvLaser.AdvLaserDataAccess
{

     public static class ExpediteTypeDataAccess
     {
          public static int SaveExpediteType(ExpediteType aExpediteType)
          {
               if(aExpediteType.ExpediteTypeKey == 0)
               {
                    return createNewExpediteType(aExpediteType);
               }
               else
               {
                    return updateExpediteType(aExpediteType);
               }
          }

          public static SqlCommand SaveExpediteTypeCommand(ExpediteType aExpediteType)
          {
               if(aExpediteType.ExpediteTypeKey == 0)
               {
                    return createNewExpediteTypeCommand(aExpediteType);
               }
               else
               {
                    return createUpdateExpediteTypeCommand(aExpediteType);
               }
          }

          public static ExpediteType GetOne(int aExpediteTypeKey)
          {
               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Id", SqlDbType.Int, 0, ParameterDirection.Input, aExpediteTypeKey);
               BaseDataAccess.SetCommandType( sqlCmd, CommandType.StoredProcedure, "ExpediteType_GetOne");
               BaseDataAccess.GenerateObjectFromReader sqlData = new BaseDataAccess.GenerateObjectFromReader (CreateExpediteType);
               ExpediteType aExpediteType = (ExpediteType) BaseDataAccess.ExecuteObjectReader(sqlCmd, sqlData);
               return aExpediteType;
          }

          public static Object CreateExpediteType (SqlDataReader returnData)
          {
               ExpediteType aExpediteType = null;

               while (returnData.Read()) 
               {
                    aExpediteType = new ExpediteType();
                    aExpediteType.ExpediteTypeKey = (int)returnData["ExpediteTypeKey"];
                    aExpediteType.DisplayOrder = (int)returnData["DisplayOrder"];
                    aExpediteType.Description = (string)returnData["Description"];
                    aExpediteType.IsActive = (bool)returnData["IsActive"];
                    aExpediteType.AdditionalCharge = (decimal)returnData["AdditionalCharge"];
               }
               return aExpediteType;
          }

          private static int createNewExpediteType(ExpediteType aExpediteType)
          {

               SqlCommand sqlCmd = createNewExpediteTypeCommand(aExpediteType);

               BaseDataAccess.ExecuteScalarCmd(sqlCmd);
               return ((int)sqlCmd.Parameters["@retval"].Value); 
          }

          private static SqlCommand createNewExpediteTypeCommand(ExpediteType aExpediteType)
          {

               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@DisplayOrder", SqlDbType.Int, 0, ParameterDirection.Input, aExpediteType.DisplayOrder);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Description", SqlDbType.VarChar, 100, ParameterDirection.Input, aExpediteType.Description);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@IsActive", SqlDbType.Bit, 0, ParameterDirection.Input, aExpediteType.IsActive);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@AdditionalCharge", SqlDbType.Float, 18, ParameterDirection.Input, aExpediteType.AdditionalCharge);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@retval", SqlDbType.Int, 0, ParameterDirection.Output, null);
               BaseDataAccess.SetCommandType(sqlCmd,CommandType.StoredProcedure, "ExpediteType_Create");
               return sqlCmd;
          }

          private static SqlCommand createUpdateExpediteTypeCommand(ExpediteType aExpediteType)
          {

               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ID", SqlDbType.Int, 0, ParameterDirection.Input, aExpediteType.ExpediteTypeKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@DisplayOrder", SqlDbType.Int, 0, ParameterDirection.Input, aExpediteType.DisplayOrder);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Description", SqlDbType.VarChar, 100, ParameterDirection.Input, aExpediteType.Description);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@IsActive", SqlDbType.Bit, 0, ParameterDirection.Input, aExpediteType.IsActive);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@AdditionalCharge", SqlDbType.Float , 18, ParameterDirection.Input, aExpediteType.AdditionalCharge);
               BaseDataAccess.SetCommandType(sqlCmd,CommandType.StoredProcedure, "ExpediteType_Update");
               return sqlCmd;
          }
          private static int updateExpediteType(ExpediteType aExpediteType)
          {

               SqlCommand sqlCmd = createUpdateExpediteTypeCommand(aExpediteType);

               BaseDataAccess.ExecuteScalarCmd(sqlCmd);
               return aExpediteType.ExpediteTypeKey;
          }

          public static ArrayList GetExpediteTypeList(string aSQL)
          {
              ArrayList list = new ArrayList();
              SqlCommand sqlCmd = new SqlCommand();
              BaseDataAccess.SetCommandType(sqlCmd, CommandType.Text, aSQL);
              using (SqlConnection cn = new SqlConnection(BaseDataAccess.ConnectionString))
              {
                  sqlCmd.Connection = cn;
                  cn.Open();
                  SqlDataReader reader = sqlCmd.ExecuteReader();

                  ExpediteType aExpediteType = null;

                  while (reader.Read())
                  {
                      aExpediteType = new ExpediteType();
                      aExpediteType.ExpediteTypeKey = (int)reader["ExpediteTypeKey"];
                      aExpediteType.Description = (string)reader["Description"];
                      aExpediteType.AdditionalCharge = (decimal)reader["AdditionalCharge"];
                      aExpediteType.IsActive = (bool)reader["IsActive"];
                      list.Add(aExpediteType);
                  }


              }
              return list;
          }
     }
}
