using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CheckProject.OrderDepositSlip
{
    public partial class DepositStamp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            imgStamp.ImageUrl = "../PreviewBuilder/SelfInkingStampBuilder.aspx";
        }
    }
}
