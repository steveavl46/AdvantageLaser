using System;
using System.Collections;
using AdvLaser.AdvLaserDataAccess;
using AdvantageLaserData.AdvLaserObjects;

namespace AdvLaser.AdvLaserObjects
{


     public class Customer
     {
          #region member variables
          private int m_intCustomerKey;
          private string m_strFirstName;
          private string m_strLastName;
          private string m_strBusinessName;
          private string m_strEMailAddress;
          private string m_strAlternateEMailAddress;
          private string m_strDayPhone;
          private string m_strEveningPhone;
          private string m_strCellPhone;
          private string m_strFaxNumber;
          private AddressCollection m_colAddressList;
          private Address m_ShippingAddressObject;
          private Address m_BillingAddressObject;
          #endregion

          #region public properties
          public int CustomerKey
          {
               get { return m_intCustomerKey; }
               set { m_intCustomerKey = value; }
          }
          public string FirstName
          {
               get { return m_strFirstName; }
               set { m_strFirstName = value; }
          }
          public string LastName
          {
               get { return m_strLastName; }
               set { m_strLastName = value; }
          }
          public string BusinessName
          {
               get { return m_strBusinessName; }
               set { m_strBusinessName = value; }
          }
          public string EMailAddress
          {
               get { return m_strEMailAddress; }
               set { m_strEMailAddress = value; }
          }
          public string AlternateEMailAddress
          {
               get { return m_strAlternateEMailAddress; }
               set { m_strAlternateEMailAddress = value; }
          }
          public string DayPhone
          {
               get { return m_strDayPhone; }
               set { m_strDayPhone = value; }
          }
          public string EveningPhone
          {
               get { return m_strEveningPhone; }
               set { m_strEveningPhone = value; }
          }
          public string CellPhone
          {
               get { return m_strCellPhone; }
               set { m_strCellPhone = value; }
          }

          public string FaxNumber
          {
              get { return m_strFaxNumber; }
              set { m_strFaxNumber = value; }
          }
          #endregion

         public void AddAddress(Address aAddress)
         {
             if (m_colAddressList == null)
             {
                 m_colAddressList = new AddressCollection();
             }
             m_colAddressList.Add(aAddress);
         }

         public AddressCollection Addresses
         {
             get 
             {
                 if (m_colAddressList == null)
                 {
                     m_colAddressList = AddressCollectionDataAccess.GetAddressesForCustomer(m_intCustomerKey);
                 }
                 return m_colAddressList; 
             }
         }

         public Address ShippingAddressObject
         {
             get
             {
                 if (m_ShippingAddressObject == null)
                 {
                     foreach (Address a in Addresses)
                     {
                         if (a.AddressTypeKey == 1)
                         {
                             m_ShippingAddressObject = a;
                             break;
                         }
                     }
                 }
                 return m_ShippingAddressObject;
             }
         }

         public Address BillingAddressObject
         {
             get
             {
                 if (m_BillingAddressObject == null)
                 {
                     foreach (Address a in Addresses)
                     {
                         if (a.AddressTypeKey == 2)
                         {
                             m_BillingAddressObject = a;
                             break;
                         }
                     }                     
                 }
                 return m_BillingAddressObject;
             }
         }


          #region data access methods
          public int Save()
          {
               return CustomerDataAccess.SaveCustomer(this);
          }
          #endregion
     }
}
