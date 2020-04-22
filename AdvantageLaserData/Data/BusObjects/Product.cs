using System;
using AdvLaser.AdvLaserDataAccess;
using System.Collections;

namespace AdvLaser.AdvLaserObjects
{


     public class Product
     {
          #region member variables
          private int m_intProductKey;
          private int m_intProductTypeKey;
          private string m_strDescription;
          private decimal m_decPrice;
          private decimal m_decShippingRate;
          private int m_intQuantity;
          private decimal m_decColorSurcharge;
          private ArrayList m_checkFeatureOptionList = null;
          private ProductType m_ProductTypeObject;
          #endregion

          #region public properties
          public int ProductKey
          {
               get { return m_intProductKey; }
               set { m_intProductKey = value; }
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
          public decimal Price
          {
               get { return m_decPrice; }
               set { m_decPrice = value; }
          }
          public decimal ShippingRate
          {
              get { return m_decShippingRate; }
              set { m_decShippingRate = value; }
          }
          public int Quantity
          {
              get { return m_intQuantity; }
              set { m_intQuantity = value; }
          }
          public decimal ColorSurcharge
          {
              get { return m_decColorSurcharge; }
              set { m_decColorSurcharge = value; }
          }
          public string QuantityPriceDisplay
          {
              get
              {
                  if (ProductTypeKey == 12)
                  {
                      return Description;
                  }
                  else
                  {
                      return m_intQuantity.ToString() + " @ " + m_decPrice.ToString("#0.00") + "/each";
                  }
              }
          }

          public string ColorSurchargeQuantityPriceDisplay
          {
              get
              {
                  return m_intQuantity.ToString() + " @ " + (m_decPrice + m_decColorSurcharge).ToString("#0.00") + "/each";
              }
          }

          public ProductType ProductTypeObject
          {
              get
              {
                  if (m_ProductTypeObject == null)
                  {
                      m_ProductTypeObject = ProductTypeDataAccess.GetOne(m_intProductTypeKey);
                  }
                  return m_ProductTypeObject;
              }
          }
         public ArrayList CheckFeatureOptionList
          {
              get
              {
                  if (m_checkFeatureOptionList == null)
                  {
                      string sql = "select * from checkfeatureoption o join producttypecheckoptionxref xr on xr.checkfeatureoptionkey = o.checkfeatureoptionkey where xr.isavailable = 1 and xr.producttypekey = " + m_intProductTypeKey.ToString();
                      m_checkFeatureOptionList = CheckFeatureOptionDataAccess.GetList(sql);
                  }
                  return m_checkFeatureOptionList;
              }
          }
          #endregion

          #region data access methods
          public int Save()
          {
               return ProductDataAccess.SaveProduct(this);
          }
          #endregion
     }
}
