using AdvLaser.AdvLaserDataAccess;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace CheckProject.helpers
{
    public static class Helper
    {
        private static string Password;

        static Helper()
        {
            Password = BaseDataAccess.Password;
        }

        public static byte[] Encrypt(string value)
        {
            SqlCommand sqlCmd = createEncryptCommand(value);

            BaseDataAccess.ExecuteScalarCmd(sqlCmd);
            var temp = ((byte[])sqlCmd.Parameters["@EncryptedVal"].Value);
            return temp;
        }

        private static SqlCommand createEncryptCommand(string value)
        {

            SqlCommand sqlCmd = new SqlCommand();

            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Temp", SqlDbType.VarChar, 200, ParameterDirection.Input, value);
            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Temp", SqlDbType.VarChar, 200, ParameterDirection.Input, Password);
            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@EncryptedVal", SqlDbType.VarBinary, 128, ParameterDirection.Output, null);
            BaseDataAccess.SetCommandType(sqlCmd, CommandType.StoredProcedure, "usp_Encrypt");
            return sqlCmd;
        }
    }
}