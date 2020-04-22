using System;
using AdvLaser.AdvLaserDataAccess;

namespace AdvLaser.AdvLaserObjects
{


     public class ProductType
     {
         public const int ENVELOPE_COMPATIBILITY_ADP = 1;
         public const int ENVELOPE_COMPATIBILITY_GENERIC = 2;
          #region member variables
          private int m_intProductTypeKey;
          private int m_intProductCategoryKey;
          private string m_strDescription;
          private int m_intShippingRateGroupKey;
          private int m_intEnvelopeCompatibilityKey;
         private ProductCategory m_objProductCategoryObject;
          #endregion

          #region public properties
         
          public int ProductTypeKey
          {
               get { return m_intProductTypeKey; }
               set { m_intProductTypeKey = value; }
          }
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

          public int ShippingRateGroupKey
          {
              get { return m_intShippingRateGroupKey; }
              set { m_intShippingRateGroupKey = value; }
          }
          public int EnvelopeCompatibilityKey 
          {
              get { return m_intEnvelopeCompatibilityKey; }
              set { m_intEnvelopeCompatibilityKey = value; }
          }
         public ProductCategory ProductCategoryObject
          {
              get
              {
                  if (m_objProductCategoryObject == null)
                  {
                      return ProductCategoryDataAccess.GetOne(m_intProductCategoryKey);
                  }
                  else
                  {
                      return m_objProductCategoryObject;
                  }
              }
              set
              {
                  m_objProductCategoryObject = value;
              }
          }

          #endregion

          #region data access methods
          public int Save()
          {
               return ProductTypeDataAccess.SaveProductType(this);
          }
          #endregion
     }
}
