using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
using System.Drawing.Imaging;
using CheckProject.WebUtils;

namespace CheckProject.PreviewBuilder
{
    public partial class SelfInkingStampBuilder : BasePage
    {
        StringFormat sfCenter = new StringFormat();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            sfCenter.Alignment = StringAlignment.Center;
            LogInfo("Loaded 'SelfInkingStampBuilder.aspx'");
            string aCompanyName = Request.Params.Get("CompanyName");
            string aBankName = Request.Params.Get("BankName");
            string aAccountNumber = Request.Params.Get("AccountNumber");

            if (String.IsNullOrEmpty(aCompanyName))
            {
                aCompanyName = "Your Company Name";
            }
            else
            {
                if (aCompanyName.ToUpper() == "ADP")
                {
                    aCompanyName = "";
                }
            }
            if (String.IsNullOrEmpty(aBankName))
            {
                aBankName = "Your Bank Name";
            }
            if (String.IsNullOrEmpty(aAccountNumber))
            {
                aAccountNumber = "00000000";
            }

            int aSpacerHeight = 13;
            //int aPayToTheOrderOfHeight = 10;
            int aForDepositOnlyHeight = 10; 
            
            
            int aCompanyNameHeight = aForDepositOnlyHeight + aSpacerHeight;
            //int aBankNameHeight = aCompanyNameHeight + aSpacerHeight;
            int aAccountNumberHeight = aCompanyNameHeight + aSpacerHeight;
            int aFontEMSize = 9;
            //int aLeft = 15;
            FontFamily aTextFont = new FontFamily("Arial");

            Bitmap bmp = new Bitmap(Server.MapPath("../images/self_inking_stamp.jpg"));

            Graphics gr;
            gr = Graphics.FromImage(bmp);
            gr.SmoothingMode = SmoothingMode.AntiAlias;

            //gr.DrawString("Pay to the order of", new Font(aTextFont, aFontEMSize, FontStyle.Bold), SystemBrushes.WindowText, center("Pay To the order of"), aPayToTheOrderOfHeight);
            gr.DrawString("FOR DEPOSIT ONLY", new Font(aTextFont, aFontEMSize, FontStyle.Bold), SystemBrushes.WindowText, new Point(75, aForDepositOnlyHeight), sfCenter); 
            //gr.DrawString(aBankName, new Font(aTextFont, aFontEMSize, FontStyle.Bold), SystemBrushes.WindowText, new Point(75, aBankNameHeight),sfCenter);                        
            if (!String.IsNullOrEmpty(aCompanyName))
            {
                gr.DrawString(aCompanyName, new Font(aTextFont, aFontEMSize, FontStyle.Bold), SystemBrushes.WindowText, new Point(75, aCompanyNameHeight), sfCenter);
                gr.DrawString(aAccountNumber, new Font(aTextFont, aFontEMSize, FontStyle.Bold), SystemBrushes.WindowText, new Point(75, aAccountNumberHeight), sfCenter);
            }
            else
            {
                // if no company name, put account number where name would be
                gr.DrawString(aAccountNumber, new Font(aTextFont, aFontEMSize, FontStyle.Bold), SystemBrushes.WindowText, new Point(75, aCompanyNameHeight), sfCenter);
            }
            
            gr.Save();
            //bmp.Save(@"C:\imagetester\test1.jpg");
            MemoryStream stream = new MemoryStream();
            bmp.Save(stream, ImageFormat.Jpeg);
            byte[] pBuffer = stream.ToArray();
            Response.ContentType = "image/jpeg";

            //write the image to the output stream

            //Response.Write("hello world");

            Response.OutputStream.Write(pBuffer, 0, pBuffer.Length);
        }

        private int center(string aLine)
        {
            decimal multiplier = 5;
            int start = 55;
            int length = aLine.Length;
            return start - Convert.ToInt32((length * multiplier)/ 2);
        }
    }
}
