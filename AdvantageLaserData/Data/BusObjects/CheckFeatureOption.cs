using System;
using AdvLaser.AdvLaserDataAccess;

namespace AdvLaser.AdvLaserObjects
{


     public class CheckFeatureOption
     {
          #region member variables
          private int m_intCheckFeatureOptionKey;
          private string m_strDescription;
          #endregion

          #region public properties
          public int CheckFeatureOptionKey
          {
               get { return m_intCheckFeatureOptionKey; }
               set { m_intCheckFeatureOptionKey = value; }
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
               return CheckFeatureOptionDataAccess.SaveCheckFeatureOption(this);
          }
          #endregion
     }
}
