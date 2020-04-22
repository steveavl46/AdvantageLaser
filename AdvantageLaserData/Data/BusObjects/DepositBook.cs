using AdvLaser.AdvLaserDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AdvLaser.AdvLaserObjects
{
    public class DepositBook
    {
        #region member variables
        private int m_intDepositBookKey;
        private int m_intCustomerKey;
        private string m_strRoutingNumber;
        private string m_strAccountNumber;
        private string m_strFraction;
        private string m_strLine1;
        private string m_strLine2;
        private string m_strLine3;
        private string m_strLine4;
        private string m_strLine5;
        private string m_strBankInfoLine1;
        private string m_strBankInfoLine2;
        private string m_strBankInfoLine3;
        private byte[] m_acctNumber;
        private byte[] m_rNumber;
        #endregion

        #region public properties
        public int DepositBookKey
        {
            get { return m_intDepositBookKey; }
            set { m_intDepositBookKey = value; }
        }
        public int CustomerKey
        {
            get { return m_intCustomerKey; }
            set { m_intCustomerKey = value; }
        }
        public string RoutingNumber
        {
            get { return m_strRoutingNumber; }
            set { m_strRoutingNumber = value; }
        }
        public string AccountNumber
        {
            get { return m_strAccountNumber; }
            set { m_strAccountNumber = value; }
        }
        public string Fraction
        {
            get { return m_strFraction; }
            set { m_strFraction = value; }
        }
        public string Line1
        {
            get { return m_strLine1; }
            set { m_strLine1 = value; }
        }
        public string Line2
        {
            get { return m_strLine2; }
            set { m_strLine2 = value; }
        }
        public string Line3
        {
            get { return m_strLine3; }
            set { m_strLine3 = value; }
        }
        public string Line4
        {
            get { return m_strLine4; }
            set { m_strLine4 = value; }
        }
        public string Line5
        {
            get { return m_strLine5; }
            set { m_strLine5 = value; }
        }
        public string BankInfoLine1
        {
            get { return m_strBankInfoLine1; }
            set { m_strBankInfoLine1 = value; }
        }
        public string BankInfoLine2
        {
            get { return m_strBankInfoLine2; }
            set { m_strBankInfoLine2 = value; }
        }
        public string BankInfoLine3
        {
            get { return m_strBankInfoLine3; }
            set { m_strBankInfoLine3 = value; }
        }

        public byte[] AcctNumber
        {
            get { return m_acctNumber; }
            set { m_acctNumber = value; }
        }

        public byte[] RNumber
        {
            get { return m_rNumber; }
            set { m_rNumber = value; }
        }
        #endregion


        #region data access methods
        public int Save()
        {
            return DepositBookDataAccess.SaveDepositBook(this);
        }
        #endregion
    }
}
