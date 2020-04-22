using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CheckProject.WebUtils;

namespace CheckProject
{
    public partial class NoSession : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LogError("Session expired");
        }
    }
}
