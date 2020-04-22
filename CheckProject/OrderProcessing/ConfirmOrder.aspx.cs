using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AdvLaser.AdvLaserObjects;
using System.Configuration;
using System.Net.Mail;
using CheckProject.WebUtils;
using AdvLaser.AdvLaserDataAccess;
using System.Collections;
using System.Text;
using AdvantageLaserData.Data.BusObjects;

namespace CheckProject.OrderProcessing
{
    public partial class ConfirmOrder : BasePage
    {
        ArrayList invalidControls = new ArrayList();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            LogInfo("Loaded 'ConfirmOrder.aspx'");
            Invoice aInvoice = GetInvoiceFromSession(true);

            

            Customer aCustomer = aInvoice.CustomerObject;

            tblNoCustomer.Visible = false;
            if (aCustomer == null)
            {
                tblNoCustomer.Visible = true;
                btnPlaceOrder.Enabled = false;
                tdErrorMessage.Text = "Customer information is missing";
                return;
            }
            if (aInvoice.ShippingTypeKey == null && aInvoice.ExpediteTypeKey == null)
            {
                tblNoCustomer.Visible = true;
                btnPlaceOrder.Enabled = false;
                tdErrorMessage.Text = "Shipping information is missing";
            }

            displayInvoiceItems(aInvoice);

            string aCompanyName = "";
            string aFirstName = "";
            string aLastName = "";
            string aEMail = "";
            string aPhoneNumber = "";
            string aFaxNumber = "";

            Address aBillingAddress = new Address();
            Address aShippingAddress = new Address();

            if (aCustomer != null)
            {
                aCompanyName = aCustomer.BusinessName;
                aFirstName = aCustomer.FirstName;
                aLastName = aCustomer.LastName;
                aEMail = aCustomer.EMailAddress;
                aPhoneNumber = aCustomer.DayPhone;
                aFaxNumber = aCustomer.FaxNumber;

                foreach (Address a in aCustomer.Addresses)
                {
                    if (a.AddressTypeKey == 1)
                    {
                        aShippingAddress = a;
                    }
                    if (a.AddressTypeKey == 2)
                    {
                        aBillingAddress = a;
                    }
                }
            }
            

            

            if (aInvoice.CreditCardObject != null)
            {
                CreditCard aCreditCard = aInvoice.CreditCardObject;
                int aCreditCardTypeKey = aCreditCard.CreditCardTypeKey;
                CreditCardType aCreditCardType = CreditCardTypeDataAccess.GetOne(aCreditCardTypeKey);
                lblPayType1.Text = "Card Type:";
                lblCardType.Text = aCreditCardType.Description;
                lblPayType2.Text = "Number: *****";
                lblCardNumber.Text =  aCreditCard.Number.Substring(aCreditCard.Number.Length - 4);
                lblPayType3.Text = "Expiration: ";
                lblExpiration.Text =  aCreditCard.ExpirationMonth + "/" + aCreditCard.ExpirationYear;
            }
            else
            {
                lblPayType2.Visible = false;
                lblPayType3.Visible = false;
                lblCardNumber.Visible = false;
                lblExpiration.Visible = false;
            }
            if (aInvoice.BillCharges)
            {
                lblPayType1.Text = "Payemnt Terms:";
                lblCardType.Text = "Charges will be billed";
            }
            string aAccountToDebit = aInvoice.DebitAccount;
            if(String.IsNullOrEmpty(aAccountToDebit))
            {
                aAccountToDebit = "";
            }
            if (aAccountToDebit.Length > 0)
            {
                lblPayType1.Text = "Payment Terms:";
                lblCardType.Text = "Account " + aAccountToDebit + " will be debited";
            }

            lblCompanyName.Text = aCompanyName;
            lblCustomerName.Text = aFirstName + " " + aLastName;
            lblEMail.Text = aEMail;
            lblFax.Text = aFaxNumber;
            lblPhone.Text = aPhoneNumber;
            lblBillingLine1.Text = aBillingAddress.Line1;
            lblBillingLine2.Text = aBillingAddress.Line2;
            lblBillingCityStateZip.Text = aBillingAddress.City + ", " + aBillingAddress.State + " " + aBillingAddress.ZipCode;
            string aShippingProgram = "";
            if (aInvoice.ShippingTypeObject != null)
            {
                aShippingProgram = aInvoice.ShippingTypeObject.Description;
                decimal aExtraCharge = aInvoice.ShippingTypeObject.AdditionalCharge;
                if (aExtraCharge > 0)
                {
                    aShippingProgram += " " + aExtraCharge.ToString("$#.##");
                }
            }
            else
            {
                aShippingProgram = WebUtils.WebUtils.GetExpediteSubTypeDescriptionForConfirmation(aInvoice.ExpediteSubTypeObject);
            }
            lblShippingMethod.Text = aShippingProgram;
            string aExpedite = "None";
            if (aInvoice.ExpediteTypeObject != null)
            {
                string description = aInvoice.ExpediteTypeObject.Description;
                //aExpedite = description.Substring(0, description.IndexOf('('));
                aExpedite = aInvoice.ExpediteTypeObject.Description.Replace("##", aInvoice.ExpediteTypeObject.AdditionalCharge.ToString());
            }
            lblExpedite.Text = aExpedite;
            lblShippingLine1.Text = aShippingAddress.Line1;
            lblShippingLine2.Text = aShippingAddress.Line2;
            lblShippingCityStateZip.Text = aShippingAddress.City + ", " + aShippingAddress.State + " " + aShippingAddress.ZipCode;

            bool customerIsValid = isValidCustomerInfo();
            bool shippingIsValid = isShippingValid();
            bool invoiceItemsValid = validateInvoiceItems(aInvoice);
            bool isValid = (!customerIsValid || !shippingIsValid || !invoiceItemsValid);
            btnPlaceOrder.Enabled = !isValid;
            lblAddressError.Visible = !customerIsValid;
            lblShippingError.Visible = !shippingIsValid;
        }

        private bool isValidCustomerInfo()
        {
            ArrayList invalidAddressControls = new ArrayList();
            checkControl(lblBillingLine1,invalidAddressControls);
            checkControl(lblCustomerName, invalidAddressControls);
            checkControl(lblEMail, invalidAddressControls);
            checkControl(lblBillingCityStateZip, invalidAddressControls);
            return (invalidAddressControls.Count == 0);
        }

        private bool isShippingValid()
        {
            ArrayList invalidShippingControls = new ArrayList();
            checkControl(lblShippingLine1, invalidShippingControls);
            checkControl(lblShippingCityStateZip, invalidShippingControls);
            return (invalidShippingControls.Count == 0);
        }

        private void checkControl(Label aLabel, ArrayList list)
        {
            string temp = aLabel.Text;
            temp = temp.Trim();
            if (String.IsNullOrEmpty(temp) || temp == ",")
            {
                list.Add(aLabel);
            }
        }

        private bool validateInvoiceItems(Invoice aInvoice)
        {
            int aItemCount = aInvoice.InvoiceItems.Count;
            
            if (aItemCount == 0)
            {
                TableRow tr = new TableRow();
                TableCell td = new TableCell();

                td.Text = "At least one item is required.";
                td.BackColor = System.Drawing.Color.Yellow;
                td.ColumnSpan = 4;
                tr.Cells.Add(td);
                tblInvoiceItems.Rows.Add(tr);
                return false;
            }
            else
            {
                foreach (InvoiceItem item in aInvoice.InvoiceItems)
                {
                    if (item.CheckDetailObject != null && !item.CheckDetailObject.Approved)
                    {
                        TableRow tr = new TableRow();
                        TableCell td = new TableCell();

                        td.Text = "At least one item is not approved.";
                        td.BackColor = System.Drawing.Color.Yellow;
                        td.ColumnSpan = 4;
                        tr.Cells.Add(td);
                        tblInvoiceItems.Rows.Add(tr);
                        return false;
                    }
                }
                return true;
            }
        }

        private void setInValidControlDisplay(Label aLabel)
        {
            string temp = aLabel.Text;
            temp = temp.Trim();
            if (String.IsNullOrEmpty(temp) || temp == ",")
            {
                aLabel.BackColor = System.Drawing.Color.Yellow;
                aLabel.Text = "Required";
                invalidControls.Add(aLabel);
            }
            else
            {
                aLabel.BackColor = System.Drawing.Color.White;
            }
        }

        private void displayInvoiceItems(Invoice aInvoice)
        {
            TableRow tr;
            TableCell td;
            Label l;
            bool addTax = false;
            if (aInvoice != null)
            {
                Customer aCustomer = aInvoice.CustomerObject;
                if (aCustomer != null)
                {
                    Address aShippingAddress = new Address();
                    foreach (Address a in aCustomer.Addresses)
                    {
                        if (a.AddressTypeKey == 1)
                        {
                            aShippingAddress = a;
                        }
                    }
                    if (aShippingAddress.IsTaxableState)
                    {
                        addTax = true;
                    }
                }
                decimal aExpediteAmount = 0;
                foreach (InvoiceItem item in aInvoice.InvoiceItems)
                {
                    bool add = true;
                    bool addColorSurcharge = false;
                    tr = new TableRow();
                    tr.CssClass = "lineitem";
                    td = new TableCell();
                    Product aProduct = ProductDataAccess.GetOne(Convert.ToInt32(item.ProductKey));

                    ProductType aProductType = ProductTypeDataAccess.GetOne(Convert.ToInt32(aProduct.ProductTypeKey));
                    ProductCategory aProductCategory = ProductCategoryDataAccess.GetOne(Convert.ToInt32(aProductType.ProductCategoryKey));
                    string aAccountNumber = "";
                    if(item.DepositSlipObject != null)
                    {
                        aAccountNumber = item.DepositSlipObject.AccountNumber; //BaseDataAccess.Decrypt(item.DepositSlipObject.AcctNumber);
                    }
                    if (item.DepositStampObject != null)
                    {
                        aAccountNumber = item.DepositStampObject.AccountNumber;// BaseDataAccess.Decrypt(item.DepositStampObject.AcctNumber);
                    }
                    if (item.CheckDetailObject != null)
                    {
                        aAccountNumber = item.CheckDetailObject.BankAccountNumber;// BaseDataAccess.Decrypt(item.CheckDetailObject.AcctNumber);
                        //add = item.CheckDetailObject.Approved;
                        addColorSurcharge = item.CheckDetailObject.ColorLogo;
                    }
                    if (item.DepositBookObject != null)
                    {
                        aAccountNumber = BaseDataAccess.Decrypt(item.DepositBookObject.AcctNumber);
                    }
                    l = new Label();
                    string productDescription = aProductType.Description;
                    if (!String.IsNullOrEmpty(item.SoftwareName))
                    {
                        productDescription = "Voucher Checks for " + item.SoftwareName;
                    }
                    l.Text = productDescription;
                    td.Controls.Add(l);

                    if (item.CheckDetailObject != null && !item.CheckDetailObject.Approved)
                    {
                        Image img = new Image();
                        img.ImageUrl = "../images/unapproved.png";
                        img.ToolTip = "Unapproved";
                        img.Height = Unit.Pixel(15);
                        img.Width = Unit.Pixel(15);
                        img.Style.Add(HtmlTextWriterStyle.PaddingLeft, "5px");
                        td.Controls.Add(img);
                    }

                    tr.Cells.Add(td);
                    td = new TableCell();
                    td.Text = aAccountNumber;
                    tr.Cells.Add(td);
                    td = new TableCell();
                    td.Text = getEnvelopeDisplayDescription(item);
                    tr.Cells.Add(td);
                    td = new TableCell();
                    td.Text = item.Price.ToString("$#,##0.00");
                    td.HorizontalAlign = HorizontalAlign.Right;
                    tr.Cells.Add(td);
                    if(add)
                    {
                        tblInvoiceItems.Rows.Add(tr);
                    }
                    if (addColorSurcharge)
                    {
                        tr = new TableRow();
                        tr.CssClass = "lineitem";
                        td = new TableCell();
                        td.ColumnSpan = 2;
                        td.Text = "&nbsp;";
                        tr.Cells.Add(td);
                        td = new TableCell();
                        td.Text = "Color Logo Surcharge";
                        td.HorizontalAlign = HorizontalAlign.Left;
                        tr.Cells.Add(td);
                        decimal colorSurcharge = item.ShippingQuantity * item.ProductObject.ColorSurcharge;
                        td = new TableCell();
                        td.Text = colorSurcharge.ToString("$#,##0.00");
                        td.HorizontalAlign = HorizontalAlign.Right;
                        tr.Cells.Add(td);

                        tblInvoiceItems.Rows.Add(tr);
                    }
                }
                tr = new TableRow();
                tr.CssClass = "lineitem";
                td = new TableCell();
                td.ColumnSpan = 2;
                td.Text = "&nbsp;";
                tr.Cells.Add(td);
                td = new TableCell();
                td.Text = "Subtotal";
                td.HorizontalAlign = HorizontalAlign.Left;
                tr.Cells.Add(td);
                td = new TableCell();
                decimal orderTotal = aInvoice.OrderTotal();
                td.Text = orderTotal.ToString("$#,##0.00");
                td.HorizontalAlign = HorizontalAlign.Right;
                tr.Cells.Add(td);
                tblInvoiceItems.Rows.Add(tr);
                tr = new TableRow();
                tr.CssClass = "lineitem";
                td = new TableCell();
                
                td.ColumnSpan = 2;
                td.Text = "&nbsp;";
                tr.Cells.Add(td);
                td = new TableCell();
                td.Text = "Shipping";
                td.HorizontalAlign = HorizontalAlign.Left;
                tr.Cells.Add(td);
                td = new TableCell();
                decimal shippingTotal = 0;
                if (aInvoice.ShippingTypeObject != null && aInvoice.ShippingTypeObject.BillAtActualCharges)
                {
                    td.Text = "Actual Charges";
                }
                else
                {
                    shippingTotal = aInvoice.CalculateShipping();
                    td.Text = shippingTotal.ToString("$#,##0.00");
                    td.HorizontalAlign = HorizontalAlign.Right;
                }
                tr.Cells.Add(td);
                tblInvoiceItems.Rows.Add(tr);
                if (aInvoice.ExpediteTypeObject != null)
                {
                    tr = new TableRow();
                    tr.CssClass = "lineitem";
                    td = new TableCell();
                    td.ColumnSpan = 2;
                    td.Text = "&nbsp;";
                    tr.Cells.Add(td);
                    td = new TableCell();
                    td.Text = "Expedite";
                    td.HorizontalAlign = HorizontalAlign.Left;
                    tr.Cells.Add(td);
                    td = new TableCell();
                    aExpediteAmount = aInvoice.ExpediteTypeObject.AdditionalCharge;
                    td.Text = aExpediteAmount.ToString("$#,##0.00");
                    td.HorizontalAlign = HorizontalAlign.Right;
                    tr.Cells.Add(td);
                    tblInvoiceItems.Rows.Add(tr);
                }
                if (aInvoice.CouponDiscount != null && aInvoice.CouponDiscount > 0)
                {
                    tr = new TableRow();
                    tr.CssClass = "lineitem";
                    td = new TableCell();
                    td.ColumnSpan = 2;
                    td.Text = "&nbsp;";
                    tr.Cells.Add(td);
                    td = new TableCell();
                    td.Text = "Coupon Discount";
                    td.HorizontalAlign = HorizontalAlign.Left;
                    tr.Cells.Add(td);
                    td = new TableCell();
                    decimal discount = aInvoice.CouponDiscount * -1;
                    td.Text = discount.ToString("$#,##0.00");
                    td.HorizontalAlign = HorizontalAlign.Right;
                    tr.Cells.Add(td);
                    tblInvoiceItems.Rows.Add(tr);
                }
                tr = new TableRow();
                tr.CssClass = "lineitem";
                td = new TableCell();
                td.ColumnSpan = 2;
                td.Text = "&nbsp;";
                tr.Cells.Add(td);
                td = new TableCell();
                td.Text = "Total";
                td.HorizontalAlign = HorizontalAlign.Left;
                tr.Cells.Add(td);
                td = new TableCell();
                decimal couponValue = 0;
                if (aInvoice.CouponDiscount != null && aInvoice.CouponDiscount > 0)
                {
                    couponValue = aInvoice.CouponDiscount;
                }
                decimal invoiceTotal = orderTotal + shippingTotal + aExpediteAmount - couponValue;
                td.Text = invoiceTotal.ToString("$#,##0.00");
                td.HorizontalAlign = HorizontalAlign.Right;
                tr.Cells.Add(td);
                tblInvoiceItems.Rows.Add(tr);
                if (addTax)
                {
                    tr = new TableRow();
                    tr.CssClass = "lineitem";
                    td = new TableCell();
                    td.Text = "&nbsp;";
                    td.ColumnSpan = 2;
                    tr.Cells.Add(td);
                    td = new TableCell();
                    td.ColumnSpan = 2;
                    td.Text = "Georgia Sales tax will be added at invoicing";
                    tr.Cells.Add(td);

                    tblInvoiceItems.Rows.Add(tr);
                }
                

            }
        }

        private string getEnvelopeDisplayDescription(InvoiceItem item)
        {
            if (item.ProductObject.ProductTypeObject.ProductCategoryKey == 4 && item.Quantity > 1)
            {
                return item.Quantity.ToString() + item.Description.Substring(2);
            }
            else
            {
                return item.Description;
            }
        }

        private void createConfirmationEMail(int aInvoiceKey)
        {
            bool testing = ((string)ConfigurationSettings.AppSettings["testing"] == "yes");
            bool localTesting = ((string)ConfigurationSettings.AppSettings["localtesting"] == "yes");

            string sSalesEmail = (string)ConfigurationSettings.AppSettings["salesEmail"];
            string sToEmail = (string)ConfigurationSettings.AppSettings["salesEmail"];
            string sBCCEmail = "";
            if (testing)
            {
                sToEmail = (string)ConfigurationSettings.AppSettings["adminEmail"];
                sBCCEmail = (string)ConfigurationSettings.AppSettings["adminEmail"];
            }
            else
            {
                sSalesEmail = (string)ConfigurationSettings.AppSettings["salesEmail"];
                sBCCEmail = (string)ConfigurationSettings.AppSettings["bccEmail"];      
            }
            System.Net.Mail.MailMessage msg = new System.Net.Mail.MailMessage();
            msg.From = new MailAddress(sSalesEmail);
            msg.To.Add(sToEmail);
            msg.Bcc.Add(sBCCEmail);
            msg.IsBodyHtml = true;
            string sSubject;
            if (testing)
            {
                sSubject = "Test web order";
            }
            else
            {
                sSubject = "Check order " + aInvoiceKey.ToString();
            }
            Invoice aInvoice = GetInvoiceFromSession();
            aInvoice.InvoiceKey = aInvoiceKey;

            string aCustomerEMail = aInvoice.CustomerObject.EMailAddress;
            StringBuilder body = new StringBuilder();

            string sCustomerBody = WebUtils.WebUtils.GetInvoiceForDisplay(aInvoice, true);
            string sAdminBody = WebUtils.WebUtils.GetInvoiceForDisplay(aInvoice, true, true);

            msg.Subject = sSubject;
            body.Append(sAdminBody);
            msg.Body = body.ToString();

            SmtpClient client = new SmtpClient();
            if (localTesting)
            {
                LogInfo("Begin Admin Email");
                LogInfo(sAdminBody);
                LogInfo("End Admin Email");
            }
            else
            {
                client.Send(msg);
            }

            // create customer confirmation email
            StringBuilder sb = new StringBuilder();
            sb.Append("<b>Thanks for Ordering with Advantage Laser Products!</b>");
            sb.Append("<br/>");
            sb.Append("We Appreciate Your Business");
            sb.Append("<br/>");
            sb.Append("<br/>");
            sb.Append("Please allow 24 hours to process your order!");
            sb.Append("<br/>");
            sb.Append("If you have any questions or to check the status of your order call 1-800-722-2804");
            sb.Append("<br/>");
            sb.Append("<br/>");
            sb.Append(sCustomerBody);

            if (testing)
            {
                sSubject = "Test web order";
            }
            else
            {
                sSubject = "Advantage Laser Products Web Order Confirmation";
            }
            System.Net.Mail.MailMessage aCustomerMsg = new System.Net.Mail.MailMessage();
            aCustomerMsg.From = new MailAddress(sSalesEmail);
            aCustomerMsg.To.Add(aCustomerEMail);
            aCustomerMsg.Subject = sSubject;
            aCustomerMsg.Body = sb.ToString();
            aCustomerMsg.IsBodyHtml = true;

            if (localTesting)
            {
                LogInfo("Begin Customer Confirmation Email");
                LogInfo(aCustomerMsg.Body);
                LogInfo("Begin Customer Confirmation Email");
            }
            else
            {
                client.Send(aCustomerMsg);
            }

        }

        public void btnShippingEntry_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("ShippingEntry.aspx");
        }

        public void btnAddressEntry_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("AddressEntry.aspx");
        }

        public void btnEditCart_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("ViewOrder.aspx");
        }

        public void btnPlaceOrder_OnClick(object sender, EventArgs e)
        {
            Invoice aInvoice;
            int aNewInvoiceKey = 0;
            bool localTesting = ((string)ConfigurationSettings.AppSettings["localtesting"] == "yes");
            try
            {
                aInvoice = GetInvoiceFromSession();
                aNewInvoiceKey = aInvoice.Save();
                aInvoice.InvoiceKey = aNewInvoiceKey;
                Session["InvoiceObject"] = aInvoice;
                LogInfo("Order placed with InvoiceKey: " + aNewInvoiceKey.ToString());
            }
            catch (System.Exception ex)
            {
                string errMsg = "Error occurred while saving invoice with key " + aNewInvoiceKey.ToString();
                if (!localTesting)
                {
                    LogError(errMsg, ex);
                    throw (ex);
                }
            }
            try
            {
                createConfirmationEMail(aNewInvoiceKey);
            }
            catch (System.Exception ex)
            {
                string errMsg = "Error occurred while sending confirmation email";
                if (!localTesting)
                {
                    LogError(errMsg, ex);
                }
            }
            finally
            {
                Session["InvoiceObject"] = "";
                Response.Redirect("ThankYou.aspx?InvoiceKey="+aNewInvoiceKey.ToString());
            }
        }
    }
}
