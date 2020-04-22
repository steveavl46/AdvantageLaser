using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using AdvLaser.AdvLaserObjects;
using CheckProject.WebUtils;
using System.Collections;
using System.IO;
using System.Drawing.Imaging;
using System.Drawing.Drawing2D;
using AdvLaser.AdvLaserDataAccess;

namespace CheckProject.PreviewBuilder
{
    public partial class FullCheckImageBuilder : BasePage
    {
        CheckDetail aCheckDetail;
        StringFormat sfCenter = new StringFormat();
        StringFormat sfLeft = new StringFormat();
        int aProductKey;
        string aAccountNumber;

        protected void Page_Load(object sender, EventArgs e)
        {
            LogInfo("Loading FullCheckImageBuilder.aspx");
            sfCenter.Alignment = StringAlignment.Center;
            sfLeft.Alignment = StringAlignment.Near;


            aProductKey = Convert.ToInt32(Request.Params["ProductKey"]);
            aAccountNumber = (string)Request.Params["AccountNumber"];
            Bitmap bmp = GetFullCheckImage(Convert.ToInt32(aProductKey), aAccountNumber, FULL_IMAGE);           
            MemoryStream stream = new MemoryStream();
            bmp.Save(stream, ImageFormat.Jpeg);
            LogInfo("Bitmap saved to memorystream");
            byte[] pBuffer = stream.ToArray();
            Response.ContentType = "image/jpeg";

            LogInfo("Buffer size: " + pBuffer.Length);

            Response.OutputStream.Write(pBuffer, 0, pBuffer.Length);

        }

        private static System.Drawing.Image resizeImage(System.Drawing.Image imgToResize)
        {
            Size size = new Size(300, 257);
            int sourceWidth = imgToResize.Width;
            int sourceHeight = imgToResize.Height;

            float nPercent = 0;
            float nPercentW = 0;
            float nPercentH = 0;

            nPercentW = ((float)size.Width / (float)sourceWidth);
            nPercentH = ((float)size.Height / (float)sourceHeight);

            if (nPercentH < nPercentW)
                nPercent = nPercentH;
            else
                nPercent = nPercentW;

            int destWidth = (int)(sourceWidth * nPercent);
            int destHeight = (int)(sourceHeight * nPercent);

            Bitmap b = new Bitmap(destWidth, destHeight);
            Graphics g = Graphics.FromImage((System.Drawing.Image)b);
            g.InterpolationMode = InterpolationMode.HighQualityBicubic;

            g.DrawImage(imgToResize, 0, 0, destWidth, destHeight);
            g.Dispose();

            return (System.Drawing.Image)b;
        }

        private Bitmap getLogo(InvoiceItem aInvoiceItem)
        {
            LogInfo("Starting 'getLogo()'");
            object logo = "";
            try
            {
                CheckDetail aCheckDetail = aInvoiceItem.CheckDetailObject;
                string fileName = aCheckDetail.SizedLogoName;// aCheckDetail.RoutingNumber + "-" + aCheckDetail.BankAccountNumber;
                LogInfo("Looking for logo: " + fileName);
                DirectoryInfo di = new DirectoryInfo(Server.MapPath(@"../images/logos/sized"));
                FileInfo[] files = di.GetFiles();
                foreach (FileInfo fi in files)
                {
                    if (fi.Name.IndexOf(fileName) >= 0)
                    {
                        logo = new Bitmap(Server.MapPath("../images/logos/sized/" + fi.Name));

                        LogInfo("Found logo file " + fi.Name);

                        break;
                    }
                }
            }
            catch (System.Exception e)
            {
                LogError("Error in 'getLogo()' " + e.Message);
            }
            LogInfo("Returning logo bitmap");
            return (Bitmap)logo;
        }

        private Point getCheckNumberPoint(string checkNumber, int which)
        {
            Point checkNumberPoint = new Point();
            checkNumberPoint.X = 600 - (int)(checkNumber.Length * 2.5);
            switch(which)
            {
                case 1:
                    checkNumberPoint.Y = 25;
                    break;
                case 2:
                    checkNumberPoint.Y = 310;
                    break;
                case 3:
                    checkNumberPoint.Y = 600;
                    break;
            }
            return checkNumberPoint;
        }

        private Point getStubLinePoint(int which)
        {
            int left = 55;
            int height = 0;
            switch (which)
            {
                case 1:
                    height = 310;
                    break;
                case 2:
                    height = 600;
                    break;
            }
            return new Point(left, height);
        }

        private Point getLinePoint(int lineOrder)
        {
            int leftAlignStart = 55;
            int centerAlignStart = 100;
            if (aCheckDetail.UseLogo)
            {
                leftAlignStart = 180;
                centerAlignStart = 235;
            }
            ArrayList checkLinesLeft = new ArrayList();
            checkLinesLeft.Add(new Point(leftAlignStart, 28));
            checkLinesLeft.Add(new Point(leftAlignStart, 42));
            checkLinesLeft.Add(new Point(leftAlignStart, 56));
            checkLinesLeft.Add(new Point(leftAlignStart, 70));
            checkLinesLeft.Add(new Point(leftAlignStart, 84));

            ArrayList checkLinesCenter = new ArrayList();
            checkLinesCenter.Add(new Point(centerAlignStart, 28));
            checkLinesCenter.Add(new Point(centerAlignStart, 42));
            checkLinesCenter.Add(new Point(centerAlignStart, 56));
            checkLinesCenter.Add(new Point(centerAlignStart, 70));
            checkLinesCenter.Add(new Point(centerAlignStart, 84));

            int alignment = aCheckDetail.TextAlignKey;
            if (alignment == 1)
            {
                return (Point)checkLinesLeft[lineOrder];
            }
            else
            {
                return (Point)checkLinesCenter[lineOrder];
            }
        }

        private StringFormat getLineFormat()
        {
            int alignment = aCheckDetail.TextAlignKey;
            if (alignment == 1)
            {
                return sfLeft;
            }
            else
            {
                return sfCenter;
            }
        }
    }
}
