using System;
using AdvLaser.AdvLaserDataAccess;

namespace AdvLaser.AdvLaserObjects
{


     public class AddressType
     {
          #region member variables
          private int m_intAddressTypeKey;
          private string m_strDescription;
          #endregion

          #region public properties
          public int AddressTypeKey
          {
               get { return m_intAddressTypeKey; }
               set { m_intAddressTypeKey = value; }
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
               return AddressTypeDataAccess.SaveAddressType(this);
          }
          #endregion
     }
}
