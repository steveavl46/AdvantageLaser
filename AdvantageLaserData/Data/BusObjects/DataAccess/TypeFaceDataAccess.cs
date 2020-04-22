using System;
using System.Data;
using System.Data.SqlClient;
using AdvLaser.AdvLaserObjects;


namespace AdvLaser.AdvLaserDataAccess
{

     public static class TypeFaceDataAccess
     {
          public static int SaveTypeFace(TypeFace aTypeFace)
          {
               if(aTypeFace.TypeFaceKey == 0)
               {
                    return createNewTypeFace(aTypeFace);
               }
               else
               {
                    return updateTypeFace(aTypeFace);
               }
          }

          public static SqlCommand SaveTypeFaceCommand(TypeFace aTypeFace)
          {
               if(aTypeFace.TypeFaceKey == 0)
               {
                    return createNewTypeFaceCommand(aTypeFace);
               }
               else
               {
                    return createUpdateTypeFaceCommand(aTypeFace);
               }
          }

          public static TypeFace GetOne(int aTypeFaceKey)
          {
               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Id", SqlDbType.Int, 0, ParameterDirection.Input, aTypeFaceKey);
               BaseDataAccess.SetCommandType( sqlCmd, CommandType.StoredProcedure, "TypeFace_GetOne");
               BaseDataAccess.GenerateObjectFromReader sqlData = new BaseDataAccess.GenerateObjectFromReader (CreateTypeFace);
               TypeFace aTypeFace = (TypeFace) BaseDataAccess.ExecuteObjectReader(sqlCmd, sqlData);
               return aTypeFace;
          }

          public static Object CreateTypeFace (SqlDataReader returnData)
          {
               TypeFace aTypeFace = null;

               while (returnData.Read()) 
               {
                    aTypeFace = new TypeFace();
                    aTypeFace.TypeFaceKey = (int)returnData["TypeFaceKey"];
                    aTypeFace.Description = (string)returnData["Description"];
               }
               return aTypeFace;
          }

          private static int createNewTypeFace(TypeFace aTypeFace)
          {

               SqlCommand sqlCmd = createNewTypeFaceCommand(aTypeFace);

               BaseDataAccess.ExecuteScalarCmd(sqlCmd);
               return ((int)sqlCmd.Parameters["@retval"].Value); 
          }

          private static SqlCommand createNewTypeFaceCommand(TypeFace aTypeFace)
          {

               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Description", SqlDbType.VarChar, 50, ParameterDirection.Input, aTypeFace.Description);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@retval", SqlDbType.Int, 0, ParameterDirection.Output, null);
               BaseDataAccess.SetCommandType(sqlCmd,CommandType.StoredProcedure, "TypeFace_Create");
               return sqlCmd;
          }

          private static SqlCommand createUpdateTypeFaceCommand(TypeFace aTypeFace)
          {

               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ID", SqlDbType.Int, 0, ParameterDirection.Input, aTypeFace.TypeFaceKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Description", SqlDbType.VarChar, 50, ParameterDirection.Input, aTypeFace.Description);
               BaseDataAccess.SetCommandType(sqlCmd,CommandType.StoredProcedure, "TypeFace_Update");
               return sqlCmd;
          }
          private static int updateTypeFace(TypeFace aTypeFace)
          {

               SqlCommand sqlCmd = createUpdateTypeFaceCommand(aTypeFace);

               BaseDataAccess.ExecuteScalarCmd(sqlCmd);
               return aTypeFace.TypeFaceKey;
          }
     }
}
