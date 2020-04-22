using System;
using AdvLaser.AdvLaserDataAccess;

namespace AdvLaser.AdvLaserObjects
{


     public class ShippingZone
     {
          #region member variables
          private int m_intShippingZoneKey;
          private string m_strDescription;
          #endregion

          #region public properties
          public int ShippingZoneKey
          {
               get { return m_intShippingZoneKey; }
               set { m_intShippingZoneKey = value; }
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
               return ShippingZoneDataAccess.SaveShippingZone(this);
          }
          #endregion
     }
}
