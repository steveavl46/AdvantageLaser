using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using CheckProject.WebUtils;
using NLog;
using System.Configuration;
using System.Drawing;
using System.IO;
using AdvLaser.AdvLaserObjects;

namespace CheckProject.PreviewBuilder
{
    public partial class FullCheckPreview : BasePage
    {
        int aProductKey;
        string aAccountNumber;
        bool done;
        Invoice aInvoice;
        CheckDetail aCheckDetail;
        string doneParam = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            aInvoice = GetInvoiceFromSession(false);
            aProductKey = Convert.ToInt32(Request.Params["ProductKey"]);
            aAccountNumber = (string)Request.Params["AccountNumber"];
            doneParam = (Request.Params["Done"]);
            done = (doneParam.ToUpper() == "TRUE");
            //done = Convert.ToBoolean(Request.Params["Done"]);
            hdnAccountNumber.Value = aAccountNumber;
            hdnProductKey.Value = aProductKey.ToString();
            getCheckImage();
        }

        private void getCheckImage()
        {
            StringBuilder aURLBuilder = new StringBuilder();
            aURLBuilder.Append(@"FullCheckImageBuilder.aspx?ProductKey=");
            aURLBuilder.Append(aProductKey.ToString());
            aURLBuilder.Append("&AccountNumber=");
            aURLBuilder.Append(aAccountNumber);
            string aImageURL = aURLBuilder.ToString();
            LogInfo("Loading image with URL " + aImageURL);
            imgConfirm.ImageUrl = (aImageURL);
        }

        public void btnApprove_OnClick(object sender, EventArgs e)
        {
            if (chkApprove.Checked)
            {
                string routingNumber = "";
                InvoiceItem aInvoiceItem = aInvoice.GetInvoiceItem(aProductKey, aAccountNumber);
                if (aInvoiceItem != null)
                {
                    aCheckDetail = aInvoiceItem.CheckDetailObject;
                    routingNumber = aCheckDetail.RoutingNumber;
                }
                string previewDirectory = (string)ConfigurationSettings.AppSettings["preview_directory"];
                Bitmap bmp = GetFullCheckImage(aProductKey, aAccountNumber, FULL_IMAGE);
                string previewPath = Path.Combine(previewDirectory, routingNumber + "-" + aAccountNumber + ".jpg");
                LogInfo("Saving preview image to: " + previewPath);
                aCheckDetail.PreviewPath = previewPath;
                aCheckDetail.Approved = chkApprove.Checked;
                aInvoiceItem.CheckDetailObject = aCheckDetail;
                Session["InvoiceObject"] = aInvoice;
                Bitmap bmpSave = new Bitmap(bmp);
                //bmp.Save(previewPath);
                bmpSave.Save(previewPath);
                if (done)
                {
                    holderClose.Visible = true;
                }
                else
                {
                    holderNotApproved.Visible = true;
                }
            }
            else
            {
                holderNotApproved.Visible = true;
            }
        }
    }
}
