using System;
using AdvLaser.AdvLaserDataAccess;

namespace AdvLaser.AdvLaserObjects
{


     public class ExpediteType
     {
          #region member variables
          private int m_intExpediteTypeKey;
          private int m_intDisplayOrder;
          private string m_strDescription;
          private bool m_blnIsActive;
          private decimal m_decAdditionalCharge;
          #endregion

          #region public properties
          public int ExpediteTypeKey
          {
               get { return m_intExpediteTypeKey; }
               set { m_intExpediteTypeKey = value; }
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
          public decimal AdditionalCharge
          {
               get { return m_decAdditionalCharge; }
               set { m_decAdditionalCharge = value; }
          }
          #endregion

          #region data access methods
          public int Save()
          {
               return ExpediteTypeDataAccess.SaveExpediteType(this);
          }
          #endregion
     }
}
