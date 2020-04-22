using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CheckProject
{
    public partial class helpimage : System.Web.UI.Page
    {
        public string TitleString = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            int lHelpImage = Convert.ToInt32(Request.Params.Get("HelpImage"));

            string imgPath = "";
            switch (lHelpImage)
            {
                case 1:
                    imgPath = "images/help/help-routingnumber.jpg";
                    TitleString = "Routing Number Help";
                    break;
                case 2:
                    imgPath = "images/help/help-accountnumber.jpg";
                    TitleString = "Account Number Help";
                    break;
                case 3:
                    imgPath = "images/help/help-fraction.jpg";
                    TitleString = "Fraction Help";
                    break;
            }
            
            imgHelp.ImageUrl = imgPath;
        }
    }
}
