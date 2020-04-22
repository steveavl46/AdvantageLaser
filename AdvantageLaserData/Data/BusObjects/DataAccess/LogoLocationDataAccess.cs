using System;
using System.Data;
using System.Data.SqlClient;
using AdvLaser.AdvLaserObjects;


namespace AdvLaser.AdvLaserDataAccess
{

     public static class LogoLocationDataAccess
     {
          public static int SaveLogoLocation(LogoLocation aLogoLocation)
          {
               if(aLogoLocation.LogoLocationKey == 0)
               {
                    return createNewLogoLocation(aLogoLocation);
               }
               else
               {
                    return updateLogoLocation(aLogoLocation);
               }
          }

          public static SqlCommand SaveLogoLocationCommand(LogoLocation aLogoLocation)
          {
               if(aLogoLocation.LogoLocationKey == 0)
               {
                    return createNewLogoLocationCommand(aLogoLocation);
               }
               else
               {
                    return createUpdateLogoLocationCommand(aLogoLocation);
               }
          }

          public static LogoLocation GetOne(int aLogoLocationKey)
          {
               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Id", SqlDbType.Int, 0, ParameterDirection.Input, aLogoLocationKey);
               BaseDataAccess.SetCommandType( sqlCmd, CommandType.StoredProcedure, "LogoLocation_GetOne");
               BaseDataAccess.GenerateObjectFromReader sqlData = new BaseDataAccess.GenerateObjectFromReader (CreateLogoLocation);
               LogoLocation aLogoLocation = (LogoLocation) BaseDataAccess.ExecuteObjectReader(sqlCmd, sqlData);
               return aLogoLocation;
          }

          public static Object CreateLogoLocation (SqlDataReader returnData)
          {
               LogoLocation aLogoLocation = null;

               while (returnData.Read()) 
               {
                    aLogoLocation = new LogoLocation();
                    aLogoLocation.LogoLocationKey = (int)returnData["LogoLocationKey"];
                    aLogoLocation.Description = (string)returnData["Description"];
               }
               return aLogoLocation;
          }

          private static int createNewLogoLocation(LogoLocation aLogoLocation)
          {

               SqlCommand sqlCmd = createNewLogoLocationCommand(aLogoLocation);

               BaseDataAccess.ExecuteScalarCmd(sqlCmd);
               return ((int)sqlCmd.Parameters["@retval"].Value); 
          }

          private static SqlCommand createNewLogoLocationCommand(LogoLocation aLogoLocation)
          {

               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Description", SqlDbType.VarChar, 100, ParameterDirection.Input, aLogoLocation.Description);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@retval", SqlDbType.Int, 0, ParameterDirection.Output, null);
               BaseDataAccess.SetCommandType(sqlCmd,CommandType.StoredProcedure, "LogoLocation_Create");
               return sqlCmd;
          }

          private static SqlCommand createUpdateLogoLocationCommand(LogoLocation aLogoLocation)
          {

               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ID", SqlDbType.Int, 0, ParameterDirection.Input, aLogoLocation.LogoLocationKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Description", SqlDbType.VarChar, 100, ParameterDirection.Input, aLogoLocation.Description);
               BaseDataAccess.SetCommandType(sqlCmd,CommandType.StoredProcedure, "LogoLocation_Update");
               return sqlCmd;
          }
          private static int updateLogoLocation(LogoLocation aLogoLocation)
          {

               SqlCommand sqlCmd = createUpdateLogoLocationCommand(aLogoLocation);

               BaseDataAccess.ExecuteScalarCmd(sqlCmd);
               return aLogoLocation.LogoLocationKey;
          }
     }
}
