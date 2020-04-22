using AdvantageLaserData.Data.BusObjects;
using AdvLaser.AdvLaserObjects;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace AdvLaser.AdvLaserDataAccess
{
    public static class CouponCollectionDataAccess
    {
        public static CouponCollection GetCoupons()
        {
            CouponCollection m_colCoupons = new CouponCollection();
            SqlCommand sqlCmd = new SqlCommand();
            BaseDataAccess.SetCommandType(sqlCmd, CommandType.StoredProcedure, "GetCoupons");

            BaseDataAccess.GenerateCollectionFromReader sqlData = new BaseDataAccess.GenerateCollectionFromReader(GenerateCouponCollectionFromReader);
            m_colCoupons = (CouponCollection)BaseDataAccess.ExecuteCollectionReader(sqlCmd, sqlData);
            return m_colCoupons;
        }

        private static CollectionBase GenerateCouponCollectionFromReader(SqlDataReader returnData)
        {
            CouponCollection m_colCoupons = new CouponCollection();
            while (returnData.Read())
            {
                CouponDisplay aCoupon = new CouponDisplay();
                aCoupon.CouponKey = (int)returnData["CouponKey"];
                aCoupon.CouponCode = BaseDataAccess.GetString(returnData["CouponCode"]);
                aCoupon.Description = BaseDataAccess.GetString(returnData["Description"]);
                aCoupon.CouponTypeDescription = (string)returnData["CouponTypeDescription"];
                aCoupon.CouponCategoryDescription = (string)returnData["CouponCategoryDescription"];
                aCoupon.StartDate = (DateTime)returnData["StartDate"];
                aCoupon.EndDate = (DateTime)returnData["EndDate"];
                aCoupon.DollarValue = BaseDataAccess.GetDecimal(returnData["DollarValue"]);
                aCoupon.PercentValue = BaseDataAccess.GetDecimal(returnData["PercentValue"]);
                aCoupon.MinimumOrder = BaseDataAccess.GetDecimal(returnData["MinimumOrder"]);
                aCoupon.CouponTypeKey = (int)returnData["CouponTypeKey"];
                m_colCoupons.Add(aCoupon);
            }
            return (m_colCoupons);
        } 
    }
}
