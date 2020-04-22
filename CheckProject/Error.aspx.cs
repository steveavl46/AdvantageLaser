using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CheckProject.WebUtils;
using System.Configuration;
using System.IO;

namespace CheckProject
{
    public partial class Error : BasePage
    {
        public string ErrorPageURL = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            bool localTesting = ((string)ConfigurationSettings.AppSettings["localtesting"] == "yes");
            Exception errorObj = Server.GetLastError().GetBaseException();
            string errMsg = "Error in: " + Request.Url.ToString() +
            "\nError Message:" + errorObj.Message.ToString() +
            "\nStack Trace:" + errorObj.StackTrace.ToString();
            LogError(errMsg, errorObj);


            string originalString = Request.Url.OriginalString;
            string pathAndQuery = Request.Url.PathAndQuery;
            string baseURL = originalString.Substring(0, originalString.Length - pathAndQuery.Length);
            ErrorPageURL = AppBasePath + @"/OrderStart/SelectProduct.aspx";
            Session["InvoiceObject"] = null;
        }
    }
}
