using System;
using AdvLaser.AdvLaserDataAccess;

namespace AdvLaser.AdvLaserObjects
{


     public class TypeFace
     {
          #region member variables
          private int m_intTypeFaceKey;
          private string m_strDescription;
          #endregion

          #region public properties
          public int TypeFaceKey
          {
               get { return m_intTypeFaceKey; }
               set { m_intTypeFaceKey = value; }
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
               return TypeFaceDataAccess.SaveTypeFace(this);
          }
          #endregion
     }
}
