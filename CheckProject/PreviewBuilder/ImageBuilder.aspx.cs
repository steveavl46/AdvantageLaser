using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
using System.Drawing.Imaging;
using System.Drawing.Text;

public partial class ImageBuilder : System.Web.UI.Page 
{
    string line1;
    string line2;
    string line3;
    string line4;
    string line5;
    string bankname;
    string accountnumber;
    string routingnumber;
    string bankCSZ;
    string bankphone;
    string bankfraction;
    string displayProductTypeKey;
    const int PRODUCT_TYPE_DEPOSITSLIP = 1;
    const int PRODUCT_TYPE_DEPOSITBOOK = 12;
    protected void Page_Load(object sender, EventArgs e)
    {
         line1 = Request.Params.Get("line1");
         line2 = Request.Params.Get("line2");
         line3 = Request.Params.Get("line3");
         line4 = Request.Params.Get("line4");
         line5 = Request.Params.Get("line5");
         bankname = Request.Params.Get("bankname");
         accountnumber = Request.Params.Get("accountnumber");
         routingnumber = Request.Params.Get("routingnumber");
         bankCSZ = Request.Params.Get("bankcsz");
         bankphone = Request.Params.Get("bankphone");
         bankfraction = Request.Params.Get("bankfraction");
         displayProductTypeKey = Request.Params.Get("productTypeKey");

         if (Convert.ToInt64(displayProductTypeKey) == PRODUCT_TYPE_DEPOSITSLIP)
         {
             drawDepositSlip();
         }
         if (Convert.ToInt64(displayProductTypeKey) == PRODUCT_TYPE_DEPOSITBOOK)
         {
             drawDepositBook();
         }
         
    }

    private void drawDepositSlip()
    {
        int aStartHeight = 50;
        int aSpacerHeight = 15;
        int aFontEMSize = 12;
        int aMICRFontEMSize = 12;
        int aLeft = 15;
        int aBankAccountNumberLeft = 230;
        int aBankInfoStartHeight = 210;
        int aMICRHeight = 270;
        Bitmap bmp = new Bitmap(Server.MapPath("../images/QB-Deposit-Slip.jpg"));

        Graphics gr;
        gr = Graphics.FromImage(bmp);
        gr.SmoothingMode = SmoothingMode.AntiAlias;
        FontFamily aMICRFont = new FontFamily("MICR E13B 2.1");
        FontFamily aTextFont = new FontFamily("Arial");

        gr.DrawString(line1, new Font(aTextFont, aFontEMSize), SystemBrushes.WindowText, aLeft, aStartHeight);
        gr.DrawString(line2, new Font(aTextFont, aFontEMSize), SystemBrushes.WindowText, aLeft, aStartHeight + aSpacerHeight);
        gr.DrawString(line3, new Font(aTextFont, aFontEMSize), SystemBrushes.WindowText, aLeft, aStartHeight + (aSpacerHeight * 2));
        gr.DrawString(line4, new Font(aTextFont, aFontEMSize), SystemBrushes.WindowText, aLeft, aStartHeight + (aSpacerHeight * 3));
        gr.DrawString(line5, new Font(aTextFont, aFontEMSize), SystemBrushes.WindowText, aLeft, aStartHeight + (aSpacerHeight * 4));



        gr.DrawString(bankname, new Font(aTextFont, aFontEMSize), SystemBrushes.WindowText, aLeft, aBankInfoStartHeight);
        gr.DrawString(bankCSZ, new Font(aTextFont, aFontEMSize), SystemBrushes.WindowText, aLeft, aBankInfoStartHeight + aSpacerHeight);
        gr.DrawString(bankphone, new Font(aTextFont, aFontEMSize), SystemBrushes.WindowText, aLeft, aBankInfoStartHeight + (aSpacerHeight * 2));
        gr.DrawString(bankfraction, new Font(aTextFont, aFontEMSize), SystemBrushes.WindowText, aLeft, aBankInfoStartHeight + (aSpacerHeight * 3));

        //gr.DrawString("A" + routingnumber + "A", new Font(aMICRFont, aMICRFontEMSize, FontStyle.Bold), SystemBrushes.WindowText, aBankAccountNumberLeft, aMICRHeight);
        gr.DrawString(routingnumber , new Font(aMICRFont, aMICRFontEMSize, FontStyle.Bold), SystemBrushes.WindowText, aBankAccountNumberLeft + 9, aMICRHeight);
        gr.DrawString(accountnumber + "C", new Font(aMICRFont, aMICRFontEMSize, FontStyle.Bold), SystemBrushes.WindowText, aBankAccountNumberLeft + 140, aMICRHeight);

        //gr.DrawString("1234", new Font("MICR E13B 2.1", 12), SystemBrushes.WindowText, 10, 50);
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

    private void drawDepositBook()
    {
        StringFormat sfCenter = new StringFormat();
        sfCenter.Alignment = StringAlignment.Center;
        int aStartHeight = 200;
        int aSpacerHeight = 12;
        int aFontEMSize = 10;
        int aMICRFontEMSize = 12;
        int aLeft = 145;
        int aBankLeft = aLeft + 162;
        int aBankAccountNumberLeft = 230;
        int aBankInfoStartHeight = aStartHeight;
        int aMICRHeight = 270;
        Bitmap bmp = new Bitmap(Server.MapPath("../images/Deposit-Book-4up.jpg"));

        Graphics gr;
        gr = Graphics.FromImage(bmp);
        gr.SmoothingMode = SmoothingMode.AntiAlias;
        FontFamily aMICRFont = new FontFamily("MICR E13B 2.1");
        FontFamily aTextFont = new FontFamily("Arial");

        gr.DrawString(line1, new Font(aTextFont, aFontEMSize, FontStyle.Bold), SystemBrushes.WindowText, aLeft, aStartHeight,sfCenter);
        gr.DrawString(line2, new Font(aTextFont, aFontEMSize), SystemBrushes.WindowText, aLeft, aStartHeight + aSpacerHeight, sfCenter);
        gr.DrawString(line3, new Font(aTextFont, aFontEMSize), SystemBrushes.WindowText, aLeft, aStartHeight + (aSpacerHeight * 2),sfCenter);
        gr.DrawString(line4, new Font(aTextFont, aFontEMSize), SystemBrushes.WindowText, aLeft, aStartHeight + (aSpacerHeight * 3),sfCenter);
        gr.DrawString(line5, new Font(aTextFont, aFontEMSize), SystemBrushes.WindowText, aLeft, aStartHeight + (aSpacerHeight * 4),sfCenter);



        gr.DrawString(bankname, new Font(aTextFont, aFontEMSize-2, FontStyle.Bold), SystemBrushes.WindowText, aBankLeft, aBankInfoStartHeight);
        gr.DrawString(bankCSZ, new Font(aTextFont, aFontEMSize-2), SystemBrushes.WindowText, aBankLeft, aBankInfoStartHeight + aSpacerHeight);
        gr.DrawString(bankphone, new Font(aTextFont, aFontEMSize-2), SystemBrushes.WindowText, aBankLeft, aBankInfoStartHeight + (aSpacerHeight * 2));
        gr.DrawString(bankfraction, new Font(aTextFont, aFontEMSize-2), SystemBrushes.WindowText, aBankLeft, aBankInfoStartHeight + (aSpacerHeight * 3));

        gr.DrawString("A" + routingnumber + "A", new Font(aMICRFont, aMICRFontEMSize, FontStyle.Bold), SystemBrushes.WindowText, aBankAccountNumberLeft, aMICRHeight);
        gr.DrawString(accountnumber + "C", new Font(aMICRFont, aMICRFontEMSize, FontStyle.Bold), SystemBrushes.WindowText, aBankAccountNumberLeft + 140, aMICRHeight);

        //gr.DrawString("1234", new Font("MICR E13B 2.1", 12), SystemBrushes.WindowText, 10, 50);
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

    
}
