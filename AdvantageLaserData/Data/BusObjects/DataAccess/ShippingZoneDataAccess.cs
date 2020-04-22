using System;
using System.Data;
using System.Data.SqlClient;
using AdvLaser.AdvLaserObjects;
using System.Collections;


namespace AdvLaser.AdvLaserDataAccess
{

     public static class ShippingZoneDataAccess
     {
          public static int SaveShippingZone(ShippingZone aShippingZone)
          {
               if(aShippingZone.ShippingZoneKey == 0)
               {
                    return createNewShippingZone(aShippingZone);
               }
               else
               {
                    return updateShippingZone(aShippingZone);
               }
          }

          public static SqlCommand SaveShippingZoneCommand(ShippingZone aShippingZone)
          {
               if(aShippingZone.ShippingZoneKey == 0)
               {
                    return createNewShippingZoneCommand(aShippingZone);
               }
               else
               {
                    return createUpdateShippingZoneCommand(aShippingZone);
               }
          }

          public static ShippingZone GetOne(int aShippingZoneKey)
          {
               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Id", SqlDbType.Int, 0, ParameterDirection.Input, aShippingZoneKey);
               BaseDataAccess.SetCommandType( sqlCmd, CommandType.StoredProcedure, "ShippingZone_GetOne");
               BaseDataAccess.GenerateObjectFromReader sqlData = new BaseDataAccess.GenerateObjectFromReader (CreateShippingZone);
               ShippingZone aShippingZone = (ShippingZone) BaseDataAccess.ExecuteObjectReader(sqlCmd, sqlData);
               return aShippingZone;
          }

          public static ArrayList GetShippingZoneList(string aSQL)
          {
              ArrayList list = new ArrayList();
              SqlCommand sqlCmd = new SqlCommand();
              BaseDataAccess.SetCommandType(sqlCmd, CommandType.Text, aSQL);
              using (SqlConnection cn = new SqlConnection(BaseDataAccess.ConnectionString))
              {
                  sqlCmd.Connection = cn;
                  cn.Open();
                  SqlDataReader reader = sqlCmd.ExecuteReader();

                  ShippingZone aShippingZone = null;

                  while (reader.Read())
                  {
                      aShippingZone = new ShippingZone();
                      aShippingZone.ShippingZoneKey = (int)reader["ShippingZoneKey"];
                      aShippingZone.Description = (string)reader["Description"];
                      list.Add(aShippingZone);
                  }
              }
              return list;
          }

          public static Object CreateShippingZone (SqlDataReader returnData)
          {
               ShippingZone aShippingZone = null;

               while (returnData.Read()) 
               {
                    aShippingZone = new ShippingZone();
                    aShippingZone.ShippingZoneKey = (int)returnData["ShippingZoneKey"];
                    aShippingZone.Description = (string)returnData["Description"];
               }
               return aShippingZone;
          }

          private static int createNewShippingZone(ShippingZone aShippingZone)
          {

               SqlCommand sqlCmd = createNewShippingZoneCommand(aShippingZone);

               BaseDataAccess.ExecuteScalarCmd(sqlCmd);
               return ((int)sqlCmd.Parameters["@retval"].Value); 
          }

          private static SqlCommand createNewShippingZoneCommand(ShippingZone aShippingZone)
          {

               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Description", SqlDbType.VarChar, 50, ParameterDirection.Input, aShippingZone.Description);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@retval", SqlDbType.Int, 0, ParameterDirection.Output, null);
               BaseDataAccess.SetCommandType(sqlCmd,CommandType.StoredProcedure, "ShippingZone_Create");
               return sqlCmd;
          }

          private static SqlCommand createUpdateShippingZoneCommand(ShippingZone aShippingZone)
          {

               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ID", SqlDbType.Int, 0, ParameterDirection.Input, aShippingZone.ShippingZoneKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Description", SqlDbType.VarChar, 50, ParameterDirection.Input, aShippingZone.Description);
               BaseDataAccess.SetCommandType(sqlCmd,CommandType.StoredProcedure, "ShippingZone_Update");
               return sqlCmd;
          }
          private static int updateShippingZone(ShippingZone aShippingZone)
          {

               SqlCommand sqlCmd = createUpdateShippingZoneCommand(aShippingZone);

               BaseDataAccess.ExecuteScalarCmd(sqlCmd);
               return aShippingZone.ShippingZoneKey;
          }
     }
}
