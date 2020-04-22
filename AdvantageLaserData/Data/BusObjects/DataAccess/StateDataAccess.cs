using System;
using System.Data;
using System.Data.SqlClient;
using AdvLaser.AdvLaserObjects;


namespace AdvLaser.AdvLaserDataAccess
{

     public static class StateDataAccess
     {
          public static int SaveState(State aState)
          {
               if(aState.StateKey == 0)
               {
                    return createNewState(aState);
               }
               else
               {
                    return updateState(aState);
               }
          }

          public static SqlCommand SaveStateCommand(State aState)
          {
               if(aState.StateKey == 0)
               {
                    return createNewStateCommand(aState);
               }
               else
               {
                    return createUpdateStateCommand(aState);
               }
          }

          public static State GetOne(int aStateKey)
          {
               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Id", SqlDbType.Int, 0, ParameterDirection.Input, aStateKey);
               BaseDataAccess.SetCommandType( sqlCmd, CommandType.StoredProcedure, "State_GetOne");
               BaseDataAccess.GenerateObjectFromReader sqlData = new BaseDataAccess.GenerateObjectFromReader (CreateState);
               State aState = (State) BaseDataAccess.ExecuteObjectReader(sqlCmd, sqlData);
               return aState;
          }

          public static State GetOne(string aSqlStmt)
          {
              SqlCommand sqlCmd = new SqlCommand();
              BaseDataAccess.SetCommandType(sqlCmd, CommandType.Text, aSqlStmt);
              BaseDataAccess.GenerateObjectFromReader sqlData = new BaseDataAccess.GenerateObjectFromReader(CreateState);
              State aState = (State)BaseDataAccess.ExecuteObjectReader(sqlCmd, sqlData);
              return aState;
          }

          public static Object CreateState (SqlDataReader returnData)
          {
               State aState = null;

               while (returnData.Read()) 
               {
                    aState = new State();
                    aState.StateKey = (int)returnData["StateKey"];
                    aState.Abbreviation = (string)returnData["Abbreviation"];
                    aState.Name = (string)returnData["Name"];
                    aState.ShippingZoneKey = (int)returnData["ShippingZoneKey"];
               }
               return aState;
          }

          private static int createNewState(State aState)
          {

               SqlCommand sqlCmd = createNewStateCommand(aState);

               BaseDataAccess.ExecuteScalarCmd(sqlCmd);
               return ((int)sqlCmd.Parameters["@retval"].Value); 
          }

          private static SqlCommand createNewStateCommand(State aState)
          {

               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Abbreviation", SqlDbType.VarChar, 2, ParameterDirection.Input, aState.Abbreviation);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Name", SqlDbType.VarChar, 50, ParameterDirection.Input, aState.Name);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ShippingZoneKey", SqlDbType.Int, 0, ParameterDirection.Input, aState.ShippingZoneKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@retval", SqlDbType.Int, 0, ParameterDirection.Output, null);
               BaseDataAccess.SetCommandType(sqlCmd,CommandType.StoredProcedure, "State_Create");
               return sqlCmd;
          }

          private static SqlCommand createUpdateStateCommand(State aState)
          {

               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ID", SqlDbType.Int, 0, ParameterDirection.Input, aState.StateKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Abbreviation", SqlDbType.VarChar, 2, ParameterDirection.Input, aState.Abbreviation);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Name", SqlDbType.VarChar, 50, ParameterDirection.Input, aState.Name);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ShippingZoneKey", SqlDbType.Int, 0, ParameterDirection.Input, aState.ShippingZoneKey);
               BaseDataAccess.SetCommandType(sqlCmd,CommandType.StoredProcedure, "State_Update");
               return sqlCmd;
          }
          private static int updateState(State aState)
          {

               SqlCommand sqlCmd = createUpdateStateCommand(aState);

               BaseDataAccess.ExecuteScalarCmd(sqlCmd);
               return aState.StateKey;
          }
     }
}
