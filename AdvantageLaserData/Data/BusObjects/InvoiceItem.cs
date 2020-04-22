using System;
using AdvLaser.AdvLaserDataAccess;
//using AdvantageLaserData.Data.BusObjects.DataAccess;

namespace AdvLaser.AdvLaserObjects
{


     public class InvoiceItem
     {
          #region member variables
          private int m_intInvoiceItemKey;
          private int m_intInvoiceKey;
          private int m_intProductKey;
          private int m_intDepositSlipKey;
          private int m_intDepositStampKey;
          private int m_intDepositBookKey;
          private string m_strDescription;
          private int m_intQuantity;
          private decimal m_decPrice;
          private DepositSlip m_DepositSlipObject;
          private DepositStamp m_DepositStampObject;
          private CheckDetail m_CheckDetailObject;
          private Product m_ProductObject;
          private DepositBook m_DepositBookObject;
          private decimal m_decShippingRate;
          private int m_intCheckDetailKey;
          private string m_strSoftwareName;
          #endregion

          #region public properties
          public int InvoiceItemKey
          {
               get { return m_intInvoiceItemKey; }
               set { m_intInvoiceItemKey = value; }
          }
          public int InvoiceKey
          {
               get { return m_intInvoiceKey; }
               set { m_intInvoiceKey = value; }
          }
          public int ProductKey
          {
               get { return m_intProductKey; }
               set { m_intProductKey = value; }
          }
          public int DepositSlipKey
          {
              get {return m_intDepositSlipKey;}
              set { m_intDepositSlipKey = value; }
          }

          public int DepositBookKey
          {
              get { return m_intDepositBookKey; }
              set { m_intDepositBookKey = value; }
          }

          public int DepositStampKey
          {
              get { return m_intDepositStampKey; }
              set { m_intDepositStampKey = value; }
          }
          public string Description
          {
               get { return m_strDescription; }
               set { m_strDescription = value; }
          }
          public int Quantity
          {
               get { return m_intQuantity; }
               set { m_intQuantity = value; }
          }
          public decimal Price
          {
               get { return m_decPrice; }
               set { m_decPrice = value; }
          }

          public string SoftwareName
          {
              get { return m_strSoftwareName; }
              set { m_strSoftwareName = value; }
          }
          public int ShippingQuantity
          {
              get
              {
                  if (m_ProductObject.ProductTypeKey == 8)
                  {
                      switch (m_intQuantity)
                      {
                          case 250:
                              return 84;
                          case 500:
                              return 167;
                          case 1000:
                              return 334;
                          case 2000:
                              return 667;
                          case 3000:
                              return 1000;
                          case 5000:
                              return 1667;
                          default:
                              return 1000;
                      }
                  }
                  else
                  {
                      if (m_ProductObject.ProductTypeKey == 10 || m_ProductObject.ProductTypeKey == 11)
                      {
                          return m_intQuantity * 1000;
                      }
                      else
                      {
                          return m_intQuantity;
                      }
                  }
              }
          }
          public DepositSlip DepositSlipObject
          {
              get 
              {
                  if (m_DepositSlipObject == null)
                  {
                      if (ProductObject.ProductTypeObject.ProductCategoryKey == 1)
                      {
                          m_DepositSlipObject = DepositSlipDataAccess.GetOne(m_intDepositSlipKey);
                      }
                  }
                  return m_DepositSlipObject; 
              }
              set { m_DepositSlipObject = value; }
          }

          public DepositBook DepositBookObject
          {
              get
              {
                  if (m_DepositBookObject == null)
                  {
                      if (ProductObject != null &&  ProductObject.ProductTypeObject.ProductCategoryKey == 5)
                      {
                          m_DepositBookObject = DepositBookDataAccess.GetOne(m_intDepositBookKey);
                      }
                  }
                  return m_DepositBookObject;
              }
              set { m_DepositBookObject = value; }
          }
          public DepositStamp DepositStampObject
          {
              get 
              {
                  if (m_DepositStampObject == null)
                  {
                      if (ProductObject.ProductTypeObject.ProductCategoryKey == 2)
                      {
                          m_DepositStampObject = DepositStampDataAccess.GetOne(m_intDepositStampKey);
                      }
                  }
                  return m_DepositStampObject; 
              }
              set { m_DepositStampObject = value; }
          }
          public decimal ShippingRate
          {
              get { return m_decShippingRate; }
              set { m_decShippingRate = value; }
          }
          public int CheckDetailKey
          {
              get { return m_intCheckDetailKey; }
              set { m_intCheckDetailKey = value; }
          }
          public CheckDetail CheckDetailObject
          {
              get 
              {
                  if (m_CheckDetailObject == null)
                  {
                      if (ProductObject != null && ProductObject.ProductTypeObject.ProductCategoryKey == 3)
                      {
                          m_CheckDetailObject = CheckDetailDataAccess.GetOne(m_intCheckDetailKey);
                      }
                  }
                  return m_CheckDetailObject; 
              }
              set { m_CheckDetailObject = value; }
          }
          public Product ProductObject
          {
              get
              {
                  if (m_ProductObject == null)
                  {
                      m_ProductObject = ProductDataAccess.GetOne(m_intProductKey);
                  }
                  return m_ProductObject;
              }
          }
          #endregion

          #region data access methods
          public int Save()
          {
               return InvoiceItemDataAccess.SaveInvoiceItem(this);
          }
          #endregion
     }
}
