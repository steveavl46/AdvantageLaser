using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AdvLaser.AdvLaserObjects;
using System.Collections;
using CheckProject.WebUtils;
using System.Configuration;

namespace CheckProject.OrderProcessing
{
    public partial class AddressEntry : BasePage
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            bool localTesting = ((string)ConfigurationSettings.AppSettings["localtesting"] == "yes");
            // is dirty implementation
            txtCompanyName.Attributes.Add("onchange", "setDirty();");
            txtBillingLine1.Attributes.Add("onchange", "setDirty();");
            txtBillingLine2.Attributes.Add("onchange", "setDirty();");
            txtBillingCity.Attributes.Add("onchange", "setDirty();");
            txtBillingZipCode.Attributes.Add("onchange", "setDirty();");
            ddlBillingState.Attributes.Add("onchange", "setDirty();");
            txtEMailAddress.Attributes.Add("onchange", "setDirty();");
            txtFirstName.Attributes.Add("onchange", "setDirty();");
            txtLastName.Attributes.Add("onchange", "setDirty();");
            txtPhoneNumber.Attributes.Add("onchange", "setDirty();");
            txtFaxNumber.Attributes.Add("onchange", "setDirty();");
            btnContinue.Attributes.Add("onclick", "clearDirty();");
            // end
            Invoice aInvoice = GetInvoiceFromSession(true);
            if (!IsPostBack)
            {
                Customer aCustomer = aInvoice.CustomerObject;
                if (aCustomer == null)
                {
                    aCustomer = new Customer();
                }
                Address aBillingAddress = new Address();

                foreach (Address a in aCustomer.Addresses)
                {
                    if (a.AddressTypeKey == 2)
                    {
                        aBillingAddress = a;
                    }
                }
                string aCompanyName = aCustomer.BusinessName;
                string aFirstName = aCustomer.FirstName;
                string aLastName = aCustomer.LastName;
                string aEMail = aCustomer.EMailAddress;
                string aPhoneNumber = aCustomer.DayPhone;
                string aFaxNumber = aCustomer.FaxNumber;
                string aBillingLine1 = aBillingAddress.Line1;
                string aBillingLine2 = aBillingAddress.Line2;
                string aBillingCity = aBillingAddress.City;
                string aBillingState = aBillingAddress.State;
                string aBillingZipCode = aBillingAddress.ZipCode;
                txtCompanyName.Text = aCompanyName;
                txtFirstName.Text = aFirstName;
                txtLastName.Text = aLastName;
                txtEMailAddress.Text = aEMail;
                txtConfirmEMailAddress.Text = aEMail;
                txtFaxNumber.Text = aFaxNumber;
                txtPhoneNumber.Text = aPhoneNumber;
                txtBillingLine1.Text = aBillingLine1;
                txtBillingLine2.Text = aBillingLine2;
                txtBillingCity.Text = aBillingCity;
                txtBillingZipCode.Text = aBillingZipCode;

                WebUtils.WebUtils.FillStateDropDown(ddlBillingState);
                foreach (ListItem i in ddlBillingState.Items)
                {
                    i.Selected = (i.Value == aBillingState);
                }
                if (localTesting)
                {
                    fillTestData();
                }
            }
        }

        private void fillTestData()
        {
            txtCompanyName.Text = "Test Company Name";
            txtFirstName.Text = "Steve";
            txtLastName.Text = "Houghton";
            txtEMailAddress.Text = "Steve@gmail.com";
            txtConfirmEMailAddress.Text = "Steve@gmail.com";
            txtFaxNumber.Text = "770-444-4444";
            txtPhoneNumber.Text = "770-555-5555";
            txtBillingLine1.Text = "3010 Highland Drive";
            txtBillingLine2.Text = "Box 5";
            txtBillingCity.Text = "Smyrna";
            txtBillingZipCode.Text = "30080";
            ddlBillingState.SelectedIndex = 5;
        }

        protected void btnPrevious_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("ViewOrder.aspx");
        }
        protected void btnContinue_OnClick(object sender, EventArgs e)
        {
            lblErrorMessage.Visible = !Page.IsValid;
            if (Page.IsValid)
            {
                Invoice aInvoice = GetInvoiceFromSession(true);
                Customer aCustomer = aInvoice.CustomerObject;
                if (aCustomer == null)
                {
                    aCustomer = new Customer();
                }
                aCustomer.BusinessName = txtCompanyName.Text;
                aCustomer.FirstName = txtFirstName.Text;
                aCustomer.LastName = txtLastName.Text;
                aCustomer.EMailAddress = txtEMailAddress.Text;
                aCustomer.DayPhone = txtPhoneNumber.Text;
                aCustomer.FaxNumber = txtFaxNumber.Text;

                bool blnAddAddress = true;

                foreach (Address a in aCustomer.Addresses)
                {
                    if (a.AddressTypeKey == 2)
                    {
                        aCustomer.Addresses.Remove(a);
                        break;                        
                    }
                }

                Address aBillingAddress = new Address();
                
                aBillingAddress.AddressTypeKey = 2;
                aBillingAddress.Line1 = txtBillingLine1.Text;
                aBillingAddress.Line2 = txtBillingLine2.Text;
                aBillingAddress.City = txtBillingCity.Text;
                aBillingAddress.State = ddlBillingState.SelectedValue;
                aBillingAddress.ZipCode = txtBillingZipCode.Text;

                if (blnAddAddress)
                {
                    aCustomer.AddAddress(aBillingAddress);
                }
                
                aInvoice.CustomerObject = aCustomer;

                Session["InvoiceObject"] = aInvoice;

                Response.Redirect("ShippingEntry.aspx");
            }
        }
    }
}
