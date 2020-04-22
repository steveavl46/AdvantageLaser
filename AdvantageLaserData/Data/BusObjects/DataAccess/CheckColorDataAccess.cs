using System;
using System.Data;
using System.Data.SqlClient;
using AdvLaser.AdvLaserObjects;
using System.Collections;


namespace AdvLaser.AdvLaserDataAccess
{

     public static class CheckColorDataAccess
     {
          public static int SaveCheckColor(CheckColor aCheckColor)
          {
               if(aCheckColor.CheckColorKey == 0)
               {
                    return createNewCheckColor(aCheckColor);
               }
               else
               {
                    return updateCheckColor(aCheckColor);
               }
          }

          public static SqlCommand SaveCheckColorCommand(CheckColor aCheckColor)
          {
               if(aCheckColor.CheckColorKey == 0)
               {
                    return createNewCheckColorCommand(aCheckColor);
               }
               else
               {
                    return createUpdateCheckColorCommand(aCheckColor);
               }
          }

          public static CheckColor GetOne(int aCheckColorKey)
          {
               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Id", SqlDbType.Int, 0, ParameterDirection.Input, aCheckColorKey);
               BaseDataAccess.SetCommandType( sqlCmd, CommandType.StoredProcedure, "CheckColor_GetOne");
               BaseDataAccess.GenerateObjectFromReader sqlData = new BaseDataAccess.GenerateObjectFromReader (CreateCheckColor);
               CheckColor aCheckColor = (CheckColor) BaseDataAccess.ExecuteObjectReader(sqlCmd, sqlData);
               return aCheckColor;
          }

          public static Object CreateCheckColor (SqlDataReader returnData)
          {
               CheckColor aCheckColor = null;

               while (returnData.Read()) 
               {
                    aCheckColor = new CheckColor();
                    aCheckColor.CheckColorKey = (int)returnData["CheckColorKey"];
                    aCheckColor.ProductTypeKey = (int)returnData["ProductTypeKey"];
                    aCheckColor.Description = (string)returnData["Description"];
                    aCheckColor.ImagePath = (string)returnData["ImagePath"];
                    aCheckColor.FullCheckImagePath = (string)returnData["FullCheckImagePath"];
                    aCheckColor.PartNumber = (string)returnData["PartNumber"];
               }
               return aCheckColor;
          }

          private static int createNewCheckColor(CheckColor aCheckColor)
          {

               SqlCommand sqlCmd = createNewCheckColorCommand(aCheckColor);

               BaseDataAccess.ExecuteScalarCmd(sqlCmd);
               return ((int)sqlCmd.Parameters["@retval"].Value); 
          }

          private static SqlCommand createNewCheckColorCommand(CheckColor aCheckColor)
          {

               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ProductTypeKey", SqlDbType.Int, 0, ParameterDirection.Input, aCheckColor.ProductTypeKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Description", SqlDbType.VarChar, 50, ParameterDirection.Input, aCheckColor.Description);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ImagePath", SqlDbType.VarChar, 50, ParameterDirection.Input, aCheckColor.ImagePath);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@FullCheckImagePath", SqlDbType.VarChar, 50, ParameterDirection.Input, aCheckColor.FullCheckImagePath);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@PartNumber", SqlDbType.VarChar, 50, ParameterDirection.Input, aCheckColor.PartNumber);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@retval", SqlDbType.Int, 0, ParameterDirection.Output, null);
               BaseDataAccess.SetCommandType(sqlCmd,CommandType.StoredProcedure, "CheckColor_Create");
               return sqlCmd;
          }

          private static SqlCommand createUpdateCheckColorCommand(CheckColor aCheckColor)
          {

               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ID", SqlDbType.Int, 0, ParameterDirection.Input, aCheckColor.CheckColorKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ProductTypeKey", SqlDbType.Int, 0, ParameterDirection.Input, aCheckColor.ProductTypeKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Description", SqlDbType.VarChar, 50, ParameterDirection.Input, aCheckColor.Description);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ImagePath", SqlDbType.VarChar, 50, ParameterDirection.Input, aCheckColor.ImagePath);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@FullCheckImagePath", SqlDbType.VarChar, 50, ParameterDirection.Input, aCheckColor.FullCheckImagePath);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@PartNumber", SqlDbType.VarChar, 50, ParameterDirection.Input, aCheckColor.PartNumber);
               BaseDataAccess.SetCommandType(sqlCmd,CommandType.StoredProcedure, "CheckColor_Update");
               return sqlCmd;
          }
          private static int updateCheckColor(CheckColor aCheckColor)
          {
               SqlCommand sqlCmd = createUpdateCheckColorCommand(aCheckColor);
               BaseDataAccess.ExecuteScalarCmd(sqlCmd);
               return aCheckColor.CheckColorKey;
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
                  CheckColor checkColor = null;
                  while (reader.Read())
                  {
                      checkColor = new CheckColor();
                      checkColor.CheckColorKey = (int)reader["CheckColorKey"];
                      checkColor.ProductTypeKey = (int)reader["ProductTypeKey"];
                      checkColor.Description = (string)reader["Description"];
                      checkColor.ImagePath = (string)reader["ImagePath"];
                      checkColor.FullCheckImagePath = (string)reader["FullCheckImagePath"];
                      checkColor.PartNumber = (string)reader["PartNumber"];
                      list.Add(checkColor);
                  }
              }
              return list;
          }
     }
}
