using System;
using AdvLaser.AdvLaserDataAccess;
using System.Collections;

namespace AdvLaser.AdvLaserObjects
{


     public class Invoice
     {
          #region member variables
         private int m_intInvoiceKey;
         private int m_intCustomerKey;
         private DateTime m_dtmOrderDate;
         private DateTime m_dtmShippingDate;
         private string m_strComment;
         private decimal m_decShippingTotal;
         private int m_intCreditCardKey;
         private int m_intShippingTypeKey;
         private int m_intExpediteTypeKey;
         private int m_intExpediteSubTypeKey;
         private string m_strDebitAccount;
         private bool m_blnBillCharges;
         private decimal m_decExpediteAmount;
         private string m_strComputerIP;
         private string m_strSalesPersonID;
         private int m_intCouponKey;
         private string m_strReferralCode;
         private decimal m_decCouponDiscount;
        private byte[] m_debitAcct;

        private InvoiceItemCollection m_colInvoiceItems;
          private Customer m_objCustomerObject;          
          private CreditCard m_objCreditCard;
          private ShippingType m_objShippingType;
          private ExpediteType m_objExpediteType;
          private ExpediteSubType m_objExpediteSubType;
          #endregion

          #region public properties
          public int InvoiceKey
          {
               get { return m_intInvoiceKey; }
               set { m_intInvoiceKey = value; }
          }
          public int CustomerKey
          {
               get { return m_intCustomerKey; }
               set { m_intCustomerKey = value; }
          }
          public int CreditCardKey
          {
              get { return m_intCreditCardKey; }
              set { m_intCreditCardKey = value; }
          }
          public DateTime OrderDate
          {
               get { return m_dtmOrderDate; }
               set { m_dtmOrderDate = value; }
          }
          public DateTime ShippingDate
          {
               get { return m_dtmShippingDate; }
               set { m_dtmShippingDate = value; }
          }
          public string Comment
          {
               get { return m_strComment; }
               set { m_strComment = value; }
          }
          public decimal ShippingTotal
          {
              get { return m_decShippingTotal; }
              set { m_decShippingTotal = value; }
          }
          public int ShippingTypeKey
          {
              get { return m_intShippingTypeKey; }
              set { m_intShippingTypeKey = value; }
          }
          public int ExpediteTypeKey
          {
              get { return m_intExpediteTypeKey; }
              set { m_intExpediteTypeKey = value; }
          }
          public int ExpediteSubTypeKey
          {
              get { return m_intExpediteSubTypeKey; }
              set { m_intExpediteSubTypeKey = value; }
          }
          public string DebitAccount
          {
              get { return m_strDebitAccount; }
              set { m_strDebitAccount = value; }
          }
          public bool BillCharges
          {
              get { return m_blnBillCharges; }
              set { m_blnBillCharges = value; }
          }
          public decimal ExpediteAmount
          {
              get { return m_decExpediteAmount; }
              set { m_decExpediteAmount = value; }
          }
          public string ComputerIP
          {
              get { return m_strComputerIP; }
              set { m_strComputerIP = value; }
          }
          public string SalesPersonID
          {
              get { return m_strSalesPersonID; }
              set { m_strSalesPersonID = value; }
          }
          public int CouponKey
          {
              get { return m_intCouponKey; }
              set { m_intCouponKey = value; }
          }
          public string ReferralCode
          {
              get { return m_strReferralCode; }
              set { m_strReferralCode = value; }
          }
          public decimal CouponDiscount
          {
              get { return m_decCouponDiscount; }
              set { m_decCouponDiscount = value; }
          }
        public byte[] DebitAcct
        {
            get { return m_debitAcct; }
            set { m_debitAcct = value; }
        }
        #endregion

        #region data access methods
        public int Save()
          {
               return InvoiceDataAccess.SaveInvoice(this);
          }
          #endregion

          private class ShippingRateGroupQuantity
          {
              private int shippingRateGroupKey;
              private int quantity;

              public int ShippingRateGroupKey
              {
                  get { return shippingRateGroupKey; }
                  set { shippingRateGroupKey = value; }
              }
              public int Quantity
              {
                  get { return quantity; }
                  set { quantity = value; }
              }
          }

          public void RemoveInvoiceItem(int aProductKey, string aAccountNumber)
          {
              InvoiceItem itemToRemove = null;
              foreach (InvoiceItem item in m_colInvoiceItems)
              {
                  bool itemFound = false;
                  if (item.ProductKey == aProductKey)
                  {
                      if (item.DepositStampObject != null)
                      {
                          if (item.DepositStampObject.AccountNumber == aAccountNumber)
                          {
                              itemToRemove = item;
                              itemFound = true;
                          }
                      }

                      if (item.DepositSlipObject != null)
                      {
                          if (item.DepositSlipObject.AccountNumber == aAccountNumber)
                          {
                              itemToRemove = item;
                              itemFound = true;
                          }
                      }

                      if (item.CheckDetailObject != null)
                      {
                          if (item.CheckDetailObject.BankAccountNumber == aAccountNumber)
                          {
                              itemToRemove = item;
                              itemFound = true;
                          }
                      }
                      if (!itemFound)
                      {
                          itemToRemove = item;
                      }
                      
                  }
              }
              if (itemToRemove != null)
              {
                  m_colInvoiceItems.Remove(itemToRemove);
              }
          }

          public bool IsDuplicateInvoiceItem(InvoiceItem aInvoiceItem)
          {
              foreach (InvoiceItem item in m_colInvoiceItems)
              {
                  if (aInvoiceItem.ProductKey == item.ProductKey)
                  {
                      // check deposit stamps
                      if (item.DepositStampObject != null)
                      {
                          if (item.DepositStampObject.AccountNumber == aInvoiceItem.DepositStampObject.AccountNumber)
                          {
                              return true;
                          }
                      }
                      // check deposit slips
                      if (item.DepositSlipObject != null)
                      {
                          if (item.DepositSlipObject.AccountNumber == aInvoiceItem.DepositSlipObject.AccountNumber)
                          {
                              return true;
                          }
                      }
                      // check checks
                      if (item.CheckDetailObject != null)
                      {
                          if (item.CheckDetailObject.BankAccountNumber == aInvoiceItem.CheckDetailObject.BankAccountNumber)
                          {
                              return true;
                          }
                      }
                      //deposit slip books
                      if (item.DepositBookObject != null)
                      {
                          if (item.DepositBookObject.AccountNumber == aInvoiceItem.DepositBookObject.AccountNumber)
                          {
                              return true;
                          }
                      }
                  }
              }
              return false;
          }

          public void AddInvoiceItem(InvoiceItem aInvoiceItem)
          {
              if(m_colInvoiceItems == null)
              {
                  m_colInvoiceItems = new InvoiceItemCollection();
              }
              if (IsDuplicateInvoiceItem(aInvoiceItem))
              {
                  throw new Exception("Duplicate Account Numbers are not allowed for the same product");
              }
              m_colInvoiceItems.Add(aInvoiceItem);
          }

          public decimal CalculateGroundShipping(string stateName)
          {
              decimal total = 0;
              ArrayList list = new ArrayList();
              string sql = "select * from state where abbreviation = '" + stateName + "'";
              State state = StateDataAccess.GetOne(sql);
              if (state.ShippingZoneKey == Int32.MinValue)
              {
                  return 0;
              }
              int shippingZoneKey = state.ShippingZoneKey;

              foreach (InvoiceItem item in InvoiceItems)
              {
                  bool add = true;
                  if (item.CheckDetailObject != null)
                  {
                      add = item.CheckDetailObject.Approved;
                  }
                  if (add)
                  {
                      // look for shipping rate for InvoiceItem, will be here is Zone Rates do not apply
                      if (item.ShippingRate > 0)
                      {
                          total += item.ShippingRate;
                      }
                      else
                      {
                          // calculate zone shipping
                          bool bFound = false;
                          Product aProduct = ProductDataAccess.GetOne(Convert.ToInt32(item.ProductKey));
                          ProductType aProductType = ProductTypeDataAccess.GetOne(Convert.ToInt32(aProduct.ProductTypeKey));
                          // find all ShippingRateGroups
                          if (list.Count == 0)
                          {
                              ShippingRateGroupQuantity q = new ShippingRateGroupQuantity();
                              q.ShippingRateGroupKey = aProductType.ShippingRateGroupKey;
                              q.Quantity = item.ShippingQuantity;
                              list.Add(q);
                          }
                          else
                          {
                              // find quantity of items for each ShippingRateGroup
                              foreach (ShippingRateGroupQuantity a in list)
                              {
                                  if (a.ShippingRateGroupKey == aProductType.ShippingRateGroupKey)
                                  {
                                      a.Quantity += item.ShippingQuantity;
                                      bFound = true;
                                      break;
                                  }
                              }
                              if (!bFound)
                              {
                                  ShippingRateGroupQuantity q = new ShippingRateGroupQuantity();
                                  q.ShippingRateGroupKey = aProductType.ShippingRateGroupKey;
                                  q.Quantity = item.ShippingQuantity;
                                  list.Add(q);
                              }
                          }
                      }
                  }
              }
              // calculate shippingrate for each ShippingRateGroup
              foreach (ShippingRateGroupQuantity a in list)
              {
                  total += getShippingForShippingRateGroup(a, shippingZoneKey);
              }
              return total;
          }
         
          public decimal CalculateShipping()
          {
              decimal total = 0;
              ArrayList list = new ArrayList();
              ShippingType aShippingType = ShippingTypeDataAccess.GetOne(m_intShippingTypeKey);
              if (aShippingType == null)
              {
                  if (m_objExpediteSubType != null)
                  {
                    ExpediteSubType expediteSubType = ExpediteSubTypeDataAccess.GetOne(m_objExpediteSubType.ExpediteSubTypeKey);
                  
                      total += expediteSubType.AdditionalCharge;
                      if (expediteSubType.BillAtActualCharges)
                      {
                          return 0;
                      }
                  }
              }
              else
              {
                  if (aShippingType.BillAtActualCharges)
                  {
                      return 0;
                  }
              }
              Address aShippingAddress = new Address();
                    foreach (Address a in CustomerObject.Addresses)
                    {
                        if (a.AddressTypeKey == 1)
                        {
                            aShippingAddress = a;
                        }
                    }
              string stateName = aShippingAddress.State;
              string sql = "select * from state where abbreviation = '" + stateName + "'";
              State state = StateDataAccess.GetOne(sql);
              if (state != null && state.ShippingZoneKey == Int32.MinValue)
              {
                  return 0;
              }
              int shippingZoneKey = state == null ? 0 : state.ShippingZoneKey;
              
              foreach (InvoiceItem item in InvoiceItems)
              {
                  bool add = true;
                  if (item.CheckDetailObject != null)
                  {
                      add = item.CheckDetailObject.Approved;
                  }
                  if (add)
                  {
                      // look for shipping rate for InvoiceItem, will be here is Zone Rates do not apply
                      if (item.ShippingRate > 0)
                      {
                          total += item.ShippingRate;
                      }
                      else
                      {
                          // calculate zone shipping
                          bool bFound = false;
                          Product aProduct = ProductDataAccess.GetOne(Convert.ToInt32(item.ProductKey));
                          ProductType aProductType = ProductTypeDataAccess.GetOne(Convert.ToInt32(aProduct.ProductTypeKey));
                          // find all ShippingRateGroups
                          if (list.Count == 0)
                          {
                              ShippingRateGroupQuantity q = new ShippingRateGroupQuantity();
                              q.ShippingRateGroupKey = aProductType.ShippingRateGroupKey;
                              q.Quantity = item.ShippingQuantity;
                              list.Add(q);
                          }
                          else
                          {
                              // find quantity of items for each ShippingRateGroup
                              foreach (ShippingRateGroupQuantity a in list)
                              {
                                  if (a.ShippingRateGroupKey == aProductType.ShippingRateGroupKey)
                                  {
                                      a.Quantity += item.ShippingQuantity;
                                      bFound = true;
                                      break;
                                  }
                              }
                              if (!bFound)
                              {
                                  ShippingRateGroupQuantity q = new ShippingRateGroupQuantity();
                                  q.ShippingRateGroupKey = aProductType.ShippingRateGroupKey;
                                  q.Quantity = item.ShippingQuantity;
                                  list.Add(q);
                              }
                          }
                      }
                  }
              }
              // calculate shippingrate for each ShippingRateGroup
              foreach (ShippingRateGroupQuantity a in list)
              {
                  total += getShippingForShippingRateGroup(a,shippingZoneKey);
              }

              if (aShippingType != null)
              {
                  total += aShippingType.AdditionalCharge;
              }

              return total;
          }

          

          private decimal getShippingForShippingRateGroup(ShippingRateGroupQuantity q, int shippingZoneKey)
          {
              string sql = "select * from ShippingZoneRate where ShippingZoneRateKey = ( " +
                    "select MIN(shippingzoneratekey) from ShippingZOneRate where ShippingZoneKey = " + shippingZoneKey.ToString () + " " +
                    "and Quantity >= " + q.Quantity.ToString() +")";
              ShippingZoneRate shippingZoneRate = ShippingZoneRateDataAccess.GetOne(sql);
              int shippingRateTypeKey = shippingZoneRate.ShippingRateTypeKey;
              decimal rate = shippingZoneRate.Rate;
              if (shippingRateTypeKey == 1)
              {
                  return rate;
              }
              if (shippingRateTypeKey == 2)
              {
                  return rate * q.Quantity;
              }
              return 0;
          }

          public decimal OrderTotal()
          {
              decimal total = 0;
              foreach (InvoiceItem item in InvoiceItems)
              {
                  bool add = true;
                  bool addColorSurcharge = false;
                  if (item.CheckDetailObject != null)
                  {
                      add = item.CheckDetailObject.Approved;
                      if (item.CheckDetailObject.ColorLogo)
                      {
                          addColorSurcharge = true;
                      }
                  }     
                  if (add)
                  {
                      if (addColorSurcharge)
                      {
                          total += item.ShippingQuantity * item.ProductObject.ColorSurcharge;
                      }
                      total += item.Price;
                  }
              }
              return total;
          }
          

          public InvoiceItemCollection InvoiceItems
          {
              get
              {
                  if (m_colInvoiceItems == null)
                  {
                      m_colInvoiceItems = InvoiceItemCollectionDataAccess.GetInvoiceItemsForInvoice(m_intInvoiceKey);
                  }

                  return m_colInvoiceItems; 
              }
          }

          public Customer CustomerObject
          {
              get
              {
                  if (m_objCustomerObject == null)
                  {
                      return CustomerDataAccess.GetOne(m_intCustomerKey);
                  }
                  else
                  {
                      return m_objCustomerObject;
                  }
              }
              set
              {
                  m_objCustomerObject = value;
              }
          }

          public CreditCard CreditCardObject
          {
              get
              {
                  if (m_objCreditCard == null)
                  {
                      return CreditCardDataAccess.GetOne(m_intCreditCardKey);
                  }
                  else
                  {
                      return m_objCreditCard;
                  }
              }
              set
              {
                  m_objCreditCard = value;
              }
          }

          public ShippingType ShippingTypeObject
          {
              get
              {
                  if (m_objShippingType == null)
                  {
                      return ShippingTypeDataAccess.GetOne(m_intShippingTypeKey);
                  }
                  else
                  {
                      return m_objShippingType;
                  }
              }
              set
              {
                  m_objShippingType = value;
              }
          }

          public ExpediteType ExpediteTypeObject
          {
              get
              {
                  if (m_objExpediteType == null)
                  {
                      return ExpediteTypeDataAccess.GetOne(m_intExpediteTypeKey);
                  }
                  else
                  {
                      return m_objExpediteType;
                  }
              }
              set
              {
                  m_objExpediteType = value;
              }
          }

          public ExpediteSubType ExpediteSubTypeObject
          {
              get
              {
                  if (m_objExpediteSubType == null)
                  {
                      return ExpediteSubTypeDataAccess.GetOne(m_intExpediteSubTypeKey);
                  }
                  else
                  {
                      return m_objExpediteSubType;
                  }
              }
              set
              {
                  m_objExpediteSubType = value;
              }
          }

          public bool HasDepositSlip()
          {
              foreach (InvoiceItem item in m_colInvoiceItems)
              {
                  if (item.DepositStampObject != null)
                  {
                      return true;
                  }
              }
              return false;
          }

          public InvoiceItem GetInvoiceItem(int aProductKey, string aAccountNumber)
          {
              if (aProductKey > 0)
              {
                  Product p = ProductDataAccess.GetOne(aProductKey);
                  int productTypeKey = p.ProductTypeKey;


                  switch (productTypeKey)
                  {
                      case 1:
                          foreach (InvoiceItem item in m_colInvoiceItems)
                          {
                              if (item.ProductKey == aProductKey)
                              {
                                  if (item.DepositSlipObject.AccountNumber == aAccountNumber)
                                  {
                                      return item;
                                  }
                              }
                          }
                          break;
                      case 3:
                          foreach (InvoiceItem item in m_colInvoiceItems)
                          {
                              if (item.ProductKey == aProductKey)
                              {
                                  if (item.DepositStampObject.AccountNumber == aAccountNumber)
                                  {
                                      return item;
                                  }
                              }
                          }
                          break;
                      case 4:
                      case 5:
                      case 6:
                      case 7:
                          foreach (InvoiceItem item in m_colInvoiceItems)
                          {
                              if (item.ProductKey == aProductKey)
                              {
                                  if (item.CheckDetailObject.BankAccountNumber == aAccountNumber)
                                  {
                                      return item;
                                  }
                              }
                          }
                          break;
                      case 8:
                          foreach (InvoiceItem item in m_colInvoiceItems)
                          {
                              if (item.ProductKey == aProductKey)
                              {
                                  if (item.CheckDetailObject.BankAccountNumber == aAccountNumber)
                                  {
                                      return item;
                                  }
                              }
                          }
                          break;
                      case 9:
                          foreach (InvoiceItem item in m_colInvoiceItems)
                          {
                              if (item.ProductKey == aProductKey)
                              {
                                  if (item.CheckDetailObject.BankAccountNumber == aAccountNumber)
                                  {
                                      return item;
                                  }
                              }
                          }
                          break;
                      case 12:
                          foreach (InvoiceItem item in m_colInvoiceItems)
                          {
                              if (item.ProductKey == aProductKey)
                              {
                                  if (item.DepositBookObject.AccountNumber == aAccountNumber)
                                  {
                                      return item;
                                  }
                              }
                          }
                          break;
                  }

              }
              return null;
          }

          public bool HasCheck()
          {
              if (m_colInvoiceItems != null)
              {
                  foreach (InvoiceItem item in m_colInvoiceItems)
                  {
                      if (item.CheckDetailObject != null)
                      {
                          return true;
                      }
                  }
              }
              return false;
          }
          public bool HasADPCheck()
          {
              if (m_colInvoiceItems != null)
              {
                  foreach (InvoiceItem item in m_colInvoiceItems)
                  {
                      if (item.CheckDetailObject != null && item.ProductObject.ProductTypeObject.EnvelopeCompatibilityKey == ProductType.ENVELOPE_COMPATIBILITY_ADP)
                      {
                          return true;
                      }
                  }
              }
              return false;
          }
     }
}
