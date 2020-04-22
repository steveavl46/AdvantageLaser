using System;
using AdvLaser.AdvLaserDataAccess;

namespace AdvLaser.AdvLaserObjects
{


     public class ProductCategory
     {
         public const int CATEGORY_DEPOSITSLIP = 1;
         public const int CATEGORY_DEPOSITSTAMP = 2;
         public const int CATEGORY_CHECK = 3;
         public const int CATEGORY_ENVELOPE = 4;
         public const int CATEGORY_DEPOSITBOOK = 5;
          #region member variables
          private int m_intProductCategoryKey;
          private string m_strDescription;
          #endregion

          #region public properties
          public int ProductCategoryKey
          {
               get { return m_intProductCategoryKey; }
               set { m_intProductCategoryKey = value; }
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
               return ProductCategoryDataAccess.SaveProductCategory(this);
          }
          #endregion
     }
}
