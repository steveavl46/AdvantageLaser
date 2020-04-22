using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Drawing;
using System.Drawing.Imaging;
using System.Drawing.Drawing2D;

namespace CheckProject.PreviewBuilder
{
    public partial class LogoTest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Bitmap bmp = new Bitmap(Server.MapPath("../images/QB-Deposit-Slip.jpg"));
            Bitmap logo = new Bitmap(Server.MapPath("../images/logoAweb.gif"));
            Graphics gr;
            gr = Graphics.FromImage(bmp);
            gr.SmoothingMode = SmoothingMode.AntiAlias;
            FontFamily aMICRFont = new FontFamily("MICR E13B 2.1");
            FontFamily aTextFont = new FontFamily("Arial");

            gr.DrawImage(logo, new Point(0, 0));
            
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
}
