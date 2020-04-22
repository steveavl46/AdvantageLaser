using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.IO;
using CheckProject.WebUtils;
using AdvLaser.Logging;

namespace CheckProject
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            string tempLogoDir = @"images\temp_logos";

            DirectoryInfo di = new DirectoryInfo(Server.MapPath(tempLogoDir));
            foreach (FileInfo fi in di.GetFiles())
            {
                fi.Delete();
            }
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            Session["GUID"] = System.Guid.NewGuid().ToString();

            AdvLaser.Logging.Logger.LogInfo((string)Session["GUID"] + ": Session started");
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {
            AdvLaser.Logging.Logger.LogInfo((string)Session["GUID"] + ": Session ended");
            Session["InvoiceObject"] = null;
        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}