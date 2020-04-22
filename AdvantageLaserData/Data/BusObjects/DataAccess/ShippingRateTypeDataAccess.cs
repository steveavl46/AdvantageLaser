using System;
using System.Data;
using System.Data.SqlClient;
using AdvLaser.AdvLaserObjects;


namespace AdvLaser.AdvLaserDataAccess
{

     public static class ShippingRateTypeDataAccess
     {
          public static int SaveShippingRateType(ShippingRateType aShippingRateType)
          {
               if(aShippingRateType.ShippingRateTypeKey == 0)
               {
                    return createNewShippingRateType(aShippingRateType);
               }
               else
               {
                    return updateShippingRateType(aShippingRateType);
               }
          }

          public static SqlCommand SaveShippingRateTypeCommand(ShippingRateType aShippingRateType)
          {
               if(aShippingRateType.ShippingRateTypeKey == 0)
               {
                    return createNewShippingRateTypeCommand(aShippingRateType);
               }
               else
               {
                    return createUpdateShippingRateTypeCommand(aShippingRateType);
               }
          }

          public static ShippingRateType GetOne(int aShippingRateTypeKey)
          {
               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Id", SqlDbType.Int, 0, ParameterDirection.Input, aShippingRateTypeKey);
               BaseDataAccess.SetCommandType( sqlCmd, CommandType.StoredProcedure, "ShippingRateType_GetOne");
               BaseDataAccess.GenerateObjectFromReader sqlData = new BaseDataAccess.GenerateObjectFromReader (CreateShippingRateType);
               ShippingRateType aShippingRateType = (ShippingRateType) BaseDataAccess.ExecuteObjectReader(sqlCmd, sqlData);
               return aShippingRateType;
          }

          public static Object CreateShippingRateType (SqlDataReader returnData)
          {
               ShippingRateType aShippingRateType = null;

               while (returnData.Read()) 
               {
                    aShippingRateType = new ShippingRateType();
                    aShippingRateType.ShippingRateTypeKey = (int)returnData["ShippingRateTypeKey"];
                    aShippingRateType.Description = (string)returnData["Description"];
               }
               return aShippingRateType;
          }

          private static int createNewShippingRateType(ShippingRateType aShippingRateType)
          {

               SqlCommand sqlCmd = createNewShippingRateTypeCommand(aShippingRateType);

               BaseDataAccess.ExecuteScalarCmd(sqlCmd);
               return ((int)sqlCmd.Parameters["@retval"].Value); 
          }

          private static SqlCommand createNewShippingRateTypeCommand(ShippingRateType aShippingRateType)
          {

               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Description", SqlDbType.VarChar, 50, ParameterDirection.Input, aShippingRateType.Description);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@retval", SqlDbType.Int, 0, ParameterDirection.Output, null);
               BaseDataAccess.SetCommandType(sqlCmd,CommandType.StoredProcedure, "ShippingRateType_Create");
               return sqlCmd;
          }

          private static SqlCommand createUpdateShippingRateTypeCommand(ShippingRateType aShippingRateType)
          {

               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ID", SqlDbType.Int, 0, ParameterDirection.Input, aShippingRateType.ShippingRateTypeKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Description", SqlDbType.VarChar, 50, ParameterDirection.Input, aShippingRateType.Description);
               BaseDataAccess.SetCommandType(sqlCmd,CommandType.StoredProcedure, "ShippingRateType_Update");
               return sqlCmd;
          }
          private static int updateShippingRateType(ShippingRateType aShippingRateType)
          {

               SqlCommand sqlCmd = createUpdateShippingRateTypeCommand(aShippingRateType);

               BaseDataAccess.ExecuteScalarCmd(sqlCmd);
               return aShippingRateType.ShippingRateTypeKey;
          }
     }
}
