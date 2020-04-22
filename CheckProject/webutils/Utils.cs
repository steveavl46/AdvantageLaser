using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

using AdvLaser.AdvLaserDataAccess;
using AdvLaser.AdvLaserObjects;
using System.Data.SqlClient;
using System.Data;
using System.Text;
using System.Collections;

namespace CheckProject.WebUtils
{
    public class WebUtils
    {
        static WebUtils()
        {
        }

        public static void FillStateDropDown(DropDownList ddlList)
        {
            string sql = "select abbreviation as value, abbreviation as display from state order by abbreviation";
            FillDropDownList(ddlList, sql);

        }

        public static void FillDropDownList(DropDownList ddlList, string sql)
        {
            using (SqlConnection cn = new SqlConnection(BaseDataAccess.ConnectionString))
            {
                SqlCommand sqlCmd = new SqlCommand();
                BaseDataAccess.SetCommandType(sqlCmd, CommandType.Text, sql);

                sqlCmd.Connection = cn;
                cn.Open();
                SqlDataReader reader = sqlCmd.ExecuteReader();

                while (reader.Read())
                {
                    string aValue = Convert.ToString(reader["value"]);
                    string aDisplay = (string)reader["display"];
                    ListItem item = new ListItem(aDisplay, aValue);
                    ddlList.Items.Add(item);
                }
            }
        }

        public static string GetInvoiceForDisplay(Invoice aInvoice, bool bHTML)
        {
            return GetInvoiceForDisplay(aInvoice, bHTML, false);
        }

        public static string GetInvoiceForDisplay(Invoice aInvoice, bool bHTML, bool bIncludeIP)
        {
            StringBuilder sb = new StringBuilder();
            string computerIP = aInvoice.ComputerIP;
            string aCompanyName = aInvoice.CustomerObject.BusinessName;
            string aCustomerName = aInvoice.CustomerObject.FirstName + " " + aInvoice.CustomerObject.LastName;
            string aCustomerEMail = aInvoice.CustomerObject.EMailAddress;
            string aCustomerPhone = aInvoice.CustomerObject.DayPhone;
            string aExpedite = "";
            if (aInvoice.ExpediteTypeObject != null)
            {
                aExpedite = aInvoice.ExpediteTypeObject.Description;
            }

            Address aBillingAddress = aInvoice.CustomerObject.BillingAddressObject;
            Address aShippingAddress = aInvoice.CustomerObject.ShippingAddressObject;
            string aBillingLine1 = aBillingAddress.Line1;
            string aBillingLine2 = aBillingAddress.Line2;
            string aBillingCity = aBillingAddress.City;
            string aBillingState = aBillingAddress.State;
            string aBillingZipCode = aBillingAddress.ZipCode;

            string aShippingLine1 = aShippingAddress.Line1;
            string aShippingLine2 = aShippingAddress.Line2;
            string aShippingCity = aShippingAddress.City;
            string aShippingState = aShippingAddress.State;
            string aShippingZipCode = aShippingAddress.ZipCode;
            decimal aShippingAmount = 0;
            string aShippingMethod = "";
            decimal aOrderTotal = 0;
            bool aShipAtActualCharges = false;
            string aExpediteDescription = "";
            decimal aExpediteAmount = 0;


            sb.Append(makeBold("Order #: ",bHTML));
            sb.Append(aInvoice.InvoiceKey.ToString());
            sb.Append(newLine(bHTML));
            sb.Append(newLine(bHTML));
            if (bIncludeIP)
            {
                sb.Append(makeBold("IP Address: ", bHTML));
                sb.Append(computerIP);
                sb.Append(newLine(bHTML));
            }
            sb.Append(makeBold("Company Name: ",bHTML));
            sb.Append(aCompanyName);
            sb.Append(newLine(bHTML));
            sb.Append(makeBold("Customer Name: ",bHTML));
            sb.Append(aCustomerName);
            sb.Append(newLine(bHTML));
            sb.Append(makeBold("EMail address: ",bHTML));
            sb.Append(aCustomerEMail);
            sb.Append(newLine(bHTML));
            sb.Append(makeBold("Phone: ",bHTML));
            sb.Append(aCustomerPhone);
            sb.Append(newLine(bHTML));
            sb.Append(newLine(bHTML));
            
            if (bIncludeIP && aInvoice.SalesPersonID != null)
            {
                sb.Append(makeBold("Sales Person: ", bHTML));
                sb.Append(aInvoice.SalesPersonID);
                sb.Append(newLine(bHTML));
                sb.Append(newLine(bHTML));
            }
            
            sb.Append(makeBold("Billing Address",bHTML));
            sb.Append(newLine(bHTML));
            //sb.Append("Line 1: ");
            sb.Append(aBillingLine1);
            sb.Append(newLine(bHTML));
            //sb.Append("Line 2: ");
            if (aBillingLine2.Length > 0)
            {
                sb.Append(aBillingLine2);
                sb.Append(newLine(bHTML));
            }
            //sb.Append("Billing City, State, Zip: ");
            sb.Append(aBillingCity);
            sb.Append(", ");
            sb.Append(aBillingState);
            sb.Append(" " );
            sb.Append(aBillingZipCode);
            sb.Append(newLine(bHTML));
            sb.Append(newLine(bHTML));
            sb.Append(makeBold("Shipping Address:",bHTML));
            sb.Append(newLine(bHTML));
            //sb.Append("Line 1: ");
            sb.Append(aShippingLine1);
            sb.Append(newLine(bHTML));
            //sb.Append("Line 2: ");
            if (aShippingLine2.Length > 0)
            {
                sb.Append(aShippingLine2);
                sb.Append(newLine(bHTML));
            }
            //sb.Append("Shipping City, State, Zip: ");
            sb.Append(aShippingCity);
            sb.Append(", ");
            sb.Append(aShippingState);
            sb.Append(" ");
            sb.Append(aShippingZipCode);
            sb.Append(newLine(bHTML));
            sb.Append(newLine(bHTML));
            sb.Append(makeBold("Order details",bHTML));
            sb.Append(newLine(bHTML));

            
            foreach (InvoiceItem item in aInvoice.InvoiceItems)
            {
                bool addColorSurcharge = false;
                Product aProduct = ProductDataAccess.GetOne(Convert.ToInt32(item.ProductKey));
                ProductType aProductType = ProductTypeDataAccess.GetOne(Convert.ToInt32(aProduct.ProductTypeKey));
                string aDescription = "";
                string aAccountNumber = "";
                string aPrice = "";
                if (item.DepositStampObject != null)
                {
                    aAccountNumber = BaseDataAccess.Decrypt(item.DepositStampObject.AcctNumber);
                    aDescription = aProductType.Description + " - " + item.Description;
                }
                if (item.DepositSlipObject != null)
                {
                    aAccountNumber = BaseDataAccess.Decrypt(item.DepositSlipObject.AcctNumber);
                    aDescription = aProduct.Description + " - " + aProductType.Description + " - " + item.Description;
                }
                if (item.CheckDetailObject != null)
                {
                    aAccountNumber = BaseDataAccess.Decrypt(item.CheckDetailObject.AcctNumber);
                    CheckColor checkColor = CheckColorDataAccess.GetOne(item.CheckDetailObject.CheckColorKey);
                    string productDescription = aProductType.Description;
                    if (!bIncludeIP)
                    {
                        if (!String.IsNullOrEmpty(item.SoftwareName))
                        {
                            productDescription = "Voucher Checks for " + item.SoftwareName;
                        }
                    }
                    aDescription = checkColor.PartNumber + " - " + productDescription + " - " + item.Description + " (" + checkColor.Description + ")";
                    addColorSurcharge = item.CheckDetailObject.ColorLogo;
                }
                if (item.DepositBookObject != null)
                {
                    aAccountNumber = BaseDataAccess.Decrypt(item.DepositBookObject.AcctNumber);
                    aDescription = aProductType.Description + " - " + aProduct.Description;
                }
                if (item.ProductObject.ProductTypeObject.ProductCategoryKey == 4)
                {
                    aDescription = item.Quantity.ToString() + item.Description.Substring(2);
                }

                aAccountNumber = protectAccount(aAccountNumber);
                aPrice = item.Price.ToString("$#,##0.00");
                sb.Append("Item: ");
                sb.Append(aDescription);
                sb.Append(newLine(bHTML));
                if (bIncludeIP && !String.IsNullOrEmpty(item.SoftwareName))
                {
                    sb.Append("Software alias: ");
                    sb.Append(item.SoftwareName);
                    sb.Append(newLine(bHTML));
                }
                if (item.ProductObject.ProductTypeObject.ProductCategoryKey != 4)
                {
                    sb.Append("Account: ");
                    sb.Append(aAccountNumber);
                    sb.Append(newLine(bHTML));
                }
                sb.Append("Price: ");
                sb.Append(aPrice);
                sb.Append(newLine(bHTML));

                if (addColorSurcharge)
                {

                    sb.Append("Color Logo Surcharge: ");

                    decimal colorSurcharge = item.ShippingQuantity * item.ProductObject.ColorSurcharge;
                    sb.Append(colorSurcharge.ToString("$#,##0.00"));
                    sb.Append(newLine(bHTML));
                }

            }
            sb.Append(newLine(bHTML));
            sb.Append(newLine(bHTML));
            sb.Append(makeBold("Sub-Total: ",bHTML));
            sb.Append((aInvoice.OrderTotal()).ToString("$#,##0.00"));
            aOrderTotal += aInvoice.OrderTotal();
            sb.Append(newLine(bHTML));
            aShippingAmount = aInvoice.ShippingTotal;
            decimal aExtraCharge = 0;
            if (aInvoice.ShippingTypeObject != null)
            {
                aShippingMethod = aInvoice.ShippingTypeObject.Description;
                aExtraCharge = aInvoice.ShippingTypeObject.AdditionalCharge;
                if (aExtraCharge > 0)
                {
                    aShippingMethod += " " + aExtraCharge.ToString("$#.##");
                }
            }

            if (aInvoice.ShippingTypeObject != null)
            {
                aShipAtActualCharges = aInvoice.ShippingTypeObject.BillAtActualCharges;
            }
            if (aInvoice.ExpediteSubTypeObject != null)
            {
                aShippingMethod = aInvoice.ExpediteSubTypeObject.ShortDescription;
            }

            sb.Append(makeBold("Shipping method: ",bHTML));
            sb.Append(aShippingMethod);
            sb.Append(newLine(bHTML));
            sb.Append(makeBold("Shipping amount: ",bHTML));
            if (aShipAtActualCharges)
            {
                sb.Append("Actual charges"); 
            }
            else
            {
                sb.Append(aShippingAmount.ToString("$#,##0.00"));
                aOrderTotal += aShippingAmount;
            }
            sb.Append(newLine(bHTML));
            if (aInvoice.ExpediteTypeObject != null)
            {
                aExpediteAmount = aInvoice.ExpediteTypeObject.AdditionalCharge;
                sb.Append(makeBold("Expedited processing: ",bHTML));
                sb.Append(aExpediteAmount.ToString("$#,##0.00"));
                aOrderTotal += aExpediteAmount;
                sb.Append(newLine(bHTML));
            }
            decimal discount = 0;
            if (aInvoice.CouponDiscount != null && aInvoice.CouponDiscount > 0)
            {
                Coupon coupon = CouponDataAccess.GetOne(aInvoice.CouponKey);
                discount = aInvoice.CouponDiscount;
                sb.Append(makeBold("Coupon Discount: ", bHTML));
                sb.Append(discount.ToString("$#,##0.00"));
                sb.Append(" (" + coupon.CouponCode + ")");
                aOrderTotal = aOrderTotal - discount;

                sb.Append(newLine(bHTML));
            }
            sb.Append(makeBold("Order total: ",bHTML));
            sb.Append(aOrderTotal.ToString("$#,##0.00"));
            sb.Append(newLine(bHTML));
            sb.Append(newLine(bHTML));

            if (!String.IsNullOrEmpty(aInvoice.ReferralCode))
            {
                sb.Append(makeBold("Referral Code: ", bHTML));
                sb.Append(aInvoice.ReferralCode);
                sb.Append(newLine(bHTML));
                sb.Append(newLine(bHTML));
            }
            if (aShippingAddress.IsTaxableState)
            {
                sb.Append("Georgia Sales Tax Will be Added at Invoicing");
                sb.Append(newLine(bHTML));
                sb.Append(newLine(bHTML));
            }
            /*
            if (aInvoice.ExpediteTypeObject != null)
            {
                aExpediteDescription = aInvoice.ExpediteTypeObject.Description;
                aExpediteAmount = aInvoice.ExpediteTypeObject.AdditionalCharge;
                sb.Append("Expedited processing: ");
                sb.Append(aExpediteAmount.ToString("$#,##0.00"));
                sb.Append(newLine(bHTML));
                sb.Append(newLine(bHTML));
            }
            */

            

            sb.Append(makeBold("Payment method:",bHTML));
            sb.Append(newLine(bHTML));
            if (aInvoice.BillCharges)
            {
                sb.Append("Charges will be billed");
            }
            if (!String.IsNullOrEmpty(aInvoice.DebitAccount))
            {
                sb.Append("Account ");
                sb.Append(protectAccount(aInvoice.DebitAccount));
                sb.Append(" will be debited");
                
            }
            if (aInvoice.CreditCardObject != null)
            {
                sb.Append("Paid by ");
                CreditCardType aCreditCardType = CreditCardTypeDataAccess.GetOne(aInvoice.CreditCardObject.CreditCardTypeKey);
                sb.Append(aCreditCardType.Description);
                sb.Append("  ");
                string aCardNumber = aInvoice.CreditCardObject.Number;
                sb.Append(protectAccount(aCardNumber));
            }
            sb.Append(newLine(bHTML));
            sb.Append(newLine(bHTML));
            return sb.ToString();
        }

        public static string GetExpediteSubTypeDescription(ExpediteSubType subType)
        {
            ExpediteType e = ExpediteTypeDataAccess.GetOne(subType.ExpediteTypeKey);
            string retVal = subType.Description.Replace("##",e.AdditionalCharge.ToString());
            if(subType.AdditionalCharge > 0)
            {
                retVal = retVal.Replace("@@", subType.AdditionalCharge.ToString());
            }
            return retVal;
        }

        public static string GetExpediteSubTypeDescriptionForConfirmation(ExpediteSubType subType)
        {
            if (subType == null)
            {
                return "Unknown";
            }
            ExpediteType e = ExpediteTypeDataAccess.GetOne(subType.ExpediteTypeKey);
            string retVal = subType.Description.Replace("$## + ", "");
            retVal = retVal.Replace("$## plus ", "");
            if (subType.AdditionalCharge > 0)
            {
                retVal = retVal.Replace("@@", subType.AdditionalCharge.ToString());
            }
            return retVal;
        }

        public static bool IsValidRoutingNumber(string number)
        {
            int n = 0;
            for (int i = 0; i < number.Length; i += 3)
            {
                n += Convert.ToInt32(number.Substring(i,1)) * 3;
                n += Convert.ToInt32(number.Substring(i + 1,1)) * 7;
                n += Convert.ToInt32(number.Substring(i + 2,1)) * 1;
            }
            return (n % 10 == 0);
        }

        public static bool IsValidDepositSlipRountingNumber(string number)
        {
            if (number.IndexOf("-") > -1)
            {
                if (number.Count(f => f == '-') == 1)
                {
                    return number.Replace("-", String.Empty).All(c => c >= '0' && c <= '9');
                }
                else
                {
                    return false;
                }
            }
            else
            {
                return IsValidRoutingNumber(number);
            }
        }

        private static string protectAccount(string sIn)
        {
            if (sIn.Length < 5)
            {
                return "";
            }
            return (sIn.Substring(sIn.Length - 4, 4)).PadLeft(10, '*');
        }

        private static string newLine(bool bHTML)
        {
            if (bHTML)
            {
                return "<br />";
            }
            else
            {
                return Environment.NewLine;
            }
        }

        private static string makeBold(string value, bool bBold)
        {
            if (bBold)
            {
                return "<b>" + value + "</b>";
            }
            return value;
        }

        public static ArrayList GetAccountNumbersFromInvoice(Invoice aInvoice)
        {
            ArrayList list = new ArrayList();
            if (aInvoice != null)
            {
                foreach (InvoiceItem item in aInvoice.InvoiceItems)
                {
                    Product aProduct = ProductDataAccess.GetOne(Convert.ToInt32(item.ProductKey));

                    ProductType aProductType = ProductTypeDataAccess.GetOne(Convert.ToInt32(aProduct.ProductTypeKey));
                    ProductCategory aProductCategory = ProductCategoryDataAccess.GetOne(Convert.ToInt32(aProductType.ProductCategoryKey));
                    if (aProductCategory.ProductCategoryKey == 1)
                    {

                        string aAccountNumber = item.DepositSlipObject.AccountNumber;
                        if (!list.Contains(aAccountNumber))
                        {
                            list.Add(aAccountNumber);
                        }
                    }
                    if (aProductCategory.ProductCategoryKey == 3)
                    {
                        string aAccountNumber = item.CheckDetailObject.BankAccountNumber;
                        if (!list.Contains(aAccountNumber))
                        {
                            list.Add(aAccountNumber);
                        }
                    }
                    if (aProductCategory.ProductCategoryKey == 5)
                    {
                        string aAccountNumber = item.DepositBookObject.AccountNumber;
                        if (!list.Contains(aAccountNumber))
                        {
                            list.Add(aAccountNumber);
                        }
                    }

                }
            }

            return list;
        }

        public static IEnumerable<T> GetAllControlsOfType<T>(Control parent) where T : Control
       {
          var result = new List<T>();
          foreach (Control control in parent.Controls)
          {
             if (control is T)
             {
                result.Add((T) control);
             }
             if (control.HasControls())
             {
                result.AddRange(GetAllControlsOfType<T>(control));
             }
          }
          return result;
       }


        
    }
}