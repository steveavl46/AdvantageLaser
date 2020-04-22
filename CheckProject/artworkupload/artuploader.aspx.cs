using CheckProject.WebUtils;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CheckProject.artworkupload
{
    public partial class artuploader : BasePage
    {
        public class MyObject
        {
            public string success { get; set; }
        }
        public string uploadDir;
        string salesPerson = String.Empty;
        string orderNumber = String.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            uploadDir = (string)ConfigurationSettings.AppSettings["art_upload_directory"];
            orderNumber = Request.Params.Get("OrderNum");
            if (String.IsNullOrEmpty(orderNumber))
            {
                orderNumber = String.Empty;
            }
            

            salesPerson = Request.Params.Get("SalesMan");
            if (String.IsNullOrEmpty(salesPerson))
            {
                salesPerson = "ADVLASER";
            }
            if (!IsPostBack)
            {
                txtCustomerID.Text = orderNumber;
            }
        }

        protected void UploadButton_Click(object sender, EventArgs e)
        {
            lblErrorMessage.Visible = !Page.IsValid;
            if (Page.IsValid)
            {
                if (FileUploadControl.HasFile)
                {
                    try
                    {
                        lblUploadStatus.CssClass = "uploadError";
                        string contentType = FileUploadControl.PostedFile.ContentType;
                        if (isLegalContent(contentType))
                        {
                            if (FileUploadControl.PostedFile.ContentLength < 52428800)
                            {
                                string fromEmail = txtConfirmEmail.Text;
                                string orderNumber = txtCustomerID.Text;
                                string filename = salesPerson + "_" + orderNumber + "_" + Path.GetFileName(FileUploadControl.FileName);
                                string fileLocation = Server.MapPath(@"../" + uploadDir + "/" + filename);
                                
                                FileUploadControl.SaveAs(fileLocation);
                                lblUploadStatus.Text = "Upload status: File uploaded successfully";
                                lblUploadStatus.CssClass = "uploadSuccess";
                                sendEmail(fromEmail, orderNumber, fileLocation);
                            }
                            else
                                lblUploadStatus.Text = "Upload status: Error - The file has to be less than 50 mb";
                        }
                        else
                            lblUploadStatus.Text = "Upload status: Error - Unsupported file type";
                    }
                    catch (Exception ex)
                    {
                        lblUploadStatus.Text = "Upload status: Error - " + ex.Message;
                    }
                }
            }
        }

        private void sendEmail(string fromEmail, string orderNumber, string fileLocation)
        {
            bool testing = ((string)ConfigurationSettings.AppSettings["testing"] == "yes");
            bool localTesting = ((string)ConfigurationSettings.AppSettings["localtesting"] == "yes");
            string sToEmail = (string)ConfigurationSettings.AppSettings["art_upload_email"];
            string sSalesEmail = (string)ConfigurationSettings.AppSettings["salesEmail"];
            if (localTesting)
            {
                return;
            }
            
            if (testing)
            {
                sToEmail = (string)ConfigurationSettings.AppSettings["adminEmail"];
            }
            System.Net.Mail.MailMessage msg = new System.Net.Mail.MailMessage();
            msg.From = new MailAddress(sSalesEmail);
            msg.To.Add(sToEmail);
            msg.IsBodyHtml = true;
            string sSubject = "Envelope Artwork Received: " + orderNumber;
            msg.Subject = sSubject;
            StringBuilder body = new StringBuilder();
            //body.Append("New customer image upload");
            //body.Append("<br/>");
            body.Append("Order number: " + orderNumber);
            body.Append("<br/>");
            body.Append("File location: " + fileLocation);
            body.Append("<br/>");
            body.Append("customer Email: " + fromEmail);
            msg.Body = body.ToString();

            SmtpClient client = new SmtpClient();
            client.Send(msg);


        }

        private bool isLegalContent(string contentType)
        {
            return
                contentType == "image/jpeg" ||
                contentType == "application/illustrator" ||
                contentType == "image/bmp" ||
                contentType == "application/vnd.ms-word" ||
                contentType == "application/vnd.openxmlformats-officedocument.wordprocessingml.document" ||
                contentType == "image/gif" ||
                contentType == "application/pdf" ||
                contentType == "image/tiff" ||
                contentType == "image/png" ||
                contentType == "application/postscript" ||
                contentType == "application/pcx"
                ;
        }

        public bool ValidateRecaptcha()
        {
            string Response = Request["g-recaptcha-response"];//Getting Response String Append to Post Method
            LogInfo(Response);
            bool Valid = false;
            //Request to Google Server
            HttpWebRequest req = (HttpWebRequest)WebRequest.Create("https://www.google.com/recaptcha/api/siteverify?secret=6Lfj9TQUAAAAAMxTBct6tqcTFZW44d8CfOk7-cJ8&response=" + Response);
            try
            {
                //Google recaptcha Response
                using (WebResponse wResponse = req.GetResponse())
                {

                    using (StreamReader readStream = new StreamReader(wResponse.GetResponseStream()))
                    {
                        string jsonResponse = readStream.ReadToEnd();

                        JavaScriptSerializer js = new JavaScriptSerializer();
                        MyObject data = js.Deserialize<MyObject>(jsonResponse);// Deserialize Json

                        Valid = Convert.ToBoolean(data.success);
                    }
                }

                return Valid;
            }
            catch (WebException ex)
            {
                throw ex;
            }
        }
    }
}