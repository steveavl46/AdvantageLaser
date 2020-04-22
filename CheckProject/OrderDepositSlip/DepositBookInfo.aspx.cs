using AdvLaser.AdvLaserDataAccess;
using AdvLaser.AdvLaserObjects;
using CheckProject.WebUtils;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CheckProject.OrderDepositSlip
{
    public partial class DepositBookInfo : BasePage
    {
        int aProductTypeKey;
        int aProductKey;
        string aAccountNumber;
        string errorMessage;
        string salesPersonID;

        protected void Page_Load(object sender, EventArgs e)
        {
            // is dirty implementation
            ddlProductList.Attributes.Add("onchange", "setDirty();");
            txtLine1.Attributes.Add("onchange", "setDirty();");
            txtLine2.Attributes.Add("onchange", "setDirty();");
            txtLine3.Attributes.Add("onchange", "setDirty();");
            txtLine4.Attributes.Add("onchange", "setDirty();");
            txtLine5.Attributes.Add("onchange", "setDirty();");
            txtBankAccountNumber.Attributes.Add("onchange", "setDirty();");
            txtRoutingNumber.Attributes.Add("onchange", "setDirty();");
            txtBankFraction.Attributes.Add("onchange", "setDirty();");
            txtBankName.Attributes.Add("onchange", "setDirty();");
            txtBankCSZ.Attributes.Add("onchange", "setDirty();");
            txtBankPhone.Attributes.Add("onchange", "setDirty();");
            btnContinue.Attributes.Add("onclick", "clearDirty();");
            // end
            aProductTypeKey = Convert.ToInt32(Request.Params["ProductTypeKey"]);
            aProductKey = Convert.ToInt32(Request.Params["ProductKey"]);
            aAccountNumber = Request.Params["AccountNumber"];
            errorMessage = Request.Params["ErrorMessage"];
            salesPersonID = Request.Params["SalesPersonID"];
            if (String.IsNullOrEmpty(errorMessage))
            {
                errorMessage = "";
            }
            if (errorMessage != "")
            {
                lblErrorMessage.Text = errorMessage;
                lblErrorMessage.Visible = true;
            }

            Invoice aInvoice = GetInvoiceFromSession(true);
            if (!String.IsNullOrEmpty(salesPersonID))
            {
                aInvoice.SalesPersonID = salesPersonID;
            }
            if (!IsPostBack)
            {
                if (aProductKey > 0)
                {
                    Product aProduct = ProductDataAccess.GetOne(aProductKey);
                    aProductTypeKey = aProduct.ProductTypeKey;
                }
                ProductType aProductType = ProductTypeDataAccess.GetOne(aProductTypeKey);
                string aProductDescription = aProductType.Description;
                lblProductDescription.Text = aProductDescription;

                fillProductList(aProductTypeKey, aProductKey);
                if (aAccountNumber != null && aAccountNumber.Length > 0)
                {
                    setPageDefaults(aAccountNumber);
                }
            }
        }

        private void setPageDefaults(string accountNumber)
        {
            Invoice aInvoice = GetInvoiceFromSession(true);
            InvoiceItem aInvoiceItem = new InvoiceItem();
            foreach (InvoiceItem item in aInvoice.InvoiceItems)
            {
                if (item.DepositBookObject != null && item.DepositBookObject.AccountNumber == accountNumber)
                {
                    //aInvoiceItem = item;
                    DepositBook d = item.DepositBookObject;
                    txtLine1.Text = d.Line1;
                    txtLine2.Text = d.Line2;
                    txtLine3.Text = d.Line3;
                    txtLine4.Text = d.Line4;
                    txtLine5.Text = d.Line5;

                    txtBankName.Text = d.BankInfoLine1;
                    txtBankAccountNumber.Text = d.AccountNumber;
                    txtRoutingNumber.Text = d.RoutingNumber;
                    txtBankCSZ.Text = d.BankInfoLine2;
                    txtBankPhone.Text = d.BankInfoLine3;
                    txtBankFraction.Text = d.Fraction;
                    break;
                }
                if (item.CheckDetailObject != null && item.CheckDetailObject.BankAccountNumber == accountNumber)
                {
                    CheckDetail d = item.CheckDetailObject;
                    txtLine1.Text = d.Line1;
                    txtLine2.Text = d.Line2;
                    txtLine3.Text = d.Line3;
                    txtLine4.Text = d.Line4;
                    txtLine5.Text = d.Line5;

                    txtBankName.Text = d.BankInfoLine1;
                    txtBankAccountNumber.Text = d.BankAccountNumber;
                    txtRoutingNumber.Text = d.RoutingNumber;
                    txtBankCSZ.Text = d.BankInfoLine2;
                    txtBankPhone.Text = d.BankInfoLine3;
                    txtBankFraction.Text = d.Fraction;
                    break;
                }

            }
            //if (aInvoiceItem != null && aInvoiceItem.DepositBookObject != null)
            //{
            //    DepositBook d = aInvoiceItem.DepositBookObject;
            //    txtLine1.Text = d.Line1;
            //    txtLine2.Text = d.Line2;
            //    txtLine3.Text = d.Line3;
            //    txtLine4.Text = d.Line4;
            //    txtLine5.Text = d.Line5;

            //    txtBankName.Text = d.BankInfoLine1;
            //    txtBankAccountNumber.Text = d.AccountNumber;
            //    txtRoutingNumber.Text = d.RoutingNumber;
            //    txtBankCSZ.Text = d.BankInfoLine2;
            //    txtBankPhone.Text = d.BankInfoLine3;
            //    txtBankFraction.Text = d.Fraction;
            //}
        }

        private void fillProductList(int aProductTypeKey, int aProductKey)
        {
            string aProductSQL = "select productkey, producttypekey, description, price, shippingrate,quantity, colorsurcharge from product where producttypekey = " + aProductTypeKey.ToString();
            ArrayList productList = ProductDataAccess.GetProductList(aProductSQL);
            foreach (Product aProduct in productList)
            {
                ddlProductList.Items.Add(new ListItem(getItemDescription(aProduct), aProduct.ProductKey.ToString()));
            }
            foreach (ListItem i in ddlProductList.Items)
            {
                i.Selected = (i.Value == aProductKey.ToString());
            }
        }

        private string getItemDescription(Product aProduct)
        {

            return aProduct.Description + " - " + " $" + aProduct.Price.ToString("#0.00");
        }

        protected void btnCancel_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("../OrderStart/SelectProduct.aspx");
        }

        protected void btnContinue_OnClick(object sender, EventArgs e)
        {
            lblErrorMessage.Visible = !Page.IsValid;

            if (!WebUtils.WebUtils.IsValidDepositSlipRountingNumber(txtRoutingNumber.Text))
            {
                valRoutingNumber.IsValid = false;
                valRoutingNumber.Display = ValidatorDisplay.Static;
            }

            if (Page.IsValid)
            {
                bool addNewItem = false;
                Invoice aInvoice = GetInvoiceFromSession(true);
                InvoiceItem aInvoiceItem = aInvoice.GetInvoiceItem(aProductKey, aAccountNumber);
                if (aInvoiceItem == null)
                {
                    aInvoiceItem = new InvoiceItem();
                    addNewItem = true;
                }
                Product aProduct = ProductDataAccess.GetOne(Convert.ToInt32(ddlProductList.SelectedValue));
                aInvoiceItem.ProductKey = Convert.ToInt32(aProduct.ProductKey);
                aInvoiceItem.Description = aProduct.Description;
                aInvoiceItem.Quantity = aProduct.Quantity;
                aInvoiceItem.Price = aProduct.Price * aProduct.Quantity;
                aInvoiceItem.ShippingRate = aProduct.ShippingRate;

                DepositBook aDepositBook = new DepositBook();
                aDepositBook.Line1 = txtLine1.Text;
                aDepositBook.Line2 = txtLine2.Text;
                aDepositBook.Line3 = txtLine3.Text;
                aDepositBook.Line4 = txtLine4.Text;
                aDepositBook.Line5 = txtLine5.Text;

                aDepositBook.BankInfoLine1 = txtBankName.Text;
                aDepositBook.AccountNumber = txtBankAccountNumber.Text;
                aDepositBook.RoutingNumber = txtRoutingNumber.Text;
                aDepositBook.BankInfoLine2 = txtBankCSZ.Text;
                aDepositBook.BankInfoLine3 = txtBankPhone.Text;
                aDepositBook.Fraction = txtBankFraction.Text;

                aInvoiceItem.DepositBookObject = aDepositBook;
                if (addNewItem)
                {
                    try
                    {
                        aInvoice.AddInvoiceItem(aInvoiceItem);
                    }
                    catch (System.Exception ex)
                    {
                        LogError(ex.Message);
                        errorMessage = ex.Message;
                        throw new Exception(ex.Message);

                    }
                }
                else
                {
                    bool ok = aInvoice.IsDuplicateInvoiceItem(aInvoiceItem);
                    if (!ok)
                    {
                        Response.Redirect("DepositBookInfo.aspx?ProductKey=" + aProduct.ProductKey.ToString() + "&ErrorMessage=Duplicate Account Numbers are not allowed for the same product");
                    }
                }

                if (errorMessage != "")
                {
                    lblErrorMessage.Text = errorMessage;
                    lblErrorMessage.Visible = true;
                }
                else
                {
                    Session["InvoiceObject"] = aInvoice;

                    Response.Redirect("../PreviewBuilder/ConfirmPreview.aspx?ProductKey=" + aProduct.ProductKey.ToString() + "&AccountNumber=" + aDepositBook.AccountNumber);
                }
            }
        }
    }
}