using System;
using AdvLaser.AdvLaserDataAccess;

namespace AdvLaser.AdvLaserObjects
{


     public class Address
     {
          #region member variables
          private int m_intAddressKey;
          private int m_intCustomerKey;
          private int m_intAddressTypeKey;
          private string m_strLine1 = String.Empty;
          private string m_strLine2 = String.Empty;
          private string m_strCity = String.Empty;
          private string m_strState = String.Empty;
          private string m_strZipCode = String.Empty;
          private bool m_blnIsTaxableState = false;
          #endregion

          #region public properties
          public int AddressKey
          {
               get { return m_intAddressKey; }
               set { m_intAddressKey = value; }
          }
          public int CustomerKey
          {
               get { return m_intCustomerKey; }
               set { m_intCustomerKey = value; }
          }
          public int AddressTypeKey
          {
               get { return m_intAddressTypeKey; }
               set { m_intAddressTypeKey = value; }
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
          public string City
          {
               get { return m_strCity; }
               set { m_strCity = value; }
          }
          public string State
          {
               get { return m_strState; }
               set { m_strState = value; }
          }
          public string ZipCode
          {
               get { return m_strZipCode; }
               set { m_strZipCode = value; }
          }
          public bool IsTaxableState
          {
              get
              {
                  return (m_strState.ToUpper() == "GA");
              }
          }
          #endregion

          #region data access methods
          public int Save()
          {
               return AddressDataAccess.SaveAddress(this);
          }
          #endregion
     }
}
