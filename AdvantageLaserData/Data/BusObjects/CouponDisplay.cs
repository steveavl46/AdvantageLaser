using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AdvLaser.AdvLaserObjects
{
    public class CouponDisplay
    {
        # region member variables
        private int m_intCouponKey;
        private string m_strCouponCode;
        private string m_strDescription;
        private DateTime m_dtmStartDate;
        private DateTime m_dtmEnddate;
        private string m_strCouponTypeDescription;
        private string m_strCouponCategoryDescription;
        private decimal m_decDollarValue;
        private decimal m_decPercentValue;
        private decimal m_decMinimumOrder;
        private int m_intCouponTypeKey;
        # endregion

        # region public properties
        public int CouponKey
        {
            get { return m_intCouponKey; }
            set { m_intCouponKey = value; }
        }
        public string CouponCode
        {
            get { return m_strCouponCode; }
            set { m_strCouponCode = value; }
        }
        public string Description
        {
            get { return m_strDescription; }
            set { m_strDescription = value; }
        }
        public DateTime StartDate
        {
            get { return m_dtmStartDate; }
            set { m_dtmStartDate = value; }
        }
        public DateTime EndDate
        {
            get { return m_dtmEnddate; }
            set { m_dtmEnddate = value; }
        }
        public string CouponTypeDescription
        {
            get { return m_strCouponTypeDescription; }
            set { m_strCouponTypeDescription = value; }
        }
        public string CouponCategoryDescription
        {
            get { return m_strCouponCategoryDescription; }
            set { m_strCouponCategoryDescription = value; }
        }
        public decimal DollarValue
        {
            get { return m_decDollarValue; }
            set { m_decDollarValue = value; }
        }
        public decimal PercentValue
        {
            get { return m_decPercentValue; }
            set { m_decPercentValue = value; }
        }
        public decimal MinimumOrder
        {
            get { return m_decMinimumOrder; }
            set { m_decMinimumOrder = value; }
        }
        public int CouponTypeKey
        {
            get { return m_intCouponTypeKey; }
            set { m_intCouponTypeKey = value; }
        }
        public decimal CouponValue
        {
            get
            {
                if (m_intCouponTypeKey == 1)
                {
                    return m_decDollarValue;
                }
                return m_decPercentValue;
            }
        }
        # endregion
    }
}
