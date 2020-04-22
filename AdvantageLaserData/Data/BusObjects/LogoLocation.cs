using System;
using AdvLaser.AdvLaserDataAccess;

namespace AdvLaser.AdvLaserObjects
{


    public class LogoLocation
     {
          #region member variables
          private int m_intLogoLocationKey;
          private string m_strDescription;
          #endregion

          #region public properties
          public int LogoLocationKey
          {
               get { return m_intLogoLocationKey; }
               set { m_intLogoLocationKey = value; }
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
               return LogoLocationDataAccess.SaveLogoLocation(this);
          }
          #endregion
     }
}
