using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AdvLaser.AdvLaserDataAccess;
using AdvLaser.AdvLaserObjects;
using System.Data.SqlClient;
using System.Net.Mail;
using CheckProject.WebUtils;


namespace CheckProject
{
    public partial class _Default : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Invoice aInvoice = InvoiceDataAccess.GetOne(30);

            InvoiceItemCollection col = InvoiceItemCollectionDataAccess.GetInvoiceItemsForInvoice(30);
        }
    }
}
