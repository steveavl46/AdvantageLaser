using System;
using System.Data;
using System.Data.SqlClient;
using AdvLaser.AdvLaserObjects;


namespace AdvLaser.AdvLaserDataAccess
{

     public static class ShippingRateGroupDataAccess
     {
          public static int SaveShippingRateGroup(ShippingRateGroup aShippingRateGroup)
          {
               if(aShippingRateGroup.ShippingRateGroupKey == 0)
               {
                    return createNewShippingRateGroup(aShippingRateGroup);
               }
               else
               {
                    return updateShippingRateGroup(aShippingRateGroup);
               }
          }

          public static SqlCommand SaveShippingRateGroupCommand(ShippingRateGroup aShippingRateGroup)
          {
               if(aShippingRateGroup.ShippingRateGroupKey == 0)
               {
                    return createNewShippingRateGroupCommand(aShippingRateGroup);
               }
               else
               {
                    return createUpdateShippingRateGroupCommand(aShippingRateGroup);
               }
          }

          public static ShippingRateGroup GetOne(int aShippingRateGroupKey)
          {
               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Id", SqlDbType.Int, 0, ParameterDirection.Input, aShippingRateGroupKey);
               BaseDataAccess.SetCommandType( sqlCmd, CommandType.StoredProcedure, "ShippingRateGroup_GetOne");
               BaseDataAccess.GenerateObjectFromReader sqlData = new BaseDataAccess.GenerateObjectFromReader (CreateShippingRateGroup);
               ShippingRateGroup aShippingRateGroup = (ShippingRateGroup) BaseDataAccess.ExecuteObjectReader(sqlCmd, sqlData);
               return aShippingRateGroup;
          }

          public static Object CreateShippingRateGroup (SqlDataReader returnData)
          {
               ShippingRateGroup aShippingRateGroup = null;

               while (returnData.Read()) 
               {
                    aShippingRateGroup = new ShippingRateGroup();
                    aShippingRateGroup.ShippingRateGroupKey = (int)returnData["ShippingRateGroupKey"];
                    aShippingRateGroup.Description = (string)returnData["Description"];
               }
               return aShippingRateGroup;
          }

          private static int createNewShippingRateGroup(ShippingRateGroup aShippingRateGroup)
          {

               SqlCommand sqlCmd = createNewShippingRateGroupCommand(aShippingRateGroup);

               BaseDataAccess.ExecuteScalarCmd(sqlCmd);
               return ((int)sqlCmd.Parameters["@retval"].Value); 
          }

          private static SqlCommand createNewShippingRateGroupCommand(ShippingRateGroup aShippingRateGroup)
          {

               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Description", SqlDbType.VarChar, 50, ParameterDirection.Input, aShippingRateGroup.Description);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@retval", SqlDbType.Int, 0, ParameterDirection.Output, null);
               BaseDataAccess.SetCommandType(sqlCmd,CommandType.StoredProcedure, "ShippingRateGroup_Create");
               return sqlCmd;
          }

          private static SqlCommand createUpdateShippingRateGroupCommand(ShippingRateGroup aShippingRateGroup)
          {

               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ID", SqlDbType.Int, 0, ParameterDirection.Input, aShippingRateGroup.ShippingRateGroupKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Description", SqlDbType.VarChar, 50, ParameterDirection.Input, aShippingRateGroup.Description);
               BaseDataAccess.SetCommandType(sqlCmd,CommandType.StoredProcedure, "ShippingRateGroup_Update");
               return sqlCmd;
          }
          private static int updateShippingRateGroup(ShippingRateGroup aShippingRateGroup)
          {

               SqlCommand sqlCmd = createUpdateShippingRateGroupCommand(aShippingRateGroup);

               BaseDataAccess.ExecuteScalarCmd(sqlCmd);
               return aShippingRateGroup.ShippingRateGroupKey;
          }
     }
}
