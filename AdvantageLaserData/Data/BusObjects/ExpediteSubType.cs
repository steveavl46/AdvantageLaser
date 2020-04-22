using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AdvLaser.AdvLaserObjects
{
    public class ExpediteSubType
    {
        #region member variables
        private int m_intExpediteSubTypeKey;
        private int m_intExpediteTypeKey;
        private int m_intDisplayOrder;
        private string m_strDescription;
        private bool m_blnIsActive;
        private decimal m_decAdditionalCharge;
        private bool m_boolBillAtActualCharges;
        private string m_strShortDescription;
        #endregion

        #region public properties
        public int ExpediteSubTypeKey
        {
            get { return m_intExpediteSubTypeKey; }
            set { m_intExpediteSubTypeKey = value; }
        }
        public int ExpediteTypeKey
        {
            get { return m_intExpediteTypeKey; }
            set { m_intExpediteTypeKey = value; }
        }
        public int DisplayOrder
        {
            get { return m_intDisplayOrder; }
            set { m_intDisplayOrder = value; }
        }
        public string Description
        {
            get { return m_strDescription; }
            set { m_strDescription = value; }
        }
        public bool IsActive
        {
            get { return m_blnIsActive; }
            set { m_blnIsActive = value; }
        }
        public decimal AdditionalCharge
        {
            get { return m_decAdditionalCharge; }
            set { m_decAdditionalCharge = value; }
        }
        public bool BillAtActualCharges
        {
            get { return m_boolBillAtActualCharges; }
            set { m_boolBillAtActualCharges = value; }
        }
        public string ShortDescription
        {
            get { return m_strShortDescription; }
            set { m_strShortDescription = value; }
        }
        #endregion
    }
}
