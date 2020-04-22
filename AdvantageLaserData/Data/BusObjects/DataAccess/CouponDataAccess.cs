using AdvLaser.AdvLaserObjects;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace AdvLaser.AdvLaserDataAccess
{
    public static class CouponDataAccess
    {
        public static Coupon GetOne(int aCouponKey)
        {
            SqlCommand sqlCmd = new SqlCommand();

            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Id", SqlDbType.Int, 0, ParameterDirection.Input, aCouponKey);
            BaseDataAccess.SetCommandType(sqlCmd, CommandType.StoredProcedure, "Coupon_GetOne");
            BaseDataAccess.GenerateObjectFromReader sqlData = new BaseDataAccess.GenerateObjectFromReader(CreateCoupon);
            Coupon aCoupon = (Coupon)BaseDataAccess.ExecuteObjectReader(sqlCmd, sqlData);
            return aCoupon;
        }

        public static Coupon GetOneByCode(string aCode)
        {
            SqlCommand sqlCmd = new SqlCommand();

            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@CouponCode", SqlDbType.VarChar, 8, ParameterDirection.Input, aCode);
            BaseDataAccess.SetCommandType(sqlCmd, CommandType.StoredProcedure, "GetCouponByCode");
            BaseDataAccess.GenerateObjectFromReader sqlData = new BaseDataAccess.GenerateObjectFromReader(CreateCoupon);
            Coupon aCoupon = (Coupon)BaseDataAccess.ExecuteObjectReader(sqlCmd, sqlData);
            return aCoupon;
        }

        public static Object CreateCoupon(SqlDataReader returnData)
        {
            Coupon aCoupon = null;

            while (returnData.Read())
            {
                aCoupon = new Coupon();
                aCoupon.CouponKey = (int)returnData["CouponKey"];
                aCoupon.CouponCode = (string)returnData["CouponCode"];
                aCoupon.Description = (string)returnData["Description"];
                aCoupon.StartDate = (DateTime)returnData["StartDate"];
                aCoupon.EndDate = (DateTime)returnData["EndDate"];
                aCoupon.CouponTypeKey = (int)returnData["CouponTypeKey"];
                aCoupon.CouponCategoryKey = (int)returnData["CouponCategoryKey"];
                aCoupon.DollarValue = (decimal)returnData["DollarValue"];
                aCoupon.PercentValue = (decimal)returnData["PercentValue"];
                aCoupon.MinimumOrder = (decimal)returnData["MinimumOrder"];
            }
            return aCoupon;
        }

        public static int SaveCoupon(Coupon aCoupon)
        {
            if (aCoupon.CouponKey == 0)
            {
                return createNewCoupon(aCoupon);
            }
            else
            {
                return updateCoupon(aCoupon);
            }
        }

        public static SqlCommand SaveCouponCommand(Coupon aCoupon)
        {
            if (aCoupon.CouponKey == 0)
            {
                return createNewCouponCommand(aCoupon);
            }
            else
            {
                return createUpdateCouponCommand(aCoupon);
            }
        }

        private static int createNewCoupon(Coupon aCoupon)
        {

            SqlCommand sqlCmd = createNewCouponCommand(aCoupon);

            BaseDataAccess.ExecuteScalarCmd(sqlCmd);
            return ((int)sqlCmd.Parameters["@retval"].Value);
        }

        private static SqlCommand createNewCouponCommand(Coupon aCoupon)
        {

            SqlCommand sqlCmd = new SqlCommand();

            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@CouponCode", SqlDbType.VarChar, 8, ParameterDirection.Input, aCoupon.CouponCode);
            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Description", SqlDbType.VarChar, 25, ParameterDirection.Input, aCoupon.Description);
            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@StartDate", SqlDbType.DateTime, 8, ParameterDirection.Input, aCoupon.StartDate);
            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@EndDate", SqlDbType.DateTime, 8, ParameterDirection.Input, aCoupon.EndDate);
            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@CouponTypeKey", SqlDbType.Int, 0, ParameterDirection.Input, aCoupon.CouponTypeKey);
            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@CouponCategoryKey", SqlDbType.Int, 0, ParameterDirection.Input, aCoupon.CouponCategoryKey);
            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@DollarValue", SqlDbType.Float, 18, ParameterDirection.Input, aCoupon.DollarValue);
            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@PercentValue", SqlDbType.Float, 18, ParameterDirection.Input, aCoupon.PercentValue);
            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@MinimumOrder", SqlDbType.Float, 18, ParameterDirection.Input, aCoupon.MinimumOrder);
            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@retval", SqlDbType.Int, 0, ParameterDirection.Output, null);
            BaseDataAccess.SetCommandType(sqlCmd, CommandType.StoredProcedure, "Coupon_Create");
            return sqlCmd;
        }

        private static SqlCommand createUpdateCouponCommand(Coupon aCoupon)
        {

            SqlCommand sqlCmd = new SqlCommand();

            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ID", SqlDbType.Int, 0, ParameterDirection.Input, aCoupon.CouponKey);
            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@CouponCode", SqlDbType.VarChar, 8, ParameterDirection.Input, aCoupon.CouponCode);
            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Description", SqlDbType.VarChar, 25, ParameterDirection.Input, aCoupon.Description);
            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@StartDate", SqlDbType.DateTime, 8, ParameterDirection.Input, aCoupon.StartDate);
            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@EndDate", SqlDbType.DateTime, 8, ParameterDirection.Input, aCoupon.EndDate);
            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@CouponTypeKey", SqlDbType.Int, 0, ParameterDirection.Input, aCoupon.CouponTypeKey);
            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@CouponCategoryKey", SqlDbType.Int, 0, ParameterDirection.Input, aCoupon.CouponCategoryKey);
            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@DollarValue", SqlDbType.Float, 18, ParameterDirection.Input, aCoupon.DollarValue);
            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@PercentValue", SqlDbType.Float, 18, ParameterDirection.Input, aCoupon.PercentValue);
            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@MinimumOrder", SqlDbType.Float, 18, ParameterDirection.Input, aCoupon.MinimumOrder);
            BaseDataAccess.SetCommandType(sqlCmd, CommandType.StoredProcedure, "Coupon_Update");
            return sqlCmd;
        }
        private static int updateCoupon(Coupon aCoupon)
        {

            SqlCommand sqlCmd = createUpdateCouponCommand(aCoupon);

            BaseDataAccess.ExecuteScalarCmd(sqlCmd);
            return aCoupon.CouponKey;
        }
    }
}
