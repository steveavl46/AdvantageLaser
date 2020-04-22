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
using AdvLaser.AdvLaserObjects;
using AdvLaser.AdvLaserDataAccess;
using System.Collections;
using NLog;
using System.Text;

namespace CheckProject.PreviewBuilder
{
    public partial class CheckImageBuilder : BasePage
    {
        CheckDetail aCheckDetail;
        StringFormat sfCenter = new StringFormat();
        StringFormat sfLeft = new StringFormat();
        int aProductKey;
        string aAccountNumber;

        protected void Page_Load(object sender, EventArgs e)
        {
            LogInfo("Loading CheckImageBuilder.aspx");
            sfCenter.Alignment = StringAlignment.Center;
            sfLeft.Alignment = StringAlignment.Near;
            

            aProductKey = Convert.ToInt32(Request.Params["ProductKey"]);
            aAccountNumber = (string)Request.Params["AccountNumber"];

            Bitmap bmp = GetFullCheckImage(Convert.ToInt32(aProductKey), aAccountNumber, CHECK_ONLY);
            /*
            Invoice aInvoice = GetInvoiceFromSession();

            InvoiceItem aInvoiceItem = aInvoice.GetInvoiceItem(aProductKey, aAccountNumber);
            aCheckDetail = aInvoiceItem.CheckDetailObject;

            string line1 = aCheckDetail.Line1;
            string line2 = aCheckDetail.Line2;
            string line3 = aCheckDetail.Line3;
            string line4 = aCheckDetail.Line4;
            string line5 = aCheckDetail.Line5;
            string bankInfoLine1 = aCheckDetail.BankInfoLine1;
            string bankInfoLine2 = aCheckDetail.BankInfoLine2;
            string bankInfoLine3 = aCheckDetail.BankInfoLine3;
            string accountNumber = aCheckDetail.BankAccountNumber;
            string routingNumber = aCheckDetail.RoutingNumber;
            string bankFraction = aCheckDetail.Fraction;
            string checkNumber = aCheckDetail.StartingNumber;

            string sMICRCheckNumber = checkNumber.PadLeft(8, '0');

            int checkColorKey = aCheckDetail.CheckColorKey;
            int typeFaceKey = aCheckDetail.TypeFaceKey;

            CheckColor color = CheckColorDataAccess.GetOne(checkColorKey);

            TypeFace typeFace = TypeFaceDataAccess.GetOne(typeFaceKey);

            FontFamily addressFont = new FontFamily(typeFace.Description);
            FontFamily aMICRFont = new FontFamily("MICR E13B 2.1");
            FontFamily defaultFont = new FontFamily("Arial");

            string imagePath = color.ImagePath;

            float aFontEMSize = 10;
            int aMICRFontEMSize = 10;

            Brush defaultTextBrush = SystemBrushes.WindowText;

            string msg = aCheckDetail.MessageAboveSignature;
            Bitmap bmp = new Bitmap(Server.MapPath(imagePath));

            LogInfo("Using base image:" + imagePath);

            Graphics gr;
            gr = Graphics.FromImage(bmp);

            LogInfo("Graphics object created from image");

            gr.SmoothingMode = SmoothingMode.AntiAlias;

            if (!aCheckDetail.SuppressLine1)
            {
                if (aCheckDetail.Line1FontWeightKey == 1)
                {
                    gr.DrawString(line1, new Font(addressFont, aFontEMSize, FontStyle.Regular), SystemBrushes.WindowText, getLinePoint(0), getLineFormat());
                }
                else
                {
                    gr.DrawString(line1, new Font(addressFont, aFontEMSize, FontStyle.Bold), SystemBrushes.WindowText, getLinePoint(0), getLineFormat());
                }
            }
            if (aCheckDetail.Line2FontWeightKey == 1)
            {
                gr.DrawString(line2, new Font(addressFont, aFontEMSize, FontStyle.Regular), SystemBrushes.WindowText, getLinePoint(1), getLineFormat());
            }
            else
            {
                gr.DrawString(line2, new Font(addressFont, aFontEMSize, FontStyle.Bold), SystemBrushes.WindowText, getLinePoint(1), getLineFormat());
            }
            gr.DrawString(line3, new Font(addressFont, aFontEMSize), SystemBrushes.WindowText, getLinePoint(2), getLineFormat());
            gr.DrawString(line4, new Font(addressFont, aFontEMSize), SystemBrushes.WindowText, getLinePoint(3), getLineFormat());
            gr.DrawString(line5, new Font(addressFont, aFontEMSize), SystemBrushes.WindowText, getLinePoint(4), getLineFormat());

            
            //sf.LineAlignment = StringAlignment.Center;

            Point payToTheOrderLineStart = new Point(85, 130);
            Point payToTheOrderLineEnd = new Point(510, 130);
            Point numericLineStart = new Point(535, 130);
            Point numericLineEnd = new Point(665, 130);
            Point spelledAmountLineStart = new Point(31, 155);
            Point spelledAmountLineEnd = new Point(616, 155);
            Point dateLineStart = new Point(535, 80);
            Point dateLineEnd = new Point(665, 80);

            //lines
            if (aCheckDetail.PrintLines)
            {
                // pay to the order line
                gr.DrawLine(new Pen(Color.Black, 1), payToTheOrderLineStart , payToTheOrderLineEnd);
                // numeric amount line
                gr.DrawLine(new Pen(Color.Black, 1), numericLineStart, numericLineEnd);
                // spelled out amount line
                gr.DrawLine(new Pen(Color.Black, 1), spelledAmountLineStart, spelledAmountLineEnd);
                // date line
                gr.DrawLine(new Pen(Color.Black, 1), dateLineStart, dateLineEnd);
            }

            if (1 == 1)//(aCheckDetail.UseLogo)
            {
                LogInfo("Adding logo to image");

                Point logoPoint = new Point(25, 30);
                gr.DrawImage(getLogo(aInvoiceItem), logoPoint);

                LogInfo("Finished adding logo to graphic");
            }

            // fixed elements
            Point payToThePoint = new Point(26, 110);
            Point orderOfPoint = new Point(26, 122);
            Point dollarsPoint = new Point(618, 142);
            Point dollarSignPoint = new Point(513, 96);
            Point memoPoint = new Point(22, 230);
            gr.DrawString("PAY TO THE", new Font(defaultFont, 7), SystemBrushes.WindowText, payToThePoint);
            gr.DrawString("ORDER OF", new Font(defaultFont, 7), SystemBrushes.WindowText, orderOfPoint);
            gr.DrawString("DOLLARS", new Font(defaultFont, 7), SystemBrushes.WindowText, dollarsPoint);
            gr.DrawString("$", new Font(defaultFont, 18, FontStyle.Bold), SystemBrushes.WindowText, dollarSignPoint);
            gr.DrawString("MEMO", new Font(defaultFont, 7), SystemBrushes.WindowText, memoPoint);

            if (aCheckDetail.SignatureLineCount == 2)
            {
                gr.DrawLine(new Pen(Color.Black, 1), new Point(435, 210), new Point(674, 210)); // top signature line
            }
            gr.DrawLine(new Pen(Color.Black, 1), new Point(435, 237), new Point(674, 237)); // bottom signature line

            gr.DrawString(checkNumber, new Font(defaultFont,18,FontStyle.Bold,GraphicsUnit.Pixel), SystemBrushes.WindowText, getCheckNumberPoint(checkNumber));
            Point msgPoint = new Point(550, 165);
            Point bankInfoLine1Point = new Point(373, 32);
            Point bankInfoLine2Point = new Point(373,42);
            Point bankInfoLine3Point = new Point(373, 52);
            Point bankFractionPoint = new Point(373, 62);
            Point checkNumberMICRPoint = new Point(100, 258);
            Point routingNumberMICRPoint = new Point(236, 258);
            Point accountNumberMICRPoint = new Point(420, 258);
            Font font = new Font("Arial", 9, FontStyle.Regular, GraphicsUnit.Pixel);

            // message above signature
            gr.DrawString(msg, font, new SolidBrush(Color.Black), msgPoint, sfCenter);

            gr.DrawString(bankInfoLine1, new Font(defaultFont, 7), SystemBrushes.WindowText, bankInfoLine1Point);
            gr.DrawString(bankInfoLine2, new Font(defaultFont, 7), SystemBrushes.WindowText, bankInfoLine2Point);
            gr.DrawString(bankInfoLine3, new Font(defaultFont, 7), SystemBrushes.WindowText, bankInfoLine3Point);
            gr.DrawString(bankFraction, new Font(defaultFont, 7), SystemBrushes.WindowText, bankFractionPoint);

            const string MICR_SPACER = " ";
            StringBuilder micrLine = new StringBuilder();
            micrLine.Append("C");
            micrLine.Append(sMICRCheckNumber);
            micrLine.Append("C");
            micrLine.Append(MICR_SPACER);
            micrLine.Append("A");
            micrLine.Append(routingNumber);
            micrLine.Append("A");
            micrLine.Append(MICR_SPACER);
            micrLine.Append(accountNumber);
            micrLine.Append("C");

            gr.DrawString(micrLine.ToString(), new Font(aMICRFont, aMICRFontEMSize, FontStyle.Bold), SystemBrushes.WindowText, checkNumberMICRPoint);
            //gr.DrawString("A" + routingNumber + "A", new Font(aMICRFont, aMICRFontEMSize, FontStyle.Bold), SystemBrushes.WindowText, routingNumberMICRPoint);
           // gr.DrawString(accountNumber + "C", new Font(aMICRFont, aMICRFontEMSize, FontStyle.Bold), SystemBrushes.WindowText, accountNumberMICRPoint);

            LogInfo("Started saving graphic object");
            gr.Save();
            LogInfo("Fisished saving graphic object");
            */
            MemoryStream stream = new MemoryStream();
            bmp.Save(stream, ImageFormat.Jpeg);
            LogInfo("Bitmap saved to memorystream");
            byte[] pBuffer = stream.ToArray();
            Response.ContentType = "image/jpeg";

            LogInfo("Buffer size: " + pBuffer.Length);

            Response.OutputStream.Write(pBuffer, 0, pBuffer.Length);

        }

        private Bitmap getLogo(InvoiceItem aInvoiceItem)
        {
            LogInfo("Starting 'getLogo()'");
            object logo = new Bitmap(1,1);
            string key = "";
            string tempFileName = "";

            Dictionary<string, string> d = (Dictionary<string, string>)Session["LogoList"];
            if (d == null)
            {
                d = new Dictionary<string, string>();
            }

            try
            {
                CheckDetail aCheckDetail = aInvoiceItem.CheckDetailObject;
                key = aCheckDetail.RoutingNumber + "-" + aCheckDetail.BankAccountNumber;

                if (d.ContainsKey(key))
                {
                    tempFileName = d[key];
                }

                string logoPath;
                if (!String.IsNullOrEmpty(tempFileName))
                {

                    logoPath = tempFileName; // Path.Combine(tempLogoDir, tempFileName);
                    logo = new Bitmap(Server.MapPath(logoPath));
                }

            }
            catch (System.Exception e)
            {
                LogError("Error in 'getLogo()' " + e.Message);
            }
            LogInfo("Returning logo bitmap");
            return (Bitmap)logo;
        }

        private Point getCheckNumberPoint(string checkNumber)
        {
            Point checkNumberPoint = new Point();
            checkNumberPoint.X = 600 - (int)(checkNumber.Length * 2.5);
            checkNumberPoint.Y = 25;
            return checkNumberPoint;
        }

        private Point getLinePoint(int lineOrder)
        {
            int leftAlignStart = 55;
            int centerAlignStart = 100;
            if (aCheckDetail.UseLogo)
            {
                int logoWidth = aCheckDetail.LogoWidth;
                int offSet = logoWidth - 15;
                leftAlignStart = leftAlignStart + offSet;
                centerAlignStart = centerAlignStart + offSet;
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
