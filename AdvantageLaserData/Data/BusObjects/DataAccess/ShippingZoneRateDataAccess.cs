using System;
using System.Data;
using System.Data.SqlClient;
using AdvLaser.AdvLaserObjects;
using System.Collections;


namespace AdvLaser.AdvLaserDataAccess
{

     public static class ShippingZoneRateDataAccess
     {
          public static int SaveShippingZoneRate(ShippingZoneRate aShippingZoneRate)
          {
               if(aShippingZoneRate.ShippingZoneRateKey == 0)
               {
                    return createNewShippingZoneRate(aShippingZoneRate);
               }
               else
               {
                    return updateShippingZoneRate(aShippingZoneRate);
               }
          }

          public static SqlCommand SaveShippingZoneRateCommand(ShippingZoneRate aShippingZoneRate)
          {
               if(aShippingZoneRate.ShippingZoneRateKey == 0)
               {
                    return createNewShippingZoneRateCommand(aShippingZoneRate);
               }
               else
               {
                    return createUpdateShippingZoneRateCommand(aShippingZoneRate);
               }
          }

          public static ShippingZoneRate GetOne(int aShippingZoneRateKey)
          {
               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Id", SqlDbType.Int, 0, ParameterDirection.Input, aShippingZoneRateKey);
               BaseDataAccess.SetCommandType( sqlCmd, CommandType.StoredProcedure, "ShippingZoneRate_GetOne");
               BaseDataAccess.GenerateObjectFromReader sqlData = new BaseDataAccess.GenerateObjectFromReader (CreateShippingZoneRate);
               ShippingZoneRate aShippingZoneRate = (ShippingZoneRate) BaseDataAccess.ExecuteObjectReader(sqlCmd, sqlData);
               return aShippingZoneRate;
          }

          public static ShippingZoneRate GetOne(string aSqlStmt)
          {
              SqlCommand sqlCmd = new SqlCommand();
              BaseDataAccess.SetCommandType(sqlCmd, CommandType.Text, aSqlStmt);
              BaseDataAccess.GenerateObjectFromReader sqlData = new BaseDataAccess.GenerateObjectFromReader(CreateShippingZoneRate);
              ShippingZoneRate aShippingZoneRate = (ShippingZoneRate)BaseDataAccess.ExecuteObjectReader(sqlCmd, sqlData);
              return aShippingZoneRate;
          }

          

          public static Object CreateShippingZoneRate (SqlDataReader returnData)
          {
               ShippingZoneRate aShippingZoneRate = null;

               while (returnData.Read()) 
               {
                    aShippingZoneRate = new ShippingZoneRate();
                    aShippingZoneRate.ShippingZoneRateKey = (int)returnData["ShippingZoneRateKey"];
                    aShippingZoneRate.ShippingZoneKey = (int)returnData["ShippingZoneKey"];
                    aShippingZoneRate.ShippingRateGroupKey = (int)returnData["ShippingRateGroupKey"];
                    aShippingZoneRate.ShippingRateTypeKey = (int)returnData["ShippingRateTypeKey"];
                    aShippingZoneRate.Quantity = (int)returnData["Quantity"];
                    aShippingZoneRate.Rate = (decimal)returnData["Rate"];
               }
               return aShippingZoneRate;
          }

          private static int createNewShippingZoneRate(ShippingZoneRate aShippingZoneRate)
          {

               SqlCommand sqlCmd = createNewShippingZoneRateCommand(aShippingZoneRate);

               BaseDataAccess.ExecuteScalarCmd(sqlCmd);
               return ((int)sqlCmd.Parameters["@retval"].Value); 
          }

          private static SqlCommand createNewShippingZoneRateCommand(ShippingZoneRate aShippingZoneRate)
          {

               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ShippingZoneKey", SqlDbType.Int, 0, ParameterDirection.Input, aShippingZoneRate.ShippingZoneKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ShippingRateGroupKey", SqlDbType.Int, 0, ParameterDirection.Input, aShippingZoneRate.ShippingRateGroupKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ShippingRateTypeKey", SqlDbType.Int, 0, ParameterDirection.Input, aShippingZoneRate.ShippingRateTypeKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Quantity", SqlDbType.Int, 0, ParameterDirection.Input, aShippingZoneRate.Quantity);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Rate",SqlDbType.Float,18, ParameterDirection.Input, aShippingZoneRate.Rate);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@retval", SqlDbType.Int, 0, ParameterDirection.Output, null);
               BaseDataAccess.SetCommandType(sqlCmd,CommandType.StoredProcedure, "ShippingZoneRate_Create");
               return sqlCmd;
          }

          private static SqlCommand createUpdateShippingZoneRateCommand(ShippingZoneRate aShippingZoneRate)
          {

               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ID", SqlDbType.Int, 0, ParameterDirection.Input, aShippingZoneRate.ShippingZoneRateKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ShippingZoneKey", SqlDbType.Int, 0, ParameterDirection.Input, aShippingZoneRate.ShippingZoneKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ShippingRateGroupKey", SqlDbType.Int, 0, ParameterDirection.Input, aShippingZoneRate.ShippingRateGroupKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ShippingRateTypeKey", SqlDbType.Int, 0, ParameterDirection.Input, aShippingZoneRate.ShippingRateTypeKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Quantity", SqlDbType.Int, 0, ParameterDirection.Input, aShippingZoneRate.Quantity);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Rate", SqlDbType.Float, 18, ParameterDirection.Input, aShippingZoneRate.Rate);
               BaseDataAccess.SetCommandType(sqlCmd,CommandType.StoredProcedure, "ShippingZoneRate_Update");
               return sqlCmd;
          }
          private static int updateShippingZoneRate(ShippingZoneRate aShippingZoneRate)
          {

               SqlCommand sqlCmd = createUpdateShippingZoneRateCommand(aShippingZoneRate);

               BaseDataAccess.ExecuteScalarCmd(sqlCmd);
               return aShippingZoneRate.ShippingZoneRateKey;
          }
     }
}
