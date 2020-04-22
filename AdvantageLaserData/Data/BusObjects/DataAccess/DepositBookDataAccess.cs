using AdvLaser.AdvLaserDataAccess;
using AdvLaser.AdvLaserObjects;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace AdvLaser.AdvLaserDataAccess
{
    public static class DepositBookDataAccess
    {
        public static int SaveDepositBook(DepositBook aDepositBook)
        {
            if (aDepositBook.DepositBookKey == 0)
            {
                return createNewDepositBook(aDepositBook);
            }
            else
            {
                return updateDepositBook(aDepositBook);
            }
        }

        public static SqlCommand SaveDepositBookCommand(DepositBook aDepositBook)
        {
            if (aDepositBook.DepositBookKey == 0)
            {
                return createNewDepositBookCommand(aDepositBook);
            }
            else
            {
                return createUpdateDepositBookCommand(aDepositBook);
            }
        }

        public static DepositBook GetOne(int aDepositBookKey)
        {
            SqlCommand sqlCmd = new SqlCommand();

            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Id", SqlDbType.Int, 0, ParameterDirection.Input, aDepositBookKey);
            BaseDataAccess.SetCommandType(sqlCmd, CommandType.StoredProcedure, "DepositBook_GetOne");
            BaseDataAccess.GenerateObjectFromReader sqlData = new BaseDataAccess.GenerateObjectFromReader(CreateDepositBook);
            DepositBook aDepositBook = (DepositBook)BaseDataAccess.ExecuteObjectReader(sqlCmd, sqlData);
            return aDepositBook;
        }

        public static Object CreateDepositBook(SqlDataReader returnData)
        {
            DepositBook aDepositBook = null;

            while (returnData.Read())
            {
                aDepositBook = new DepositBook();
                aDepositBook.DepositBookKey = (int)returnData["DepositBookKey"];
                aDepositBook.CustomerKey = (int)returnData["CustomerKey"];
                aDepositBook.RoutingNumber = (string)returnData["RoutingNumber"];
                aDepositBook.AccountNumber = (string)returnData["AccountNumber"];
                aDepositBook.Fraction = (string)returnData["Fraction"];
                aDepositBook.Line1 = (string)returnData["Line1"];
                aDepositBook.Line2 = (string)returnData["Line2"];
                aDepositBook.Line3 = (string)returnData["Line3"];
                aDepositBook.Line4 = (string)returnData["Line4"];
                aDepositBook.Line5 = (string)returnData["Line5"];
                aDepositBook.BankInfoLine1 = (string)returnData["BankInfoLine1"];
                aDepositBook.BankInfoLine2 = (string)returnData["BankInfoLine2"];
                aDepositBook.BankInfoLine3 = (string)returnData["BankInfoLine3"];
                aDepositBook.AcctNumber = (byte[])returnData["AcctNumber"];
                aDepositBook.RNumber = (byte[])returnData["RNumber"];
            }
            return aDepositBook;
        }

        private static int createNewDepositBook(DepositBook aDepositBook)
        {

            SqlCommand sqlCmd = createNewDepositBookCommand(aDepositBook);

            BaseDataAccess.ExecuteScalarCmd(sqlCmd);
            return ((int)sqlCmd.Parameters["@retval"].Value);
        }

        private static SqlCommand createNewDepositBookCommand(DepositBook aDepositBook)
        {

            SqlCommand sqlCmd = new SqlCommand();

            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@CustomerKey", SqlDbType.Int, 0, ParameterDirection.Input, aDepositBook.CustomerKey);
            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@RoutingNumber", SqlDbType.VarChar, 20, ParameterDirection.Input, String.Empty);
            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@AccountNumber", SqlDbType.VarChar, 20, ParameterDirection.Input, String.Empty);
            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Fraction", SqlDbType.VarChar, 20, ParameterDirection.Input, aDepositBook.Fraction);
            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Line1", SqlDbType.VarChar, 100, ParameterDirection.Input, aDepositBook.Line1);
            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Line2", SqlDbType.VarChar, 100, ParameterDirection.Input, aDepositBook.Line2);
            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Line3", SqlDbType.VarChar, 100, ParameterDirection.Input, aDepositBook.Line3);
            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Line4", SqlDbType.VarChar, 100, ParameterDirection.Input, aDepositBook.Line4);
            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Line5", SqlDbType.VarChar, 100, ParameterDirection.Input, aDepositBook.Line5);
            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@BankInfoLine1", SqlDbType.VarChar, 35, ParameterDirection.Input, aDepositBook.BankInfoLine1);
            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@BankInfoLine2", SqlDbType.VarChar, 35, ParameterDirection.Input, aDepositBook.BankInfoLine2);
            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@BankInfoLine3", SqlDbType.VarChar, 35, ParameterDirection.Input, aDepositBook.BankInfoLine3);
            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@retval", SqlDbType.Int, 0, ParameterDirection.Output, null);
            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@AcctNumber", SqlDbType.VarBinary, 128, ParameterDirection.Input, aDepositBook.AcctNumber);
            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@RNumber", SqlDbType.VarBinary, 128, ParameterDirection.Input, aDepositBook.RNumber);
            BaseDataAccess.SetCommandType(sqlCmd, CommandType.StoredProcedure, "DepositBook_Create");
            return sqlCmd;
        }

        private static SqlCommand createUpdateDepositBookCommand(DepositBook aDepositBook)
        {

            SqlCommand sqlCmd = new SqlCommand();

            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ID", SqlDbType.Int, 0, ParameterDirection.Input, aDepositBook.DepositBookKey);
            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@CustomerKey", SqlDbType.Int, 0, ParameterDirection.Input, aDepositBook.CustomerKey);
            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@RoutingNumber", SqlDbType.VarChar, 20, ParameterDirection.Input, aDepositBook.RoutingNumber);
            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@AccountNumber", SqlDbType.VarChar, 20, ParameterDirection.Input, aDepositBook.AccountNumber);
            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Fraction", SqlDbType.VarChar, 20, ParameterDirection.Input, aDepositBook.Fraction);
            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Line1", SqlDbType.VarChar, 100, ParameterDirection.Input, aDepositBook.Line1);
            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Line2", SqlDbType.VarChar, 100, ParameterDirection.Input, aDepositBook.Line2);
            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Line3", SqlDbType.VarChar, 100, ParameterDirection.Input, aDepositBook.Line3);
            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Line4", SqlDbType.VarChar, 100, ParameterDirection.Input, aDepositBook.Line4);
            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Line5", SqlDbType.VarChar, 100, ParameterDirection.Input, aDepositBook.Line5);
            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@BankInfoLine1", SqlDbType.VarChar, 35, ParameterDirection.Input, aDepositBook.BankInfoLine1);
            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@BankInfoLine2", SqlDbType.VarChar, 35, ParameterDirection.Input, aDepositBook.BankInfoLine2);
            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@BankInfoLine3", SqlDbType.VarChar, 35, ParameterDirection.Input, aDepositBook.BankInfoLine3);
            BaseDataAccess.SetCommandType(sqlCmd, CommandType.StoredProcedure, "DepositBook_Update");
            return sqlCmd;
        }
        private static int updateDepositBook(DepositBook aDepositBook)
        {

            SqlCommand sqlCmd = createUpdateDepositBookCommand(aDepositBook);

            BaseDataAccess.ExecuteScalarCmd(sqlCmd);
            return aDepositBook.DepositBookKey;
        }
    }
}
