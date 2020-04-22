using System;
using System.Data;
using System.Data.SqlClient;
using AdvLaser.AdvLaserObjects;


namespace AdvLaser.AdvLaserDataAccess
{

     public static class AddressTypeDataAccess
     {
          public static int SaveAddressType(AddressType aAddressType)
          {
               if(aAddressType.AddressTypeKey == 0)
               {
                    return createNewAddressType(aAddressType);
               }
               else
               {
                    return updateAddressType(aAddressType);
               }
          }

          public static SqlCommand SaveAddressTypeCommand(AddressType aAddressType)
          {
               if(aAddressType.AddressTypeKey == 0)
               {
                    return createNewAddressTypeCommand(aAddressType);
               }
               else
               {
                    return createUpdateAddressTypeCommand(aAddressType);
               }
          }

          public static AddressType GetOne(int aAddressTypeKey)
          {
               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Id", SqlDbType.Int, 0, ParameterDirection.Input, aAddressTypeKey);
               BaseDataAccess.SetCommandType( sqlCmd, CommandType.StoredProcedure, "AddressType_GetOne");
               BaseDataAccess.GenerateObjectFromReader sqlData = new BaseDataAccess.GenerateObjectFromReader (CreateAddressType);
               AddressType aAddressType = (AddressType) BaseDataAccess.ExecuteObjectReader(sqlCmd, sqlData);
               return aAddressType;
          }

          public static Object CreateAddressType (SqlDataReader returnData)
          {
               AddressType aAddressType = null;

               while (returnData.Read()) 
               {
                    aAddressType = new AddressType();
                    aAddressType.AddressTypeKey = (int)returnData["AddressTypeKey"];
                    aAddressType.Description = (string)returnData["Description"];
               }
               return aAddressType;
          }

          private static int createNewAddressType(AddressType aAddressType)
          {

               SqlCommand sqlCmd = createNewAddressTypeCommand(aAddressType);

               BaseDataAccess.ExecuteScalarCmd(sqlCmd);
               return ((int)sqlCmd.Parameters["@retval"].Value); 
          }

          private static SqlCommand createNewAddressTypeCommand(AddressType aAddressType)
          {

               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Description", SqlDbType.VarChar, 100, ParameterDirection.Input, aAddressType.Description);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@retval", SqlDbType.Int, 0, ParameterDirection.Output, null);
               BaseDataAccess.SetCommandType(sqlCmd,CommandType.StoredProcedure, "AddressType_Create");
               return sqlCmd;
          }

          private static SqlCommand createUpdateAddressTypeCommand(AddressType aAddressType)
          {

               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ID", SqlDbType.Int, 0, ParameterDirection.Input, aAddressType.AddressTypeKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Description", SqlDbType.VarChar, 100, ParameterDirection.Input, aAddressType.Description);
               BaseDataAccess.SetCommandType(sqlCmd,CommandType.StoredProcedure, "AddressType_Update");
               return sqlCmd;
          }
          private static int updateAddressType(AddressType aAddressType)
          {

               SqlCommand sqlCmd = createUpdateAddressTypeCommand(aAddressType);

               BaseDataAccess.ExecuteScalarCmd(sqlCmd);
               return aAddressType.AddressTypeKey;
          }
     }
}
