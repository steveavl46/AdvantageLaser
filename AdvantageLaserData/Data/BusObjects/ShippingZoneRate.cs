using System;
using AdvLaser.AdvLaserDataAccess;

namespace AdvLaser.AdvLaserObjects
{


     public class ShippingZoneRate
     {
          #region member variables
          private int m_intShippingZoneRateKey;
          private int m_intShippingZoneKey;
          private int m_intShippingRateGroupKey;
          private int m_intShippingRateTypeKey;
          private int m_intQuantity;
          private decimal m_decRate;
          #endregion

          #region public properties
          public int ShippingZoneRateKey
          {
               get { return m_intShippingZoneRateKey; }
               set { m_intShippingZoneRateKey = value; }
          }
          public int ShippingZoneKey
          {
               get { return m_intShippingZoneKey; }
               set { m_intShippingZoneKey = value; }
          }
          public int ShippingRateGroupKey
          {
               get { return m_intShippingRateGroupKey; }
               set { m_intShippingRateGroupKey = value; }
          }
          public int ShippingRateTypeKey
          {
               get { return m_intShippingRateTypeKey; }
               set { m_intShippingRateTypeKey = value; }
          }
          public int Quantity
          {
               get { return m_intQuantity; }
               set { m_intQuantity = value; }
          }
          public decimal Rate
          {
               get { return m_decRate; }
               set { m_decRate = value; }
          }
          #endregion

          #region data access methods
          public int Save()
          {
               return ShippingZoneRateDataAccess.SaveShippingZoneRate(this);
          }
          #endregion
     }
}
