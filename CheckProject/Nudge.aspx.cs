using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CheckProject.WebUtils;

namespace CheckProject
{
    public partial class Nudge : BasePage
    {
        public string accountNumber;
        public string productkey;

        protected void Page_Load(object sender, EventArgs e)
        {
            accountNumber = Request.Params.Get("AccountNumber");
            productkey = Request.Params.Get("ProductKey");
            hdnAccountNumber.Value = accountNumber;
            hdnProductKey.Value = productkey;
            btnDown.Attributes.Add("onclick", "nudge();");
            btnUp.Attributes.Add("onclick", "nudge();");
            btnRight.Attributes.Add("onclick", "nudge();");
            btnLeft.Attributes.Add("onclick", "nudge();");
        }

        protected void Adjust_Position(object sender, EventArgs e)
        {
 
        }
    }
}
