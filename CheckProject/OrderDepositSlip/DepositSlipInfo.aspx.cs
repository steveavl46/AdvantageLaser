using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using AdvLaser.AdvLaserObjects;
using CheckProject.WebUtils;
using AdvLaser.AdvLaserDataAccess;

namespace CheckProject.OrderDepositSlip
{
    public partial class QBDepositSlipInfo : BasePage
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
                int aItemCount = aInvoice.InvoiceItems.Count;

                if (aItemCount > 0)
                {
                    InvoiceItem aInvoiceItem = aInvoice.GetInvoiceItem(aProductKey, aAccountNumber);
                    if (aInvoiceItem != null)
                    {
                        DepositSlip aDepositSlip = aInvoiceItem.DepositSlipObject;

                        string strLine1 = aDepositSlip.Line1;
                        string strLine2 = aDepositSlip.Line2;
                        string strLine3 = aDepositSlip.Line3;
                        string strLine4 = aDepositSlip.Line4;
                        string strLine5 = aDepositSlip.Line5;
                        txtLine1.Text = strLine1;
                        txtLine2.Text = strLine2;
                        txtLine3.Text = strLine3;
                        txtLine4.Text = strLine4;
                        txtLine5.Text = strLine5;

                        string strBankName = aDepositSlip.BankInfoLine1;
                        string strAccountNumber = aDepositSlip.AccountNumber;
                        string strRoutingNumber = aDepositSlip.RoutingNumber;
                        string strBankCSZ = aDepositSlip.BankInfoLine2;
                        string strBankPhone = aDepositSlip.BankInfoLine3;
                        string strBankFraction = aDepositSlip.Fraction;
                        txtBankName.Text = strBankName;
                        txtBankAccountNumber.Text = strAccountNumber;
                        txtRoutingNumber.Text = strRoutingNumber;
                        txtBankCSZ.Text = strBankCSZ;
                        txtBankPhone.Text = strBankPhone;
                        txtBankFraction.Text = strBankFraction;
                    }
                }
            }            
        }

        private string getViewOrderText(int aItemCount)
        {
            if (aItemCount == 1)
            {
                return "View Order (1 item)";
            }
            else
            {
                return "View Order (" + aItemCount.ToString() + " items)";
            }
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

            return aProduct.Quantity.ToString() + " - " + (aProduct.Quantity * aProduct.Price).ToString("$#0.00") + " (" + aProduct.Price.ToString("#0.00") + "/each)";
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

                DepositSlip aDepositSlip = new DepositSlip();
                aDepositSlip.Line1 = txtLine1.Text;
                aDepositSlip.Line2 = txtLine2.Text;
                aDepositSlip.Line3 = txtLine3.Text;
                aDepositSlip.Line4 = txtLine4.Text;
                aDepositSlip.Line5 = txtLine5.Text;

                aDepositSlip.BankInfoLine1 = txtBankName.Text;
                aDepositSlip.AccountNumber = txtBankAccountNumber.Text;
                aDepositSlip.RoutingNumber = txtRoutingNumber.Text;
                aDepositSlip.BankInfoLine2 = txtBankCSZ.Text;
                aDepositSlip.BankInfoLine3 = txtBankPhone.Text;
                aDepositSlip.Fraction = txtBankFraction.Text;

                aInvoiceItem.DepositSlipObject = aDepositSlip;
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
                        Response.Redirect("DepositSlipInfo.aspx?ProductKey=" + aProduct.ProductKey.ToString() + "&ErrorMessage=Duplicate Account Numbers are not allowed for the same product");
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

                    Response.Redirect("../PreviewBuilder/ConfirmPreview.aspx?ProductKey=" + aProduct.ProductKey.ToString() + "&AccountNumber=" + aDepositSlip.AccountNumber);
                }
            }
        }
    }
}
