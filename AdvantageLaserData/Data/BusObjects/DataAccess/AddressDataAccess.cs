using System;
using System.Data;
using System.Data.SqlClient;
using AdvLaser.AdvLaserObjects;


namespace AdvLaser.AdvLaserDataAccess
{

     public static class AddressDataAccess
     {
          public static int SaveAddress(Address aAddress)
          {
               if(aAddress.AddressKey == 0)
               {
                    return createNewAddress(aAddress);
               }
               else
               {
                    return updateAddress(aAddress);
               }
          }

          public static SqlCommand SaveAddressCommand(Address aAddress)
          {
               if(aAddress.AddressKey == 0)
               {
                    return createNewAddressCommand(aAddress);
               }
               else
               {
                    return createUpdateAddressCommand(aAddress);
               }
          }

          public static Address GetOne(int aAddressKey)
          {
               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Id", SqlDbType.Int, 0, ParameterDirection.Input, aAddressKey);
               BaseDataAccess.SetCommandType( sqlCmd, CommandType.StoredProcedure, "Address_GetOne");
               BaseDataAccess.GenerateObjectFromReader sqlData = new BaseDataAccess.GenerateObjectFromReader (CreateAddress);
               Address aAddress = (Address) BaseDataAccess.ExecuteObjectReader(sqlCmd, sqlData);
               return aAddress;
          }

          public static Object CreateAddress (SqlDataReader returnData)
          {
               Address aAddress = null;

               while (returnData.Read()) 
               {
                    aAddress = new Address();
                    aAddress.AddressKey = (int)returnData["AddressKey"];
                    aAddress.CustomerKey = (int)returnData["CustomerKey"];
                    aAddress.AddressTypeKey = (int)returnData["AddressTypeKey"];
                    aAddress.Line1 = (string)returnData["Line1"];
                    aAddress.Line2 = (string)returnData["Line2"];
                    aAddress.City = (string)returnData["City"];
                    aAddress.State = (string)returnData["State"];
                    aAddress.ZipCode = (string)returnData["ZipCode"];
               }
               return aAddress;
          }

          private static int createNewAddress(Address aAddress)
          {

               SqlCommand sqlCmd = createNewAddressCommand(aAddress);

               BaseDataAccess.ExecuteScalarCmd(sqlCmd);
               return ((int)sqlCmd.Parameters["@retval"].Value); 
          }

          private static SqlCommand createNewAddressCommand(Address aAddress)
          {

               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@CustomerKey", SqlDbType.Int, 0, ParameterDirection.Input, aAddress.CustomerKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@AddressTypeKey", SqlDbType.Int, 0, ParameterDirection.Input, aAddress.AddressTypeKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Line1", SqlDbType.VarChar, 100, ParameterDirection.Input, aAddress.Line1);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Line2", SqlDbType.VarChar, 100, ParameterDirection.Input, aAddress.Line2);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@City", SqlDbType.VarChar, 100, ParameterDirection.Input, aAddress.City);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@State", SqlDbType.VarChar, 2, ParameterDirection.Input, aAddress.State);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ZipCode", SqlDbType.VarChar, 10, ParameterDirection.Input, aAddress.ZipCode);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@retval", SqlDbType.Int, 0, ParameterDirection.Output, null);
               BaseDataAccess.SetCommandType(sqlCmd,CommandType.StoredProcedure, "Address_Create");
               return sqlCmd;
          }

          private static SqlCommand createUpdateAddressCommand(Address aAddress)
          {

               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ID", SqlDbType.Int, 0, ParameterDirection.Input, aAddress.AddressKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@CustomerKey", SqlDbType.Int, 0, ParameterDirection.Input, aAddress.CustomerKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@AddressTypeKey", SqlDbType.Int, 0, ParameterDirection.Input, aAddress.AddressTypeKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Line1", SqlDbType.VarChar, 100, ParameterDirection.Input, aAddress.Line1);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Line2", SqlDbType.VarChar, 100, ParameterDirection.Input, aAddress.Line2);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@City", SqlDbType.VarChar, 100, ParameterDirection.Input, aAddress.City);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@State", SqlDbType.VarChar, 2, ParameterDirection.Input, aAddress.State);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ZipCode", SqlDbType.VarChar, 10, ParameterDirection.Input, aAddress.ZipCode);
               BaseDataAccess.SetCommandType(sqlCmd,CommandType.StoredProcedure, "Address_Update");
               return sqlCmd;
          }
          private static int updateAddress(Address aAddress)
          {

               SqlCommand sqlCmd = createUpdateAddressCommand(aAddress);

               BaseDataAccess.ExecuteScalarCmd(sqlCmd);
               return aAddress.AddressKey;
          }
     }
}
