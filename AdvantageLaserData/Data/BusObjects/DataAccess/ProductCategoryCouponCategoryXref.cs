using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AdvLaser.AdvLaserObjects
{
    public class ProductCategoryCouponCategoryXref
    {
        #region member variables
        private int m_intProductCategoryCouponCategoryXrefKey;
        private int m_intProductCategoryKey;
        private int m_intCouponCategoryKey;
        #endregion

        public int ProductCategoryCouponCategoryXrefKey
        {
            get
            {
                return m_intProductCategoryCouponCategoryXrefKey;
            }
            set
            {
                m_intProductCategoryCouponCategoryXrefKey = value;
            }
        }
        public int CouponCategoryKey
        {
            get
            {
                return m_intProductCategoryKey;
            }
            set
            {
                m_intProductCategoryKey = value;
            }
        }
        public int ProductCategoryKey
        {
            get
            {
                return m_intProductCategoryKey;
            }
            set
            {
                m_intProductCategoryKey = value;
            }
        }
    }
}
