using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using AdvLaser.AdvLaserObjects;
using CheckProject.WebUtils;
using NLog;
using AdvLaser.AdvLaserDataAccess;

namespace CheckProject.PreviewBuilder
{
    public partial class ConfirmPreview : BasePage
    {
        int aProductKey;
        string aAccountNumber;
        int aProductTypeKey;
        protected void Page_Load(object sender, EventArgs e)
        {
            aProductKey = Convert.ToInt32(Request.Params["ProductKey"]);
            aAccountNumber = (string)Request.Params["AccountNumber"];
            LogInfo("Loading page 'ConfirmPreview'");

            Product aProduct = ProductDataAccess.GetOne(aProductKey);
            ProductType aProductType = ProductTypeDataAccess.GetOne(aProduct.ProductTypeKey);
            aProductTypeKey = aProductType.ProductTypeKey;
            string aProductCategoryDescription = aProductType.ProductCategoryObject.Description;
            string aProductDescription = aProductType.Description;
            lblProductDescription.Text = aProductDescription;
            Invoice aInvoice = GetInvoiceFromSession();

            InvoiceItem aInvoiceItem = aInvoice.GetInvoiceItem(aProductKey, aAccountNumber);
            DepositSlip aDepositSlip = aInvoiceItem.DepositSlipObject;
            DepositBook aDepositBook = aInvoiceItem.DepositBookObject;


            string strLine1;
            string strLine2;
            string strLine3;
            string strLine4;
            string strLine5;
            string strBankInfoLine1;
            string strBankInfoLine2;
            string strBankInfoLine3;
            string strAccountNumber;
            string strRoutingNumber;
            string strBankFraction;
            string productTypeKey;

            if (aProductType.ProductTypeKey == 12)
            {
                strLine1 = Server.UrlEncode(aDepositBook.Line1);
                strLine2 = Server.UrlEncode(aDepositBook.Line2);
                strLine3 = Server.UrlEncode(aDepositBook.Line3);
                strLine4 = Server.UrlEncode(aDepositBook.Line4);
                strLine5 = Server.UrlEncode(aDepositBook.Line5);
                strBankInfoLine1 = Server.UrlEncode(aDepositBook.BankInfoLine1);
                strBankInfoLine2 = Server.UrlEncode(aDepositBook.BankInfoLine2);
                strBankInfoLine3 = Server.UrlEncode(aDepositBook.BankInfoLine3);
                strAccountNumber = aDepositBook.AccountNumber;
                strRoutingNumber = aDepositBook.RoutingNumber;
                strBankFraction = aDepositBook.Fraction;
                productTypeKey = "12";
            }
            else
            {
                strLine1 = Server.UrlEncode(aDepositSlip.Line1);
                strLine2 = Server.UrlEncode(aDepositSlip.Line2);
                strLine3 = Server.UrlEncode(aDepositSlip.Line3);
                strLine4 = Server.UrlEncode(aDepositSlip.Line4);
                strLine5 = Server.UrlEncode(aDepositSlip.Line5);
                strBankInfoLine1 = Server.UrlEncode(aDepositSlip.BankInfoLine1);
                strBankInfoLine2 = Server.UrlEncode(aDepositSlip.BankInfoLine2);
                strBankInfoLine3 = Server.UrlEncode(aDepositSlip.BankInfoLine3);
                strAccountNumber = aDepositSlip.AccountNumber;
                strRoutingNumber = aDepositSlip.RoutingNumber;
                strBankFraction = aDepositSlip.Fraction;
                productTypeKey = "1";
            }
            //string strProductTypeKey = aDepositSlip.
            //string strProductKey = Request.Params.Get("radProduct");
            //ProductTypeKey.Value = strProductTypeKey;
            //ProductKey.Value = strProductKey;
            if (!IsPostBack)
            {
                StringBuilder aURLBuilder = new StringBuilder();
                aURLBuilder.Append(@"ImageBuilder.aspx?Line1=");
                aURLBuilder.Append(strLine1);
                aURLBuilder.Append("&Line2=");
                aURLBuilder.Append(strLine2);
                aURLBuilder.Append("&Line3=");
                aURLBuilder.Append(strLine3);
                aURLBuilder.Append("&Line4=");
                aURLBuilder.Append(strLine4);
                aURLBuilder.Append("&Line5=");
                aURLBuilder.Append(strLine5);
                aURLBuilder.Append("&bankname=");
                aURLBuilder.Append(strBankInfoLine1);
                aURLBuilder.Append("&accountnumber=");
                aURLBuilder.Append(strAccountNumber);
                aURLBuilder.Append("&routingnumber=");
                aURLBuilder.Append(strRoutingNumber);
                aURLBuilder.Append("&bankcsz=");
                aURLBuilder.Append(strBankInfoLine2);
                aURLBuilder.Append("&bankphone=");
                aURLBuilder.Append(strBankInfoLine3);
                aURLBuilder.Append("&bankfraction=");
                aURLBuilder.Append(strBankFraction);
                aURLBuilder.Append("&producttypekey=");
                aURLBuilder.Append(productTypeKey);
                string aImageURL = aURLBuilder.ToString();
                LogInfo("Loading image with URL " + aImageURL);
                imgConfirm.ImageUrl = (aImageURL);
            }
        }

        public void btnContinue_OnClick(Object sender, EventArgs e)
        {
            LogInfo("called btnContinue_OnClick ");
            Response.Redirect("../OrderProcessing/ViewOrder.aspx");
        }

        public void btnPrevious_OnClick(Object sender, EventArgs e)
        {
            if (aProductTypeKey == 12)
            {
                Response.Redirect("../OrderDepositSlip/DepositBookInfo.aspx?ProductKey=" + aProductKey.ToString() + "&AccountNumber=" + aAccountNumber);
            }
            else
            {
                Response.Redirect("../OrderDepositSlip/DepositSlipInfo.aspx?ProductKey=" + aProductKey.ToString() + "&AccountNumber=" + aAccountNumber);
            }
        }

        protected void btnCancel_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("../OrderStart/SelectProduct.aspx");
        }
    }
}
