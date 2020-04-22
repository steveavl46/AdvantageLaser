using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CheckProject.WebUtils;
using System.Text;
using AdvLaser.AdvLaserDataAccess;
using AdvLaser.AdvLaserObjects;
using System.Collections;
using System.IO;

namespace CheckProject.PreviewBuilder
{
    public partial class CheckPreview : BasePage
    {
        public string ExtraHeight = "";
        int aProductKey;
        string aAccountNumber;
        bool hasStubOptions = false;
        bool hasPrintLinesOption = false;
        bool hasPrintPaymentRecordOnStubOption = false;
        bool hasShowCheckNoOption = false;
        bool hasAllowSuppressLine1 = false;
        bool hasAddressLineBoldOption = false;
        bool hasFontOption = false;
        bool hasLogoOption = false;
        const int HASPRINTLINESOPTION = 1;
        const int HASSTUBOPTIONS = 2;
        const int HASPRINTPAYMENTRECORDONSTUBOPTION = 3;
        const int SHOWCHECKNO = 5;
        const int HASALLOWSUPPRESSLINE1 = 6;
        const int HASADDRESSLINEBOLDOPTION = 9;
        const int HASFONTOPTION = 8;
        const int HASLOGOOPTION = 10;
        Invoice aInvoice;
        InvoiceItem aInvoiceItem;
        CheckDetail aCheckDetail;
        public decimal ColorSurcharge = 0;
        int aProductTypeKey;


        protected void Page_Load(object sender, EventArgs e)
        {
            aProductKey = Convert.ToInt32(Request.Params["ProductKey"]);
            aAccountNumber = (string)Request.Params["AccountNumber"];

            hdnProductKey.Value = aProductKey.ToString();
            
            LogInfo("Loading page 'ConfirmPreview'");

            
            Product aProduct = ProductDataAccess.GetOne(aProductKey);
            ProductType aProductType = ProductTypeDataAccess.GetOne(aProduct.ProductTypeKey);
            aProductTypeKey = aProduct.ProductTypeKey;
            string aProductCategoryDescription = aProductType.ProductCategoryObject.Description;
            string aProductDescription = aProductType.Description;

            

            ColorSurcharge = aProduct.ColorSurcharge;

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
                    case HASALLOWSUPPRESSLINE1:
                        hasAllowSuppressLine1 = true;
                        break;
                    case HASADDRESSLINEBOLDOPTION:
                        hasAddressLineBoldOption = true;
                        break;
                    case HASFONTOPTION:
                        hasFontOption = true;
                        break;
                    case HASLOGOOPTION:
                        hasLogoOption = true;
                        break;
                }
            }

            holderPrintLines.Visible = hasPrintLinesOption;
            holderStubOptions.Visible = hasStubOptions;
            holderPrintPaymentRecordOnStub.Visible = hasPrintPaymentRecordOnStubOption;
            holderCheckNo.Visible = hasShowCheckNoOption;
            holderSuppressLine1.Visible = hasAllowSuppressLine1;
            holderLineBold.Visible = hasAddressLineBoldOption;
            holderTypeFace.Visible = hasFontOption;
            holderLogo.Visible = hasLogoOption;
            if (hasPrintLinesOption)
            {
                
            }

            if (hasStubOptions)
            {
            }

            aInvoice = GetInvoiceFromSession(false);
            aInvoiceItem = aInvoice.GetInvoiceItem(aProductKey, aAccountNumber);
            if (aInvoiceItem == null)
            {
                aInvoiceItem = new InvoiceItem();
            }

            if (aInvoiceItem != null && !String.IsNullOrEmpty(aInvoiceItem.SoftwareName))
            {
                aProductDescription = "Voucher Checks for " + aInvoiceItem.SoftwareName;
            }

            lblProductDescription.Text = aProductDescription;

            aCheckDetail = aInvoiceItem.CheckDetailObject;

            if (!IsPostBack)
            {
                

                ArrayList colorList = new ArrayList();
                colorList = CheckColorDataAccess.GetList("select * from checkcolor where producttypekey = " + aProductTypeKey.ToString());
                foreach (CheckColor color in colorList)
                {
                    ListItem i = new ListItem(color.Description,color.CheckColorKey.ToString());
                    ddlColor.Items.Add(i);
                }

                string alignSQL = "select textalignkey as value, description as display from textalign";
                WebUtils.WebUtils.FillDropDownList(ddlAlignment, alignSQL);

                string typeFaceSQL = "select typefacekey as value, description as display from typeface";
                WebUtils.WebUtils.FillDropDownList(ddlTypeFace, typeFaceSQL);

                string logoLocationSQL = "select logolocationkey as value, description as display from logolocation";
                WebUtils.WebUtils.FillDropDownList(ddlLogoLocation, logoLocationSQL);

                populateUI();
                
            }
            if (!String.IsNullOrEmpty(aCheckDetail.LogoPath))
            {
                ExtraHeight = "height:680px";
                holderMicroPosition.Visible = true;
            }
            createCheck();
            findLogo();
            getCheckImage();
        }

        private void populateUI()
        {
            
            const int FONTWEIGHT_BOLD = 2;
            

            foreach (ListItem li in ddlAlignment.Items)
            {
                li.Selected = (Convert.ToInt32(li.Value) == aCheckDetail.TextAlignKey);
            }
            foreach (ListItem li in ddlTypeFace.Items)
            {
                li.Selected = (Convert.ToInt32(li.Value) == aCheckDetail.TypeFaceKey);
            }
            foreach (ListItem li in ddlColor.Items)
            {
                li.Selected = (Convert.ToInt32(li.Value) == aCheckDetail.CheckColorKey);
            }
            foreach (ListItem li in ddlLogoLocation.Items)
            {
                li.Selected = (Convert.ToInt32(li.Value) == aCheckDetail.LogoLocationKey);
            }
            chkLine1Bold.Checked = aCheckDetail.Line1FontWeightKey == FONTWEIGHT_BOLD;
            chkLine2Bold.Checked = aCheckDetail.Line2FontWeightKey == FONTWEIGHT_BOLD;
            chkPrintLines.Checked = aCheckDetail.PrintLines;
            

            foreach (ListItem li in radLogoColor.Items)
            {
                if (li.Value == "2")
                {
                    li.Text = "Color (" + ColorSurcharge.ToString("#.00") + "/check extra)";
                    if (aProductTypeKey == 8)
                    {

                        li.Text = "Color (" + ColorSurcharge.ToString("#.00") + "/page extra)";
                    }
                    else
                    {

                        li.Text = "Color (" + ColorSurcharge.ToString("#.00") + "/check extra)";
                    }
                }
            }
            if (!aCheckDetail.ColorLogo)
            {
                radLogoColor.SelectedValue = "1";
            }
            else
            {
                radLogoColor.SelectedValue = "2";
            }
            foreach (ListItem li in ddlSignatureLineCount.Items)
            {
                li.Selected = Convert.ToInt32(li.Text) == aCheckDetail.SignatureLineCount;
            }
            if (hasPrintLinesOption)
            {
                chkPrintLines.Checked = aCheckDetail.PrintLines;
            }
            if (hasStubOptions)
            {
                chkPrintPmtRecord.Checked = aCheckDetail.PrintPaymentRecordOnStub;
                if (aCheckDetail.CheckStubLineKey == null)
                {
                    aCheckDetail.CheckStubLineKey = 1;
                }
                foreach (ListItem li in radStub.Items)
                {
                    li.Selected = aCheckDetail.CheckStubLineKey == Convert.ToInt32(li.Value);
                }
            }
            if (hasShowCheckNoOption)
            {
                chkShowCheckNo.Checked = aCheckDetail.ShowCheckNo;
            }
            if (hasAllowSuppressLine1)
            {
                chkSuppressLine1.Checked = aCheckDetail.SuppressLine1;
            }
            txtMessageAboutSignature.Text = aCheckDetail.MessageAboveSignature;
            if (String.IsNullOrEmpty(aCheckDetail.LogoPath))
            {
                chkUseLogo.Enabled = false;
                chkUseLogo.ToolTip = "Please select a logo file";
            }
            else
            {
                ExtraHeight = "height:680px";
                holderMicroPosition.Visible = true;
            }

            if (aCheckDetail.Approved)
            {
                lblApproved.Text = "Yes";
            }
            else
            {
                lblApproved.Text = "No";
            }
        }

        protected void Adjust_Position(object sender, EventArgs e)
        {
            Set_To_Unapproved(sender, e);
            ImageButton button = (ImageButton)sender;
            string which = radMircoAdjust.SelectedItem.Text;
            if (which == "Logo")
            {
                switch (button.ID)
                {
                    case "btnUp":
                        aCheckDetail.LogoVerticalAdjustment -= Convert.ToInt32(ddlNudgeSize.SelectedValue);
                        break;
                    case "btnRight":
                        aCheckDetail.LogoLeftAdjustment += Convert.ToInt32(ddlNudgeSize.SelectedValue);
                        break;
                    case "btnLeft":
                        aCheckDetail.LogoLeftAdjustment -= Convert.ToInt32(ddlNudgeSize.SelectedValue);
                        break;
                    case "btnDown":
                        aCheckDetail.LogoVerticalAdjustment += Convert.ToInt32(ddlNudgeSize.SelectedValue);
                        break;
                }

            }
            else
            {
                switch (button.ID)
                {
                    case "btnUp":
                        aCheckDetail.AddressBlockVerticalAdjustment -= Convert.ToInt32(ddlNudgeSize.SelectedValue);
                        break;
                    case "btnRight":
                        aCheckDetail.AddressBlockLeftAdjustment += Convert.ToInt32(ddlNudgeSize.SelectedValue);
                        break;
                    case "btnLeft":
                        aCheckDetail.AddressBlockLeftAdjustment -= Convert.ToInt32(ddlNudgeSize.SelectedValue);
                        break;
                    case "btnDown":
                        aCheckDetail.AddressBlockVerticalAdjustment += Convert.ToInt32(ddlNudgeSize.SelectedValue);
                        break;
                }
            }
        }

        private void getCheckImage()
        {
            StringBuilder aURLBuilder = new StringBuilder();
            aURLBuilder.Append(@"CheckImageBuilder.aspx?ProductKey=");
            aURLBuilder.Append(aProductKey.ToString());
            aURLBuilder.Append("&AccountNumber=");
            aURLBuilder.Append(aAccountNumber);
            string aImageURL = aURLBuilder.ToString();
            LogInfo("Loading image with URL " + aImageURL);
            imgConfirm.ImageUrl = (aImageURL);
        }

        public void Set_To_Unapproved(object sender, EventArgs e)
        {
            aCheckDetail.Approved = false;
            lblApproved.Text = "No";
        }

        private void findLogo()
        {
            Dictionary<string, string> d = (Dictionary<string, string>)Session["LogoList"];
            if (d == null)
            {
                d = new Dictionary<string, string>();
            }

            //imgLogo.Visible = false;
            //lblNoLogo.Visible = true;
            //Invoice aInvoice = GetInvoiceFromSession(true);

            string key = "";
            string tempFileName = "";

            if (aInvoiceItem != null)
            {
                key = aCheckDetail.RoutingNumber + "-" + aCheckDetail.BankAccountNumber;
            }

            if (d.ContainsKey(key))
            {
                tempFileName = d[key];
            }

            if (!String.IsNullOrEmpty(tempFileName))
            {
                aCheckDetail.UseLogo = true;
                btnManageLogo.Text = "Change Logo";
            }
        }

        private void createCheck()
        {
            aCheckDetail.CheckColorKey = Convert.ToInt32(ddlColor.SelectedValue);
            aCheckDetail.TextAlignKey = Convert.ToInt32(ddlAlignment.SelectedValue);
            aCheckDetail.TypeFaceKey = Convert.ToInt32(ddlTypeFace.SelectedValue);
            if (hasPrintLinesOption)
            {
                aCheckDetail.PrintLines = chkPrintLines.Checked;
            }
            else
            {
                aCheckDetail.PrintLines = false;
            }
            if (hasStubOptions)
            {
                aCheckDetail.PrintPaymentRecordOnStub = chkPrintPmtRecord.Checked;
                aCheckDetail.CheckStubLineKey = Convert.ToInt32(radStub.SelectedValue);
            }
            else
            {
                aCheckDetail.PrintPaymentRecordOnStub = false;
                aCheckDetail.CheckStubLineKey = null;
            }
            aCheckDetail.ShowCheckNo = false;
            if (hasShowCheckNoOption)
            {
                aCheckDetail.ShowCheckNo = chkShowCheckNo.Checked;
            }
            aCheckDetail.SuppressLine1 = chkSuppressLine1.Checked;
            if (aCheckDetail.UseLogo)
            {
                aCheckDetail.LogoLocationKey = Convert.ToInt32(radLogoPosition.SelectedValue);
            }
            else
            {
                aCheckDetail.LogoLocationKey = null;
            }
            aCheckDetail.SignatureLineCount = Convert.ToInt32(ddlSignatureLineCount.SelectedValue);
            aCheckDetail.MessageAboveSignature = txtMessageAboutSignature.Text;
            aCheckDetail.UseLogo = chkUseLogo.Checked;

            aCheckDetail.ColorLogo = (radLogoColor.SelectedValue == "2");

            hdnAccountNumber.Value = aCheckDetail.BankAccountNumber;
            hdnRoutingNumber.Value = aCheckDetail.RoutingNumber;

            if (chkLine1Bold.Checked)
            {
                aCheckDetail.Line1FontWeightKey = 2;
            }
            else
            {
                aCheckDetail.Line1FontWeightKey = 1;
            }

            if (chkLine2Bold.Checked)
            {
                aCheckDetail.Line2FontWeightKey = 2;
            }
            else
            {
                aCheckDetail.Line2FontWeightKey = 1;
            }

            aInvoiceItem.CheckDetailObject = aCheckDetail;
            //aInvoice.AddInvoiceItem(aInvoiceItem);
            Session["InvoiceObject"] = aInvoice;
        }

        public void btnContinue_OnClick(Object sender, EventArgs e)
        {
            LogInfo("called btnContinue_OnClick ");
            Response.Redirect("../OrderProcessing/ViewOrder.aspx");
        }

        public void btnPrevious_OnClick(Object sender, EventArgs e)
        {
            Response.Redirect("../OrderCheck/CheckInfo.aspx?ProductKey=" + aProductKey.ToString() + "&AccountNumber=" + aAccountNumber);
        }

        protected void btnCancel_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("../OrderStart/SelectProduct.aspx");
        }
    }
}
