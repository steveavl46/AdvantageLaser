using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using AdvLaser.AdvLaserDataAccess;
using AdvLaser.AdvLaserObjects;
using CheckProject.WebUtils;
using System.Configuration;

namespace CheckProject.OrderCheck
{
    public partial class CheckInfo : BasePage
    {
        int aProductTypeKey;
        int aProductKey;
        string aAccountNumber;
        string errorMessage;
        string salesPersonID;
        string softwareName;
        Invoice aInvoice;
        InvoiceItem aInvoiceItem;
        CheckDetail aCheckDetail;
        const int ALLOWCHECKORDERSELECTION = 7;
        const int ADP_MANUAL_PAYROLL = 6;

        protected void Page_Load(object sender, EventArgs e)
        {
            int checkOrderKey = 0;
            bool localTesting = ((string)ConfigurationSettings.AppSettings["localtesting"] == "yes");
            bool allowCheckOrderSelection = false;
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
            txtBankInfoLine1.Attributes.Add("onchange", "setDirty();");
            txtBankInfoLine2.Attributes.Add("onchange", "setDirty();");
            txtBankInfoLine3.Attributes.Add("onchange", "setDirty();");
            btnContinue.Attributes.Add("onclick", "clearDirty();");
            // end
            aProductTypeKey = Convert.ToInt32(Request.Params["ProductTypeKey"]);
            aProductKey = Convert.ToInt32(Request.Params["ProductKey"]);
            aAccountNumber = Request.Params["AccountNumber"];
            errorMessage = Request.Params["ErrorMessage"];
            salesPersonID = Request.Params["SalesPersonID"];
            softwareName = Request.Params["Software"];

            hldrLineInfo.Visible = (aProductTypeKey != ADP_MANUAL_PAYROLL);
            if (String.IsNullOrEmpty(softwareName))
            {
                softwareName = "";
            }

            if (String.IsNullOrEmpty(errorMessage))
            {
                errorMessage = "";
            }

            if (errorMessage != "")
            {
                lblErrorMessage.Text = errorMessage;
                lblErrorMessage.Visible = true;
            }
            //txtProductKey.Value = aProductKey.ToString();
            

            aInvoice = GetInvoiceFromSession(true);
            if (!String.IsNullOrEmpty(salesPersonID))
            {
                aInvoice.SalesPersonID = salesPersonID;
            }
            aInvoiceItem = aInvoice.GetInvoiceItem(aProductKey, aAccountNumber);
            if (aInvoiceItem != null && !String.IsNullOrEmpty(aInvoiceItem.SoftwareName))
            {
                softwareName = aInvoiceItem.SoftwareName;
            }
            if (aProductKey > 0)
            {
                Product aProduct = ProductDataAccess.GetOne(aProductKey);
                aProductTypeKey = aProduct.ProductTypeKey;
            }
            if (!IsPostBack)
            {
                if (localTesting)
                {
                    fillTestingData();
                }
                if (aProductKey > 0)
                {
                    Product aProduct = ProductDataAccess.GetOne(aProductKey);
                    aProductTypeKey = aProduct.ProductTypeKey;                    
                }

                

                ProductType aProductType = ProductTypeDataAccess.GetOne(aProductTypeKey);
                //string aProductCategoryDescription = aProductType.ProductCategoryObject.Description;
                allowCheckOrderSelection = (aProductTypeKey != 8);
                ddlCheckOrder.Enabled = allowCheckOrderSelection;
                string aProductDescription = aProductType.Description;
                if (!String.IsNullOrEmpty(softwareName))
                {
                    aProductDescription = "Voucher Checks for " + softwareName;
                }
                lblProductDescription.Text = aProductDescription;

                

                fillProductList(aProductTypeKey, aProductKey);
                int aItemCount = aInvoice.InvoiceItems.Count;

                if (aItemCount > 0)
                {


                    //DepositSlip aDepositSlip = (DepositSlip)Session["DepositSlipObject"];

                    aInvoiceItem = aInvoice.GetInvoiceItem(aProductKey, aAccountNumber);
                    if (aInvoiceItem != null)
                    {
                        CheckDetail aCheckDetail = aInvoiceItem.CheckDetailObject;

                        string strLine1 = aCheckDetail.Line1;
                        string strLine2 = aCheckDetail.Line2;
                        string strLine3 = aCheckDetail.Line3;
                        string strLine4 = aCheckDetail.Line4;
                        string strLine5 = aCheckDetail.Line5;
                        txtLine1.Text = strLine1;
                        txtLine2.Text = strLine2;
                        txtLine3.Text = strLine3;
                        txtLine4.Text = strLine4;
                        txtLine5.Text = strLine5;

                        string strBankInfoLine1 = aCheckDetail.BankInfoLine1;
                        string strBankInfoLine2 = aCheckDetail.BankInfoLine2;
                        string strBankInfoLine3 = aCheckDetail.BankInfoLine3;
                        string strRoutingNumber = aCheckDetail.RoutingNumber;
                        string strBankFraction = aCheckDetail.Fraction;
                        string strStartingNumber = aCheckDetail.StartingNumber;
                        string strBankAccountNumber = aCheckDetail.BankAccountNumber;
                        txtBankInfoLine1.Text = strBankInfoLine1;
                        txtBankInfoLine2.Text = strBankInfoLine2;
                        txtBankInfoLine3.Text = strBankInfoLine3;
                        txtRoutingNumber.Text = strRoutingNumber;
                        txtBankFraction.Text = strBankFraction;
                        txtStartingNumber.Text = strStartingNumber;
                        txtBankAccountNumber.Text = strBankAccountNumber;
                        checkOrderKey = aCheckDetail.CheckOrderKey;
                    }
                }
                else
                {
                    /*
                    Invoice aInvoice = new Invoice();
                    InvoiceItem aInvoiceItem = new InvoiceItem();
                    DepositSlip aDepositSlip = new DepositSlip();
                    aInvoiceItem.DepositSlipObject = aDepositSlip;
                    aInvoice.InvoiceItems.Add(aInvoiceItem);
                    Session["InvoiceObject"] = aInvoice;
                    */
                }
                fillCheckOrderList(checkOrderKey);
                
            }
            hldrLineInfo.Visible = (aProductTypeKey != ADP_MANUAL_PAYROLL);
        }

        private void fillTestingData()
        {
            txtLine1.Text = "Marvin Masson";
            txtLine2.Text = "61 Indian Trail";
            txtLine3.Text = "Asheville NC 28803";
            txtLine4.Text = "828-299-4139";
            txtLine5.Text = "";
            txtBankInfoLine1.Text = "BB&T";
            txtBankAccountNumber.Text = "1000837737"; 
            txtRoutingNumber.Text = "0531401112";
            txtBankFraction.Text = "63/838887342";
            txtBankInfoLine2.Text = "Asheville NC";
            txtStartingNumber.Text = "10000";
        }

        public void Set_To_Unapproved(object sender, EventArgs e)
        {
            if (aInvoiceItem != null)
            {
                if (aInvoiceItem.CheckDetailObject != null)
                {
                    aCheckDetail = aInvoiceItem.CheckDetailObject;
                    aCheckDetail.Approved = false;
                }
            }
        }

        protected void btnContinue_OnClick(object sender, EventArgs e)
        {
            bool hasStubOptions = false;
            bool hasPrintLinesOption = false;
            bool hasPrintPaymentRecordOnStubOption = false;
            bool hasShowCheckNoOption = false;
            const int HASPRINTLINESOPTION = 1;
            const int HASSTUBOPTIONS = 2;
            const int HASPRINTPAYMENTRECORDONSTUBOPTION = 3;
            const int SHOWCHECKNO = 5;
            lblErrorMessage.Visible = !Page.IsValid;

            if(! WebUtils.WebUtils.IsValidRoutingNumber(txtRoutingNumber.Text))
            {
                valRoutingNumber.IsValid = false;
                valRoutingNumber.Display = ValidatorDisplay.Static;
            }

            if (Page.IsValid)
            {
                bool addNewItem = false;
                //Invoice aInvoice = GetInvoiceFromSession(true);
                //InvoiceItem aInvoiceItem = aInvoice.GetInvoiceItem(aProductKey, aAccountNumber);
                if (aInvoiceItem == null)
                {
                    aInvoiceItem = new InvoiceItem();
                    addNewItem = true;
                    aInvoiceItem.SoftwareName = softwareName;
                }
                Product aProduct = ProductDataAccess.GetOne(Convert.ToInt32(ddlProductList.SelectedValue));
                aInvoiceItem.ProductKey = Convert.ToInt32(aProduct.ProductKey);
                aInvoiceItem.Description = aProduct.Description;
                aInvoiceItem.Quantity = aProduct.Quantity;
                aInvoiceItem.SoftwareName = softwareName;
                aInvoiceItem.Price = aProduct.Price * aProduct.Quantity;
                aInvoiceItem.ShippingRate = aProduct.ShippingRate;

                ArrayList featureList = aProduct.CheckFeatureOptionList;
                foreach (CheckFeatureOption feature in featureList)
                {
                    switch (feature.CheckFeatureOptionKey)
                    {
                        case HASPRINTLINESOPTION:
                            hasPrintLinesOption = true;
                            break;
                        case HASSTUBOPTIONS:
                            hasStubOptions = true;
                            break;
                        case HASPRINTPAYMENTRECORDONSTUBOPTION:
                            hasPrintPaymentRecordOnStubOption = true;
                            break;
                        case SHOWCHECKNO:
                            hasShowCheckNoOption = true;
                            break;
                    }
                }
                
                if(aInvoiceItem.CheckDetailObject == null)
                {
                    aCheckDetail = new CheckDetail();
                    aCheckDetail.PrintLines = true;
                    aCheckDetail.Line1FontWeightKey = 2;
                    aCheckDetail.ColorLogo = false;
                    if (hasShowCheckNoOption)
                    {
                        aCheckDetail.ShowCheckNo = false;
                    }
                }
                else
                {
                    aCheckDetail = aInvoiceItem.CheckDetailObject;
                }
                
                aCheckDetail.Line1 = txtLine1.Text;
                aCheckDetail.Line2 = txtLine2.Text;
                aCheckDetail.Line3 = txtLine3.Text;
                aCheckDetail.Line4 = txtLine4.Text;
                aCheckDetail.Line5 = txtLine5.Text;
                aCheckDetail.BankInfoLine1 = txtBankInfoLine1.Text;
                aCheckDetail.BankInfoLine2 = txtBankInfoLine2.Text;
                aCheckDetail.BankInfoLine3 = txtBankInfoLine3.Text;
                aCheckDetail.BankAccountNumber = txtBankAccountNumber.Text;
                aCheckDetail.RoutingNumber = txtRoutingNumber.Text;
                aCheckDetail.Fraction = txtBankFraction.Text;
                aCheckDetail.StartingNumber = txtStartingNumber.Text;
                if (ddlCheckOrder.Enabled)
                {
                    aCheckDetail.CheckOrderKey = Convert.ToInt32(ddlCheckOrder.SelectedValue);
                }
                else
                {
                    aCheckDetail.CheckOrderKey = 2; // Standard: face up, lowest # on top
                }

                if (aCheckDetail.ColorLogo)
                {
                    //aInvoiceItem.Price = (aProduct.Price + aProduct.ColorSurcharge) * aProduct.Quantity;
                    aInvoiceItem.Price = aProduct.Price * aProduct.Quantity;
                }

                aInvoiceItem.CheckDetailObject = aCheckDetail;
                if (addNewItem)
                {
                    try
                    {
                        aInvoice.AddInvoiceItem(aInvoiceItem);
                    }
                    catch (System.Exception ex)
                    {
                        //Response.Redirect("DepositSlipInfo.aspx?ProductKey=" + aProduct.ProductKey.ToString() +"&ErrorMessage=" + ex.Message);
                        errorMessage = ex.Message;
                    }
                }
                else
                {
                    bool ok = aInvoice.IsDuplicateInvoiceItem(aInvoiceItem);
                    if (!ok)
                    {
                        Response.Redirect("CheckInfo.aspx?ProductKey=" + aProduct.ProductKey.ToString() + "&ErrorMessage=Duplicate Account Numbers are not allowed for the same product");
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

                    Response.Redirect("../PreviewBuilder/CheckPreview.aspx?ProductKey=" + aProduct.ProductKey.ToString() + "&AccountNumber=" + aCheckDetail.BankAccountNumber);
                }
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

        private void fillCheckOrderList(int aCheckOrderKey)
        {
            string sql = "select checkorderkey, description from checkorder order by displayorder";
            ArrayList checkOrderList = CheckOrderDataAccess.GetList(sql);
            foreach (CheckOrder aCheckOrder in checkOrderList)
            {
                ddlCheckOrder.Items.Add(new ListItem(aCheckOrder.Description, aCheckOrder.CheckOrderKey.ToString()));
            }
            foreach (ListItem i in ddlCheckOrder.Items)
            {
                i.Selected = (i.Value == aCheckOrderKey.ToString());
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
    }
}
