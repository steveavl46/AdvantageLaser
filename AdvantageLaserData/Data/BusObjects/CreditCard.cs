using System;
using AdvLaser.AdvLaserDataAccess;

namespace AdvLaser.AdvLaserObjects
{


     public class CreditCard
     {
          #region member variables
          private int m_intCreditCardKey;
          private int m_intCustomerKey;
          private int m_intCreditCardTypeKey;
          private string m_strNumber;
          private int m_intExpirationMonth;
          private int m_intExpirationYear;
          private string m_strCCV;
          private byte[] m_ccNumber;
          private byte[] m_ccExpYear;
          private byte[] m_ccExpMonth;
          private byte[] m_ccCCV;
        #endregion

        #region public properties
        public int CreditCardKey
          {
               get { return m_intCreditCardKey; }
               set { m_intCreditCardKey = value; }
          }
          public int CustomerKey
          {
               get { return m_intCustomerKey; }
               set { m_intCustomerKey = value; }
          }
          public int CreditCardTypeKey
          {
               get { return m_intCreditCardTypeKey; }
               set { m_intCreditCardTypeKey = value; }
          }
          public string Number
          {
               get { return m_strNumber; }
               set { m_strNumber = value; }
          }
          public int ExpirationMonth
          {
               get { return m_intExpirationMonth; }
               set { m_intExpirationMonth = value; }
          }
          public int ExpirationYear
          {
               get { return m_intExpirationYear; }
               set { m_intExpirationYear = value; }
          }
          public string CCV
          {
               get { return m_strCCV; }
               set { m_strCCV = value; }
          }
        public byte[] CCNumber 
        { 
            get { return m_ccNumber; }
            set { m_ccNumber = value; } 
        }
        public byte[] CCExpMonth
        {
            get { return m_ccExpMonth; }
            set { m_ccExpMonth = value; }
        }
        public byte[] CCExpYear
        {
            get { return m_ccExpYear; }
            set { m_ccExpYear = value; }
        }

        public byte[] CCCCV
        {
            get { return m_ccCCV; }
            set {m_ccCCV  = value; }
        }
        #endregion

        #region data access methods
        public int Save()
          {
             return CreditCardDataAccess.SaveCreditCard(this);
          }
          #endregion
     }
}
