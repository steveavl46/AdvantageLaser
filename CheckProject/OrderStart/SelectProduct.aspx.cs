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

namespace CheckProject.OrderStart
{
    public partial class SelectProduct : BasePage
    {
        const int DEPOSITSLIP = 1;
        const int CHECK = 3;

        protected void Page_Load(object sender, EventArgs e)
        {
            LogInfo("Loaded 'SelectProduct.aspx'");
            RemoveUnapprovedChecksFromInvoice();
            
            string aDepositSlipSQL = "usp_SelectProduct_DepositSlipList";
            string aPrePrintedCheckkSQL = "exec usp_SelectProduct_PrePrintedCheckList";
            ArrayList aDepositSlipList = ProductTypeDataAccess.GetProductTypeList(aDepositSlipSQL);
            ArrayList aPrePrintedCheckList = ProductTypeDataAccess.GetProductTypeList(aPrePrintedCheckkSQL);
            TableRow tr;
            TableCell td;
            tblDepositSlips.Visible = (aDepositSlipList.Count > 0);
            foreach (ProductType aProductType in aDepositSlipList)
            {
                tr = new TableRow();
                td = new TableCell();
                LinkButton b = new LinkButton();
                b.Text = aProductType.Description;
                if (aProductType.ProductCategoryKey == DEPOSITSLIP)
                {
                    b.PostBackUrl = "../OrderDepositSlip/DepositSlipInfo.aspx?ProductTypeKey=" + aProductType.ProductTypeKey.ToString();
                }
                if (aProductType.ProductCategoryKey == CHECK)
                {
                    b.PostBackUrl = "../OrderCheck/CheckInfo.aspx?ProductTypeKey=" + aProductType.ProductTypeKey.ToString();
                }
                td.Controls.Add(b);
                td.Style.Add(HtmlTextWriterStyle.TextAlign, "center");
                tr.Cells.Add(td);
                tblDepositSlips.Rows.Add(tr);
            }

            tblPrePrintedChecks.Visible = (aPrePrintedCheckList.Count > 0);
            foreach (ProductType aProductType in aPrePrintedCheckList)
            {
                tr = new TableRow();
                td = new TableCell();
                LinkButton b = new LinkButton();
                b.Text = aProductType.Description;
                if (aProductType.ProductCategoryKey == DEPOSITSLIP)
                {
                    b.PostBackUrl = "../OrderDepositSlip/DepositSlipInfo.aspx?ProductTypeKey=" + aProductType.ProductTypeKey.ToString();
                }
                if (aProductType.ProductCategoryKey == CHECK)
                {
                    b.PostBackUrl = "../OrderCheck/CheckInfo.aspx?ProductTypeKey=" + aProductType.ProductTypeKey.ToString();
                }
                td.Controls.Add(b);
                td.Style.Add(HtmlTextWriterStyle.TextAlign, "center");
                tr.Cells.Add(td);
                tblPrePrintedChecks.Rows.Add(tr);
            }

        }
    }
}
