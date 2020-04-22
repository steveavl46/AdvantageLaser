using System;
using System.Data;
using System.Data.SqlClient;
using AdvLaser.AdvLaserObjects;
using System.Collections;


namespace AdvLaser.AdvLaserDataAccess
{

     public static class ShippingTypeDataAccess
     {
          public static int SaveShippingType(ShippingType aShippingType)
          {
               if(aShippingType.ShippingTypeKey == 0)
               {
                    return createNewShippingType(aShippingType);
               }
               else
               {
                    return updateShippingType(aShippingType);
               }
          }

          public static SqlCommand SaveShippingTypeCommand(ShippingType aShippingType)
          {
               if(aShippingType.ShippingTypeKey == 0)
               {
                    return createNewShippingTypeCommand(aShippingType);
               }
               else
               {
                    return createUpdateShippingTypeCommand(aShippingType);
               }
          }

          public static ShippingType GetOne(int aShippingTypeKey)
          {
               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Id", SqlDbType.Int, 0, ParameterDirection.Input, aShippingTypeKey);
               BaseDataAccess.SetCommandType( sqlCmd, CommandType.StoredProcedure, "ShippingType_GetOne");
               BaseDataAccess.GenerateObjectFromReader sqlData = new BaseDataAccess.GenerateObjectFromReader (CreateShippingType);
               ShippingType aShippingType = (ShippingType) BaseDataAccess.ExecuteObjectReader(sqlCmd, sqlData);
               return aShippingType;
          }

          public static Object CreateShippingType (SqlDataReader returnData)
          {
               ShippingType aShippingType = null;

               while (returnData.Read()) 
               {
                    aShippingType = new ShippingType();
                    aShippingType.ShippingTypeKey = (int)returnData["ShippingTypeKey"];
                    aShippingType.DisplayOrder = (int)returnData["DisplayOrder"];
                    aShippingType.Description = (string)returnData["Description"];
                    aShippingType.IsActive = (bool)returnData["IsActive"];
                    aShippingType.BillAtActualCharges = (bool)returnData["BillAtActualCharges"];
                    aShippingType.AdditionalCharge = (decimal)returnData["AdditionalCharge"];
               }
               return aShippingType;
          }

          private static int createNewShippingType(ShippingType aShippingType)
          {

               SqlCommand sqlCmd = createNewShippingTypeCommand(aShippingType);

               BaseDataAccess.ExecuteScalarCmd(sqlCmd);
               return ((int)sqlCmd.Parameters["@retval"].Value); 
          }

          private static SqlCommand createNewShippingTypeCommand(ShippingType aShippingType)
          {

               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@DisplayOrder", SqlDbType.Int, 0, ParameterDirection.Input, aShippingType.DisplayOrder);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Description", SqlDbType.VarChar, 100, ParameterDirection.Input, aShippingType.Description);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@IsActive", SqlDbType.Bit, 0, ParameterDirection.Input, aShippingType.IsActive);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@AdditionalCharge", SqlDbType.Float, 18, ParameterDirection.Input, aShippingType.AdditionalCharge);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@retval", SqlDbType.Int, 0, ParameterDirection.Output, null);
               BaseDataAccess.SetCommandType(sqlCmd,CommandType.StoredProcedure, "ShippingType_Create");
               return sqlCmd;
          }

          private static SqlCommand createUpdateShippingTypeCommand(ShippingType aShippingType)
          {

               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ID", SqlDbType.Int, 0, ParameterDirection.Input, aShippingType.ShippingTypeKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@DisplayOrder", SqlDbType.Int, 0, ParameterDirection.Input, aShippingType.DisplayOrder);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Description", SqlDbType.VarChar, 100, ParameterDirection.Input, aShippingType.Description);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@IsActive", SqlDbType.Bit, 0, ParameterDirection.Input, aShippingType.IsActive);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@AdditionalCharge", SqlDbType.Float , 18, ParameterDirection.Input, aShippingType.AdditionalCharge);
               BaseDataAccess.SetCommandType(sqlCmd,CommandType.StoredProcedure, "ShippingType_Update");
               return sqlCmd;
          }
          private static int updateShippingType(ShippingType aShippingType)
          {

               SqlCommand sqlCmd = createUpdateShippingTypeCommand(aShippingType);

               BaseDataAccess.ExecuteScalarCmd(sqlCmd);
               return aShippingType.ShippingTypeKey;
          }

          public static ArrayList GetShippingTypeList(string aSQL)
          {
              ArrayList list = new ArrayList();
              SqlCommand sqlCmd = new SqlCommand();
              BaseDataAccess.SetCommandType(sqlCmd, CommandType.Text, aSQL);
              using (SqlConnection cn = new SqlConnection(BaseDataAccess.ConnectionString))
              {
                  sqlCmd.Connection = cn;
                  cn.Open();
                  SqlDataReader reader = sqlCmd.ExecuteReader();

                  ShippingType aShippingType = null;

                  while (reader.Read())
                  {
                      aShippingType = new ShippingType();
                      aShippingType.ShippingTypeKey = (int)reader["ShippingTypeKey"];
                      aShippingType.Description = (string)reader["Description"];
                      aShippingType.AdditionalCharge = (decimal)reader["AdditionalCharge"];
                      aShippingType.IsActive = (bool)reader["IsActive"];
                      aShippingType.BillAtActualCharges = (bool)reader["BillAtActualCharges"];
                      list.Add(aShippingType);
                  }


              }
              return list;
          }
     }
}
