using System;
using AdvLaser.AdvLaserDataAccess;

namespace AdvLaser.AdvLaserObjects
{


     public class ShippingRateType
     {
          #region member variables
          private int m_intShippingRateTypeKey;
          private string m_strDescription;
          #endregion

          #region public properties
          public int ShippingRateTypeKey
          {
               get { return m_intShippingRateTypeKey; }
               set { m_intShippingRateTypeKey = value; }
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
               return ShippingRateTypeDataAccess.SaveShippingRateType(this);
          }
          #endregion
     }
}
