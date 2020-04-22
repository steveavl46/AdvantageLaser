using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CheckProject.controls
{
    public partial class RequiredFieldIndicator : System.Web.UI.UserControl
    {
        private string required = ""; // set a default in case client does not use 'Required' attribute

        public string Required
        {
            set { required = value; }
        }

        protected override void OnPreRender(EventArgs e)
        {
            if (required.ToUpper() == "TRUE" || required.ToUpper() == "YES" || required.ToUpper() == "Y" || required.ToUpper() == "T")
            {
                fld.Text = "*";
            }
            else
            {
                fld.Text = "&nbsp;&nbsp;";
            }
        }
    }
}