using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using AdvLaser.AdvLaserObjects;
using AdvLaser.AdvLaserDataAccess;
using CheckProject.WebUtils;
using AdvantageLaserData.Data.BusObjects;

namespace CheckProject.OrderProcessing
{
    public partial class ShippingEntry : BasePage
    {
        public string aAddressLine1;
        public string aAddressLine2;
        public string aAddressCity;
        public string aAddressState;
        public string aAddressZipCode;

        string aBillingAddressLine1;
        string aBillingAddressLine2;
        string aBillingAddressCity;
        string aBillingAddressState;
        string aBillingAddressZipCode;
        Invoice aInvoice = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            // isdirty implementation
            txtCreditCardNumber.Attributes.Add("onchange", "setDirty();");
            txtSecurityCode.Attributes.Add("onchange", "setDirty();");
            txtShippingCity.Attributes.Add("onchange", "setDirty();");
            txtShippingLine1.Attributes.Add("onchange", "setDirty();");
            txtShippingLine2.Attributes.Add("onchange", "setDirty();");
            txtShippingZipCode.Attributes.Add("onchange", "setDirty();");
            ddlAccountToDebit.Attributes.Add("onchange", "setDirty();");
            ddlCreditCardType.Attributes.Add("onchange", "setDirty();");
            ddlExpirationMonth.Attributes.Add("onchange", "setDirty();");
            ddlExpirationYear.Attributes.Add("onchange", "setDirty();");
            //ddlShippingProgram.Attributes.Add("onchange", "setDirty();");
            ddlShippingState.Attributes.Add("onchange", "setDirty();");
            btnContinue.Attributes.Add("onclick", "clearDirty();");
            // end

            aInvoice = GetInvoiceFromSession(true);
            Customer aCustomer = aInvoice.CustomerObject;
            CreditCard aCreditCard = aInvoice.CreditCardObject;
            ExpediteSubType aExpediteSubType = aInvoice.ExpediteSubTypeObject;
            if (aCreditCard == null)
            {
                aCreditCard = new CreditCard();
            }

            if (aCustomer == null)
            {
                aCustomer = new Customer();
            }

            foreach (Address a in aCustomer.Addresses)
            {
                if (a.AddressTypeKey == 1)
                {
                    aAddressLine1 = a.Line1;
                    aAddressLine2 = a.Line2;
                    aAddressCity = a.City;
                    aAddressState = a.State;
                    aAddressZipCode = a.ZipCode;

                }

                if (a.AddressTypeKey == 2)
                {
                    aBillingAddressLine1 = a.Line1;
                    aBillingAddressLine2 = a.Line2;
                    aBillingAddressCity = a.City;
                    aBillingAddressState = a.State;
                    aBillingAddressZipCode = a.ZipCode;

                }
            }
            string aCardNumber = aCreditCard.Number;
            if (String.IsNullOrEmpty(aCardNumber))
            {
                aCardNumber = "";
            }
            int aExpirationMonth = aCreditCard.ExpirationMonth;
            int aExpirationYear = aCreditCard.ExpirationYear;
            int aCreditCardType = aCreditCard.CreditCardTypeKey;
            string aCCV = aCreditCard.CCV;

            string aAccountToDebit = aInvoice.DebitAccount;
            if (String.IsNullOrEmpty(aAccountToDebit))
            {
                aAccountToDebit = "";
            }
            bool blnBillMe = aInvoice.BillCharges;

            
            

            if (!IsPostBack)
            {
                txtReferralCode.Text = aInvoice.ReferralCode;
                if (aInvoice.CouponDiscount > 0)
                {
                    if (aInvoice.CouponKey > 0)
                    {
                        Coupon coupon = CouponDataAccess.GetOne(aInvoice.CouponKey);
                        txtCouponCode.Text = coupon.CouponCode.ToUpper();
                    }
                    lblCouponError.Text = "Coupon code has been applied. You saved " + aInvoice.CouponDiscount.ToString("$#,###.00");
                    lblCouponError.CssClass = "couponSuccess";
                }

                radCreditCard.Checked = (aCardNumber.Length > 0);
                radDebit.Checked = (aAccountToDebit.Length > 0);
                radBillMe.Checked = blnBillMe;
                if (!radBillMe.Checked && !radDebit.Checked)
                {
                    radCreditCard.Checked = true;
                }

                ArrayList accountNumberList = WebUtils.WebUtils.GetAccountNumbersFromInvoice(aInvoice);
                for (int i = 0; i < accountNumberList.Count; i++)
                {
                    string aAccountNumber = (string)accountNumberList[i];
                    ListItem item = new ListItem(aAccountNumber);
                    ddlAccountToDebit.Items.Add(item);
                }

                if (aAccountToDebit.Length > 0)
                {
                    foreach (ListItem i in ddlAccountToDebit.Items)
                    {
                        i.Selected = (aAccountToDebit == i.Text);
                    }
                }

                WebUtils.WebUtils.FillStateDropDown(ddlShippingState);
                ArrayList list = CreditCardTypeDataAccess.GetCreditCardTypeList();
                foreach (CreditCardType creditCardType in list)
                {
                    ddlCreditCardType.Items.Add(new ListItem(creditCardType.Description, creditCardType.CreditCardTypeKey.ToString()));
                }
                string aShippingTypeSQL = "select * from shippingtype where isactive = 1 order by displayorder";
                ArrayList shippingTypeList = ShippingTypeDataAccess.GetShippingTypeList(aShippingTypeSQL);

                ExpediteType expediteType = ExpediteTypeDataAccess.GetOne(1);

                foreach(ListItem item in radListShipping.Items)
                {
                    if (item.Value == "2")
                    {
                        item.Text = expediteType.Description.Replace("##", expediteType.AdditionalCharge.ToString());
                    }
                }

                string expediteSubTypeSQL = "select * from expeditesubtype where isactive = 1 order by displayorder";
                ArrayList expediteSubTypeList = ExpediteSubTypeDataAccess.GetExpediteSubTypeList(expediteSubTypeSQL);

                foreach (ExpediteSubType subType in expediteSubTypeList)
                {
                    string description = WebUtils.WebUtils.GetExpediteSubTypeDescription(subType);
                    ListItem item = new ListItem(description , subType.ExpediteSubTypeKey.ToString());
                    radExpediteSubType.Items.Add(item);
                }

                fillExpirationMonth();
                fillExpirationYear();

                txtShippingLine1.Text = aAddressLine1;
                txtShippingLine2.Text = aAddressLine2;
                txtShippingCity.Text = aAddressCity;
                txtShippingZipCode.Text = aAddressZipCode;
                txtCreditCardNumber.Text = aCardNumber;
                txtSecurityCode.Text = aCCV;

                foreach (ListItem i in ddlCreditCardType.Items)
                {
                    i.Selected = (Convert.ToInt32(i.Value) == aCreditCardType);
                }

                foreach (ListItem i in ddlExpirationMonth.Items)
                {
                    i.Selected = (Convert.ToInt32(i.Value) == aExpirationMonth);
                }

                foreach (ListItem i in ddlExpirationYear.Items)
                {
                    i.Selected = (Convert.ToInt32(i.Value) == aExpirationYear);
                }

                foreach (ListItem i in ddlShippingState.Items)
                {
                    i.Selected = (i.Value == aAddressState);
                }
                
                foreach (ListItem i in radListShipping.Items)
                {
                    i.Selected = (i.Value == aInvoice.ShippingTypeKey.ToString());
                }

                if (aInvoice.ExpediteTypeObject != null)
                {
                    radListShipping.SelectedIndex = 1;
                    foreach (ListItem i in radExpediteSubType.Items)
                    {
                        i.Selected = (i.Value == aInvoice.ExpediteSubTypeObject.ExpediteSubTypeKey.ToString());
                    }
                }
                else
                {
                    radListShipping.SelectedIndex = 0;
                }


                setExpediteSubTypeEnabled();
            }
            setPaymentMethodUI();
            
            lblGroundRate.Text = getGroundShipping();

        }

        private string getGroundShipping()
        {
            if (ddlShippingState.SelectedIndex == 0)
            {
                return "n/a";
            }
            else
            {
                return aInvoice.CalculateGroundShipping(ddlShippingState.SelectedValue).ToString("$#.00");
            }
        }

        public void btnApply_OnClick(object sender, EventArgs e)
        {
            string code = txtCouponCode.Text;
            Coupon aCoupon = CouponDataAccess.GetOneByCode(code);
            if (aCoupon == null)
            {
                lblCouponError.Text = "Coupon not found";
                lblCouponError.CssClass = "couponWarning";
                return;
            }

            CouponProductCategoryCollection productCategoryList = CouponProductCategoryCollectionDataAccess.GetProductCategories(aCoupon.CouponCategoryKey);
            decimal totalEligibleAmount = 0m;
            Invoice aInvoice = GetInvoiceFromSession(true);
            aInvoice.CouponDiscount = 0;
            aInvoice.CouponKey = Int32.MinValue;
            foreach (InvoiceItem item in aInvoice.InvoiceItems)
            {
                foreach (ProductCategory cat in productCategoryList)
                {
                    if (item.ProductObject.ProductTypeObject.ProductCategoryKey == cat.ProductCategoryKey)
                    {
                        if (item.ProductObject.ProductTypeObject.ProductCategoryKey == ProductCategory.CATEGORY_CHECK)
                        {
                            totalEligibleAmount += item.Price;
                        }
                    }
                    if (item.ProductObject.ProductTypeObject.ProductCategoryKey == ProductCategory.CATEGORY_DEPOSITSTAMP)
                    {
                        totalEligibleAmount += (item.Price * item.Quantity);
                    }
                    if (item.ProductObject.ProductTypeObject.ProductCategoryKey == cat.ProductCategoryKey)
                    {
                        if (item.ProductObject.ProductTypeObject.ProductCategoryKey == ProductCategory.CATEGORY_DEPOSITSLIP)
                        {
                            totalEligibleAmount += item.Price;
                        }
                    }
                    if (item.ProductObject.ProductTypeObject.ProductCategoryKey == cat.ProductCategoryKey)
                    {
                        if (item.ProductObject.ProductTypeObject.ProductCategoryKey == ProductCategory.CATEGORY_ENVELOPE)
                        {
                            totalEligibleAmount += item.Price;
                        }
                    }
                    if (item.ProductObject.ProductTypeObject.ProductCategoryKey == cat.ProductCategoryKey)
                    {
                        if (item.ProductObject.ProductTypeObject.ProductCategoryKey == ProductCategory.CATEGORY_DEPOSITBOOK)
                        {
                            totalEligibleAmount += item.Price;
                        }
                    }
                }
            }
            decimal minimumOrder = aCoupon.MinimumOrder;

            if (totalEligibleAmount < minimumOrder)
            {
                lblCouponError.Text = "Order does not meet the minimum requirment for this coupon code";
                lblCouponError.CssClass = "couponWarning";
                return;
            }
            if (aCoupon.StartDate > DateTime.Now)
            {
                lblCouponError.Text = "Coupon code is not currently available";
                lblCouponError.CssClass = "couponWarning";
                return;
            }
            if (aCoupon.EndDate < DateTime.Now)
            {
                lblCouponError.Text = "Coupon code has expired";
                lblCouponError.CssClass = "couponWarning";
                return;
            }

            if (aCoupon.CouponTypeKey == Coupon.COUPON_TYPE_DOLLARS)
            {
                hdnCouponDiscount.Value = aCoupon.DollarValue.ToString();
                hdnCouponKey.Value = aCoupon.CouponKey.ToString();
            }
            if (aCoupon.CouponTypeKey == Coupon.COUPON_TYPE_PERCENT)
            {
                hdnCouponDiscount.Value = Math.Round(aCoupon.PercentValue / 100 * totalEligibleAmount,2).ToString();
                hdnCouponKey.Value = aCoupon.CouponKey.ToString();
            }
            aInvoice.CouponKey = aCoupon.CouponKey;
            aInvoice.CouponDiscount = Convert.ToDecimal(hdnCouponDiscount.Value);
            lblCouponError.Text = "Coupon code has been applied. You saved " + Convert.ToDecimal(hdnCouponDiscount.Value).ToString("$#,###.00");
            lblCouponError.CssClass = "couponSuccess";
        }

        protected void chkCopy_Changed(object sender, EventArgs e)
        {
            if (chkCopy.Checked)
            {
                txtShippingLine1.Text = aBillingAddressLine1;
                txtShippingLine2.Text = aBillingAddressLine2;
                txtShippingCity.Text = aBillingAddressCity;
                txtShippingZipCode.Text = aBillingAddressZipCode;
                foreach (ListItem i in ddlShippingState.Items)
                {
                    i.Selected = (i.Value == aBillingAddressState);
                }
            }
            else
            {
                txtShippingLine1.Text = "";
                txtShippingLine2.Text = "";
                txtShippingCity.Text = "";
                txtShippingZipCode.Text = "";
                ddlShippingState.SelectedIndex = 0;
            }
            setPaymentMethodUI();
            lblGroundRate.Text = getGroundShipping();
        }

        protected void radPaymentMethod_OnChanged(object sender, EventArgs e)
        {
            setPaymentMethodUI();                
        }

        protected void radShippingTypeChanged(object sender, EventArgs e)
        {
            setExpediteSubTypeEnabled();
        }

        private void setExpediteSubTypeEnabled()
        {
            bool expedite = radListShipping.SelectedIndex > 0;
            radExpediteSubType.Enabled = expedite;
            if (expedite)
            {
                radExpediteSubType.Items[0].Selected = true;
            }
            else
            {
                foreach (ListItem i in radExpediteSubType.Items)
                {
                    i.Selected = false;
                }
            }
        }

        private void setPaymentMethodUI()
        {
            // validators for credit card
            // required field validators
            reqCreditCardType.Enabled = (radCreditCard.Checked);
            reqCreditCardNumber.Enabled = (radCreditCard.Checked);
            reqSecurityCode.Enabled = (radCreditCard.Checked);

            // required display constrols
            reqAdvSecurityCode.Required = radCreditCard.Checked.ToString();
            reqAdvCreditCardType.Required = radCreditCard.Checked.ToString();
            reqAdvCardExpiration.Required = radCreditCard.Checked.ToString();
            reqAdvCreditCardNumber.Required = radCreditCard.Checked.ToString();
            // regular exp validators
            regSecurityCode.Enabled = (radCreditCard.Checked);
            reqCreditCardNumber.Enabled = (radCreditCard.Checked);
            // custom validators
            cstExpirationMonth.Enabled = (radCreditCard.Checked);
            cstExpirationYear.Enabled = (radCreditCard.Checked);

            // validators for debit
            reqAdvDebitAccount.Required = radDebit.Checked.ToString();
            reqDebitAccount.Enabled = (radDebit.Checked);

            ddlExpirationYear.Enabled = radCreditCard.Checked;
            ddlExpirationMonth.Enabled = radCreditCard.Checked;
            ddlCreditCardType.Enabled = radCreditCard.Checked;
            txtCreditCardNumber.Enabled = radCreditCard.Checked;
            txtSecurityCode.Enabled = radCreditCard.Checked;
            if (!radCreditCard.Checked)
            {
                ddlCreditCardType.SelectedIndex = 0;
                ddlExpirationMonth.SelectedIndex = 0;
                ddlExpirationYear.SelectedIndex = 0;
                txtCreditCardNumber.Text = "";
                txtSecurityCode.Text = "";
            }

            ddlAccountToDebit.Enabled = radDebit.Checked;
            if (!radDebit.Checked)
            {
                ddlAccountToDebit.SelectedIndex = 0;
            }
            else
            {
                form1.DefaultFocus = "ddlAccountToDebit";
            }
        }

        protected void CheckExpiration(object sender, ServerValidateEventArgs e)
        {
            int aMonth = Convert.ToInt32(ddlExpirationMonth.SelectedValue);
            int aYear = Convert.ToInt32(ddlExpirationYear.SelectedValue);
            int currentYear = DateTime.Now.Year;
            int currentMonth = DateTime.Now.Month;
            bool expirationIsValid = false;
            
            if (aYear >= currentYear)
            {
                if (aYear > currentYear)
                {
                    expirationIsValid = true;
                }
                else
                {
                    expirationIsValid = aMonth >= currentMonth;
                }
            }
            cstExpirationMonth.IsValid = expirationIsValid;
            cstExpirationYear.IsValid = expirationIsValid;
        }

        protected void btnPrevious_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("AddressEntry.aspx");
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
                foreach (Address a in aCustomer.Addresses)
                {
                    if (a.AddressTypeKey == 1)
                    {
                        aCustomer.Addresses.Remove(a);
                        break;
                    }
                }
                Address aShippingAddress = new Address();
                aShippingAddress.AddressTypeKey = 1;
                aShippingAddress.Line1 = txtShippingLine1.Text;
                aShippingAddress.Line2 = txtShippingLine2.Text;
                aShippingAddress.City = txtShippingCity.Text;
                aShippingAddress.State = ddlShippingState.SelectedValue;
                aShippingAddress.ZipCode = txtShippingZipCode.Text;

                aCustomer.AddAddress(aShippingAddress);

                if (radCreditCard.Checked)
                {
                    CreditCard aCreditCard = new CreditCard();
                    aCreditCard.ExpirationMonth = Convert.ToInt32(ddlExpirationMonth.SelectedValue);
                    aCreditCard.ExpirationYear = Convert.ToInt32(ddlExpirationYear.SelectedValue);
                    aCreditCard.CreditCardTypeKey = Convert.ToInt32(ddlCreditCardType.SelectedValue);
                    aCreditCard.Number = txtCreditCardNumber.Text;
                    aCreditCard.CCV = txtSecurityCode.Text;
                    aInvoice.CreditCardObject = aCreditCard;
                }
                else
                {
                    aInvoice.CreditCardObject = null;
                }

                aInvoice.BillCharges = radBillMe.Checked;
                if (radDebit.Checked)
                {
                    aInvoice.DebitAccount = ddlAccountToDebit.SelectedValue;
                }
                else
                {
                    aInvoice.DebitAccount = null;
                }

                aInvoice.ExpediteSubTypeObject = null;
                aInvoice.ExpediteTypeObject = null;
                aInvoice.ExpediteTypeKey = Int32.MinValue;
                if (!String.IsNullOrEmpty(hdnCouponKey.Value)) {
                    aInvoice.CouponKey = Convert.ToInt32(hdnCouponKey.Value);
                }
                if (!String.IsNullOrEmpty(hdnCouponDiscount.Value))
                {
                    aInvoice.CouponDiscount = Convert.ToDecimal(hdnCouponDiscount.Value);
                }
                aInvoice.ReferralCode = txtReferralCode.Text;
                
                aInvoice.CustomerObject = aCustomer;

                if (radListShipping.SelectedValue == "1")
                {
                    aInvoice.ShippingTypeKey = Convert.ToInt32(radListShipping.SelectedValue);
                }
                else
                {
                    aInvoice.ShippingTypeKey = Int32.MinValue;
                    aInvoice.ShippingTypeObject = null;
                    foreach (ListItem b in radExpediteSubType.Items)
                    {
                        if (b.Selected)
                        {
                            int aExpediteSubTypeKey = Convert.ToInt32(((ListItem)b).Value);
                            ExpediteSubType aExpediteSubType = ExpediteSubTypeDataAccess.GetOne(aExpediteSubTypeKey);
                            aInvoice.ExpediteSubTypeObject = aExpediteSubType;
                            break;
                        }
                    }
                    aInvoice.ExpediteTypeKey = 1;
                    ExpediteType aExpediteType = ExpediteTypeDataAccess.GetOne(aInvoice.ExpediteTypeKey);
                    aInvoice.ExpediteTypeObject = aExpediteType;
                }

                
                Session["InvoiceObject"] = aInvoice;
                //int aInvoiceKey = aInvoice.Save();
                Response.Redirect("ConfirmOrder.aspx");
            }
        }

        private void fillExpirationMonth()
        {
            for (int i = 1; i < 13; i++)
            {
                string aMonth = i.ToString();
                if (aMonth.Length == 1)
                {
                    aMonth = "0" + aMonth;
                }
                ListItem item = new ListItem(aMonth, aMonth);
                ddlExpirationMonth.Items.Add(item);
            }
        }

        private void fillExpirationYear()
        {
            int aYear = DateTime.Now.Year;
            for (int i = aYear; i < (aYear + 15); i++)
            {
                string year = i.ToString();
                ListItem item = new ListItem(year, year);
                ddlExpirationYear.Items.Add(item);
            }
        }
    }
}
