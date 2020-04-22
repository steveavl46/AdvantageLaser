using CheckProject.WebUtils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CheckProject
{
    public partial class InvalidCharacter : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var ipValidation = Convert.ToInt32(Request.Params.Get("ValidationCode"));
            switch (ipValidation)
            {
                case 100:
                    lblLockedOut.Visible = true;
                    break;
                case 200:
                    lblTimeOut.Visible = true;
                    break;
                default:
                    lblLockedOut.Visible = true;
                    break;

            }
        }
    }
}