/*
 * Created by SharpDevelop.
 * User: ATL97337
 * Date: 9/21/2008
 * Time: 1:20 PM
 * 
 * To change this template use Tools | Options | Coding | Edit Standard Headers.
 */
using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;

namespace AdvLaser.AdvLaserDataAccess
{
	/// <summary>
	/// Description of MyClass.
	/// </summary>
	/// 
	public static class BaseDataAccess : Object
	{

		static BaseDataAccess()
		{
		}
		public static string ConnectionString 
		{
			get 
			{
				string str = ConfigurationSettings.AppSettings["SqlConnectionString"];
				if (str==null || str.Length <=0)
					throw (new ApplicationException("Connection String configuration is missing from config. "));
				else
					return (str);
			}
		}

		public static string Thing1
		{
			get
			{
				string str = ConfigurationManager.AppSettings["thing1"];
				if (str == null || str.Length <= 0)
					throw (new ApplicationException("Thing1 configuration is missing from config. "));
				else
					return (str);
			}
		}

		public static string Password
		{
			get
			{
				string thing1 = ConfigurationManager.AppSettings["thing1"];
				string pwd = ConfigurationManager.AppSettings["password"];
				return thing1 + pwd.Substring(0, 1);
			}
		}
		
		public  delegate CollectionBase GenerateCollectionFromReader(SqlDataReader returnData);
		
		public  delegate Object GenerateObjectFromReader(SqlDataReader returnData);
		
		public static void AddParamToSQLCmd(SqlCommand sqlCmd, string paramId, SqlDbType sqlType, int paramSize, ParameterDirection paramDirection, object paramvalue) 
		{
			// Validate Parameter Properties
			if (sqlCmd== null)
				throw (new ArgumentNullException("sqlCmd"));
			if (paramId == string.Empty)
				throw (new ArgumentOutOfRangeException("paramId"));

			// Add Parameter
			SqlParameter newSqlParam = new SqlParameter();
			newSqlParam.ParameterName= paramId;
			newSqlParam.SqlDbType = sqlType;
			newSqlParam.Direction = paramDirection;

			if (paramSize > 0)
				newSqlParam.Size=paramSize;

            if (paramvalue != null)
            {

                if (paramvalue.GetType().Name == "DateTime" && (DateTime)paramvalue == DateTime.MinValue)
                {
                    paramvalue = DBNull.Value;
                }
                if (paramvalue.GetType().Name == "Int32" && (Int32)paramvalue == Int32.MinValue)
                {
                    paramvalue = DBNull.Value;
                }
                if (paramvalue.GetType().Name == "Decimal" && (decimal)paramvalue == decimal.MinValue)
                {
                    paramvalue = DBNull.Value;
                }
               
            }
            else
            {
                paramvalue = DBNull.Value;
            }
            newSqlParam.Value = paramvalue;
			sqlCmd.Parameters.Add (newSqlParam);
		}
		
		public static CollectionBase ExecuteReaderCmd(SqlCommand sqlCmd, GenerateCollectionFromReader gcfr) 
		{
			if (ConnectionString == string.Empty)
				throw (new ArgumentOutOfRangeException("ConnectionString"));

			if (sqlCmd== null)
				throw (new ArgumentNullException("sqlCmd"));

			//The C# using block guarantees that the Dispose method is called
			using (SqlConnection cn = new SqlConnection(ConnectionString)) 
			{
				sqlCmd.Connection = cn;
				cn.Open();
				CollectionBase temp = gcfr(sqlCmd.ExecuteReader());
				return (temp);
			}
		}
		
		public static void SetCommandType(SqlCommand sqlCmd, CommandType cmdType, string cmdText) 
		{
			sqlCmd.CommandType = cmdType;
			sqlCmd.CommandText = cmdText;
		}
		
		public static Object ExecuteScalarCmd(SqlCommand sqlCmd) 
		{
			// Validate Command Properties
			if (ConnectionString == string.Empty)
				throw (new ArgumentOutOfRangeException("ConnectionString"));

			if (sqlCmd== null)
				throw (new ArgumentNullException("sqlCmd"));

			Object result = null;

			//The C# using block guarantees that the Dispose method is called 
			using (SqlConnection cn = new SqlConnection(ConnectionString)) 
			{
				sqlCmd.Connection = cn;
				cn.Open();
				result = sqlCmd.ExecuteScalar();
			}

			return result;
		}
		
		public static Object ExecuteCollectionReader(SqlCommand sqlCmd, GenerateCollectionFromReader gcfr)
		{
			// Validate Command Properties
			if (ConnectionString == string.Empty)
				throw (new ArgumentOutOfRangeException("ConnectionString"));

			if (sqlCmd== null)
				throw (new ArgumentNullException("sqlCmd"));

			//The C# using block guarantees that the Dispose method is called o
			using (SqlConnection cn = new SqlConnection(ConnectionString)) 
			{
				sqlCmd.Connection = cn;
				cn.Open();
				Object temp = gcfr(sqlCmd.ExecuteReader());
				return (temp);
			}
		}	
		
		public static Object ExecuteObjectReader(SqlCommand sqlCmd, GenerateObjectFromReader gofr)
		{
			// Validate Command Properties
			if (ConnectionString == string.Empty)
				throw (new ArgumentOutOfRangeException("ConnectionString"));

			if (sqlCmd== null)
				throw (new ArgumentNullException("sqlCmd"));

			//The C# using block guarantees that the Dispose method is called o
			using (SqlConnection cn = new SqlConnection(ConnectionString)) 
			{
				sqlCmd.Connection = cn;
				cn.Open();
				Object temp = gofr(sqlCmd.ExecuteReader());
				return (temp);
			}
		}

        public static DateTime GetDate(object aObject)
        {
            if(aObject.GetType() == typeof(System.DBNull))
            {
                return DateTime.MinValue;
            }
            return Convert.ToDateTime(aObject);
        }

        public static string GetString(object aObject)
        {
            if (aObject.GetType() == typeof(System.DBNull))
            {
                return "";
            }
            return Convert.ToString(aObject);
        }

        public static int GetInt(object aObject)
        {
            if (aObject.GetType() == typeof(System.DBNull))
            {
                return Int32.MinValue;
            }
            return Convert.ToInt32(aObject);
        }

        public static decimal GetDecimal(object aObject)
        {
            if (aObject.GetType() == typeof(System.DBNull))
            {
                return Decimal.MinValue;
            }
            return Convert.ToDecimal(aObject);
        }

		public static byte[] GetByteArray(object aObject)
		{
			if (aObject.GetType() == typeof(System.DBNull))
			{
				return new byte[0];
			}
			return (byte[])aObject;
		}

		public static void BlockIP(string ip)
		{
			try
			{
				SqlCommand sqlCmd = createBlockedIPAddCommand(ip);

				BaseDataAccess.ExecuteScalarCmd(sqlCmd);
			}
			catch (System.Exception e)
			{
				var msg = e.Message;
			}
		}

		public static byte[] Encrypt(string value)
		{
			try
			{
				SqlCommand sqlCmd = createEncryptCommand(value);

				BaseDataAccess.ExecuteScalarCmd(sqlCmd);
				var temp = ((byte[])sqlCmd.Parameters["@EncryptedVal"].Value);
				return temp;
			}
			catch(System.Exception e)
			{
				var msg = e.Message;
			}
			return new byte[0];
		}

		public static string Decrypt(byte[] value)
		{
			try
			{
				SqlCommand sqlCmd = createDecryptCommand(value);

				var temp = BaseDataAccess.ExecuteScalarCmd(sqlCmd);
				 
				return temp.ToString();
			}
			catch (System.Exception e)
			{
				var msg = e.Message;
			}
			return String.Empty;
		}

		public static byte[] Encrypt(int value)
		{
			return Encrypt(value.ToString());
		}

		public static int GetIPValidationCode(string ip)
		{
			try
			{
				SqlCommand sqlCmd = createIPValidationCommand(ip);

				var temp = (int)BaseDataAccess.ExecuteScalarCmd(sqlCmd);
				return temp;
			}
			catch (System.Exception e)
			{
				var msg = e.Message;
			}
			return 0;
		}

		private static SqlCommand createBlockedIPAddCommand(string ip)
		{
			SqlCommand sqlCmd = new SqlCommand();

			BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@IP", SqlDbType.VarChar, 50, ParameterDirection.Input, ip);
			BaseDataAccess.SetCommandType(sqlCmd, CommandType.StoredProcedure, "usp_BlockedIP_Add");
			return sqlCmd;
		}

		private static SqlCommand createIPValidationCommand(string ip)
		{
			SqlCommand sqlCmd = new SqlCommand();

			BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@IP", SqlDbType.VarChar, 50, ParameterDirection.Input, ip);
			BaseDataAccess.SetCommandType(sqlCmd, CommandType.StoredProcedure, "usp_ValidateIP");
			return sqlCmd;
		}

			private static SqlCommand createEncryptCommand(string value)
		{

			SqlCommand sqlCmd = new SqlCommand();

			BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Temp", SqlDbType.VarChar, 200, ParameterDirection.Input, value);
			BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Password", SqlDbType.VarChar, 200, ParameterDirection.Input, Password);
			BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@EncryptedVal", SqlDbType.VarBinary, 128, ParameterDirection.Output, null);
			BaseDataAccess.SetCommandType(sqlCmd, CommandType.StoredProcedure, "usp_Encrypt");
			return sqlCmd;
		}

		private static SqlCommand createDecryptCommand(byte[] value)
		{

			SqlCommand sqlCmd = new SqlCommand();

			BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Encrypted", SqlDbType.VarBinary, 200, ParameterDirection.Input, value);
			BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Password", SqlDbType.VarChar, 200, ParameterDirection.Input, Password);
			BaseDataAccess.SetCommandType(sqlCmd, CommandType.StoredProcedure, "usp_Decrypt");
			return sqlCmd;
		}
	}
	
}
