using AdvLaser.AdvLaserDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AdvLaser.AdvLaserObjects
{
    public class Coupon
    {
        public const int COUPON_TYPE_DOLLARS = 1;
        public const int COUPON_TYPE_PERCENT = 2;
        # region member variables
        private int m_intCouponKey;
        private string m_strCouponCode;
        private string m_strDescription;
        private DateTime m_dtmStartDate;
        private DateTime m_dtmEnddate;
        private int m_intCouponTypeKey;
        private int m_intCouponCategoryKey;
        private decimal m_decDollarValue;
        private decimal m_decPercentValue;
        private decimal m_decMinimumOrder;
        # endregion

        # region public properties
        public int CouponKey {
            get { return m_intCouponKey; }
            set { m_intCouponKey = value; }
        }
        public string CouponCode {
            get { return m_strCouponCode; }
            set { m_strCouponCode = value; }
        }
        public string Description {
            get { return m_strDescription; }
            set { m_strDescription = value; }
        }
        public DateTime StartDate {
            get { return m_dtmStartDate; }
            set { m_dtmStartDate = value; }
        }
        public DateTime EndDate {
            get { return m_dtmEnddate; }
            set { m_dtmEnddate = value; }
        }
        public int CouponTypeKey {
            get { return m_intCouponTypeKey; }
            set { m_intCouponTypeKey = value; }
        }
        public int CouponCategoryKey {
            get { return m_intCouponCategoryKey; }
            set { m_intCouponCategoryKey = value; }
        }
        public decimal DollarValue {
            get { return m_decDollarValue; }
            set { m_decDollarValue = value; }
        }
        public decimal PercentValue {
            get { return m_decPercentValue; }
            set { m_decPercentValue = value; }
        }
        public decimal MinimumOrder {
            get { return m_decMinimumOrder; }
            set { m_decMinimumOrder = value; }
        }
        # endregion
        #region data access methods
        public int Save()
        {
            return CouponDataAccess.SaveCoupon(this);
        }
        #endregion
    }
}
