using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AdvLaser.AdvLaserObjects;
using CheckProject.WebUtils;
using AdvLaser.AdvLaserDataAccess;
using System.IO;

namespace CheckProject
{
    public partial class ThankYou : BasePage
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            string aInvoiceKey = Request.Params.Get("InvoiceKey");
            Invoice aInvoice = InvoiceDataAccess.GetOne(Convert.ToInt32(aInvoiceKey));

            if (aInvoice.ComputerIP == getComputerIP())
            {
                
                lblDisplay.Text = WebUtils.WebUtils.GetInvoiceForDisplay(aInvoice, true);
            }
            else
            {
                Response.Write("Unable to display invoice " + aInvoiceKey);
            }
            Session["InvoiceObject"] = null;
        }

        public void btnReturnToSite_OnClick(object sender, EventArgs e)
        {
            Session["InvoiceObject"] = null;
            Session["PopUpViewed"] = null;
            //string url = Path.Combine(AppBasePath, "/OrderStart/SelectProduct.aspx");
            Response.Redirect("http://www.advlaser.com");
        }

        public void btn_StartOrder_OnClick(object sender, EventArgs e)
        {
            string url = AppBasePath + @"/OrderStart/SelectProduct.aspx";
            Session["InvoiceObject"] = null;
            Response.Redirect(url);
        }
    }
}
