using System;
using AdvLaser.AdvLaserDataAccess;

namespace AdvLaser.AdvLaserObjects
{


     public class ShippingType
     {
          #region member variables
          private int m_intShippingTypeKey;
          private int m_intDisplayOrder;
          private string m_strDescription;
          private bool m_blnIsActive;
          private bool m_blnBillAtActualCharges;
          private decimal m_decAdditionalCharge;
          #endregion

          #region public properties
          public int ShippingTypeKey
          {
               get { return m_intShippingTypeKey; }
               set { m_intShippingTypeKey = value; }
          }
          public int DisplayOrder
          {
               get { return m_intDisplayOrder; }
               set { m_intDisplayOrder = value; }
          }
          public string Description
          {
               get { return m_strDescription; }
               set { m_strDescription = value; }
          }
          public bool IsActive
          {
               get { return m_blnIsActive; }
               set { m_blnIsActive = value; }
          }
          public bool BillAtActualCharges
          {
              get { return m_blnBillAtActualCharges; }
              set { m_blnBillAtActualCharges = value; }
          }
          public decimal AdditionalCharge
          {
               get { return m_decAdditionalCharge; }
               set { m_decAdditionalCharge = value; }
          }
          #endregion

          #region data access methods
          public int Save()
          {
               return ShippingTypeDataAccess.SaveShippingType(this);
          }
          #endregion
     }
}
