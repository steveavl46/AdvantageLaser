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
    public static class CouponProductCategoryCollectionDataAccess
    {
        public static CouponProductCategoryCollection GetProductCategories(int couponCategoryKey)
        {
            CouponProductCategoryCollection m_colProductCategories = new CouponProductCategoryCollection();
            SqlCommand sqlCmd = new SqlCommand();
            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@CouponCategoryKey", SqlDbType.Int, 0, ParameterDirection.Input, couponCategoryKey);
            BaseDataAccess.SetCommandType(sqlCmd, CommandType.StoredProcedure, "GetProductCategoriesForCoupon");

            BaseDataAccess.GenerateCollectionFromReader sqlData = new BaseDataAccess.GenerateCollectionFromReader(GenerateCouponCollectionFromReader);
            m_colProductCategories = (CouponProductCategoryCollection)BaseDataAccess.ExecuteCollectionReader(sqlCmd, sqlData);
            return m_colProductCategories;
        }

        private static CollectionBase GenerateCouponCollectionFromReader(SqlDataReader returnData)
        {
            CouponProductCategoryCollection m_colProductCategories = new CouponProductCategoryCollection();
            while (returnData.Read())
            {
                ProductCategory aProductCategory = new ProductCategory();
                aProductCategory.ProductCategoryKey = (int)returnData["ProductCategoryKey"];
                aProductCategory.Description = BaseDataAccess.GetString(returnData["Description"]);
                m_colProductCategories.Add(aProductCategory);
            }
            return (m_colProductCategories);
        } 
    }
}
