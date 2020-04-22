using System;
using AdvLaser.AdvLaserDataAccess;

namespace AdvLaser.AdvLaserObjects
{


     public class DepositStamp
     {
          #region member variables
          private int m_intDepositStampKey;
          private int m_intCustomerKey;
          private string m_strAccountNumber;
          private string m_strLine1;
          private string m_strBankName;
          private Customer m_CustomerObject;
        private byte[] m_acctNumber;
          #endregion

        #region public properties
        public int DepositStampKey
          {
               get { return m_intDepositStampKey; }
               set { m_intDepositStampKey = value; }
          }
          public int CustomerKey
          {
               get { return m_intCustomerKey; }
               set { m_intCustomerKey = value; }
          }
          public string AccountNumber
          {
               get { return m_strAccountNumber; }
               set { m_strAccountNumber = value; }
          }

          public string Line1
          {
              get { return m_strLine1; }
              set { m_strLine1 = value; }
          }

          public string BankName
          {
              get { return m_strBankName; }
              set { m_strBankName = value; }
          }

          public Customer CustomerObject
          {
              get { return m_CustomerObject; }
              set { m_CustomerObject = value; }
          }

        public byte[] AcctNumber
        {
            get { return m_acctNumber; }
            set { m_acctNumber = value; }
        }
        #endregion

        #region data access methods
        public int Save()
          {
               return DepositStampDataAccess.SaveDepositStamp(this);
          }
          #endregion
     }
}
