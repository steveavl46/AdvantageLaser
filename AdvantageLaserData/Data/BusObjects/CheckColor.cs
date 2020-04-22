using System;
using AdvLaser.AdvLaserDataAccess;

namespace AdvLaser.AdvLaserObjects
{


     public class CheckColor 
     {
          #region member variables
          private int m_intCheckColorKey;
          private int m_intProductTypeKey;
          private string m_strDescription;
          private string m_strImagePath;
          private string m_strFullCheckImagePath;
          private string m_strPartNumber;
          #endregion

          #region public properties
          public int CheckColorKey
          {
               get { return m_intCheckColorKey; }
               set { m_intCheckColorKey = value; }
          }
          public int ProductTypeKey
          {
               get { return m_intProductTypeKey; }
               set { m_intProductTypeKey = value; }
          }
          public string Description
          {
               get { return m_strDescription; }
               set { m_strDescription = value; }
          }
          public string ImagePath
          {
               get { return m_strImagePath; }
               set { m_strImagePath = value; }
          }
          public string FullCheckImagePath
          {
              get { return m_strFullCheckImagePath; }
              set { m_strFullCheckImagePath = value; }
          }
          public string PartNumber
          {
              get { return m_strPartNumber; }
              set { m_strPartNumber = value; }
          }
          #endregion

          #region data access methods
          public int Save()
          {
               return CheckColorDataAccess.SaveCheckColor(this);
          }
          #endregion
     }
}
