using System;
using AdvLaser.AdvLaserDataAccess;

namespace AdvLaser.AdvLaserObjects
{


     public class ShippingRateGroup
     {
          #region member variables
          private int m_intShippingRateGroupKey;
          private string m_strDescription;
          #endregion

          #region public properties
          public int ShippingRateGroupKey
          {
               get { return m_intShippingRateGroupKey; }
               set { m_intShippingRateGroupKey = value; }
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
               return ShippingRateGroupDataAccess.SaveShippingRateGroup(this);
          }
          #endregion
     }
}
