using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AdvLaser.AdvLaserDataAccess;
using AdvLaser.AdvLaserObjects;

namespace CheckProject
{
    public partial class page1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Customer c = (Customer)Session["customerobject"];
        }
    }
}
