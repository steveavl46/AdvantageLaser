using System;
using AdvLaser.AdvLaserDataAccess;

namespace AdvLaser.AdvLaserObjects
{


     public class CreditCardType
     {
          #region member variables
          private int m_intCreditCardTypeKey;
          private string m_strDescription;
          #endregion

          #region public properties
          public int CreditCardTypeKey
          {
               get { return m_intCreditCardTypeKey; }
               set { m_intCreditCardTypeKey = value; }
          }
          public string Description
          {
               get { return m_strDescription; }
               set { m_strDescription = value; }
          }
          #endregion

          #region data access methods
          public int Save()
          {
               return CreditCardTypeDataAccess.SaveCreditCardType(this);
          }
          #endregion
     }
}
