using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Configuration;
using CheckProject.WebUtils;
using AdvLaser.AdvLaserObjects;

namespace CheckProject.PreviewBuilder
{
    public partial class LogoFinder : BasePage
    {
        public string accountNumber;
        public string productkey;
        string routingNumber;
        string sizedSaveAsName;
        const string SIZED_FILE_EXTENSION = ".jpg";
        Invoice aInvoice;
        InvoiceItem aInvoiceItem;
        CheckDetail aCheckDetail;
        const int MAX_WIDTH = 144;
        const int MAX_HEIGHT = 75;

        protected void Page_Load(object sender, EventArgs e)
        {
            accountNumber = Request.Params.Get("AccountNumber");
            routingNumber = Request.Params.Get("RoutingNumber");
            productkey = Request.Params.Get("ProductKey"); 
            aInvoice = GetInvoiceFromSession(true);
            aInvoiceItem = aInvoice.GetInvoiceItem(Convert.ToInt32(productkey), accountNumber);
            if (aInvoiceItem != null)
            {
                aCheckDetail = aInvoiceItem.CheckDetailObject;
            }            

            hdnAccountNumber.Value = accountNumber;
            hdnProductKey.Value = productkey;

//            sizedSaveAsName = routingNumber + "-" + accountNumber + SIZED_FILE_EXTENSION;

            //imgLogo.Visible = (FileUpLoad1.HasFile);
            findLogo();
            /*
            string tempLogoDir = @"..\images\temp_logos";
            string tempFileName = (string)Session["CustomerLogoFile"];
            if (!String.IsNullOrEmpty(tempFileName))
            {
                imgLogo.Visible = true;
                imgLogo.ImageUrl = Path.Combine(tempLogoDir, tempFileName);
            }
            Label1.Text = "";
            */
        }

        protected void btnUpload_OnClick(object sender, EventArgs e)
        {
            string logoDirectory = (string)ConfigurationSettings.AppSettings["logo_directory"];
            if (FileUpLoad1.HasFile)
            {
                Dictionary<string, string> d = (Dictionary<string,string>)Session["LogoList"];
                if (d == null)
                {
                    d = new Dictionary<string,string>();
                }
                
                string tempLogoDir = @"..\images\temp_logos";
                Guid guid = new Guid();
                guid = Guid.NewGuid();
                bool resize = false;
                string fileName = FileUpLoad1.FileName;
                string extension = fileName.Substring(fileName.IndexOf("."), fileName.Length-fileName.IndexOf("."));
                string saveAsName = routingNumber + "-" + accountNumber + "-" + guid  + extension;
                saveAsName = guid + extension;
                string key = routingNumber + "-" + accountNumber;
                if (d.ContainsKey(key))
                {
                    d.Remove(key);
                }
                string logoPath = Path.Combine(logoDirectory, saveAsName);
                FileUpLoad1.SaveAs(logoPath);
                LogInfo("logo saved to: " + logoPath);
                Bitmap logo = new Bitmap(logoPath);

                float horizontalRes = logo.HorizontalResolution;
                float verticalRes = logo.VerticalResolution;

                int height = logo.Height;
                int width = logo.Width;

                int newHeight = 0;
                int newWidth = 0;
                if(width >= height)
                {
                    resize = true;
                    newWidth = MAX_WIDTH;
                    newHeight = 0;
                }
                if (height > width)
                {
                    resize = true;
                    newHeight = MAX_HEIGHT;
                    newWidth = 0;
                }

                Bitmap sizedLogo;
                if (resize)
                {
                    sizedLogo = CreateThumbnail(logo, newWidth, newHeight);                    
                }
                else
                {
                    sizedLogo = new Bitmap(Server.MapPath(@"..\images\logos\" + saveAsName));
                }

                int logoWidth = sizedLogo.Width;
                int logoHeight = sizedLogo.Height;
                aCheckDetail.LogoPath = logoPath;
                aCheckDetail.LogoWidth = logoWidth;
                aCheckDetail.LogoHeight = logoHeight;
                aCheckDetail.UseLogo = true;

                aInvoiceItem.CheckDetailObject = aCheckDetail;
                Session["InvoiceObject"] = aInvoice;

                bool convertToBlackAndWhite = false;
                Bitmap grayScaleBitMap;
                if (convertToBlackAndWhite)
                {
                    grayScaleBitMap = MakeGrayscale3(sizedLogo);
                }
                else
                {
                    grayScaleBitMap = sizedLogo;
                }

                // Get the color of a background pixel.
                Color backColor = grayScaleBitMap.GetPixel(1, 1);

                // Make backColor transparent for myBitmap.
                grayScaleBitMap.MakeTransparent();
                grayScaleBitMap.MakeTransparent(backColor);

                string tempFilePath = Path.Combine(tempLogoDir, guid.ToString());
                tempFilePath += extension;
                d.Add(key, tempFilePath);
                Session["LogoList"] = d;

                sizedSaveAsName = routingNumber + "-" + accountNumber + "-" + guid + SIZED_FILE_EXTENSION;

                // TODO change property to SizedLogoName
                aCheckDetail.SizedLogoName = sizedSaveAsName;

                grayScaleBitMap.Save(Server.MapPath(@"..\images\logos\sized\" + sizedSaveAsName));
                //grayScaleBitMap.Save(Server.MapPath(tempFilePath));
                
                LogInfo("logo saved to: " + sizedSaveAsName);

                //imgLogo.ImageUrl = (sizedSaveAsName);
                //Label1.Text = "File Uploaded: " + saveAsName;
                findLogo();
                //holderClose.Visible = true;
            }
            else
            {
                Label1.Text = "No File Uploaded.";
            }
        }

        public void btnDelete_OnClick(object sender, EventArgs e)
        {
            Session["LogoList"] = null;
            aCheckDetail.LogoHeight = 0;
            aCheckDetail.LogoWidth = 0;
            aCheckDetail.LogoPath = "";
            aCheckDetail.SizedLogoName = "";
            findLogo();
        }

        public void btnDone_OnClick(object sender, EventArgs e)
        {
             holderClose.Visible = true;
        }

        private void findLogo()
        {
            Dictionary<string, string> d = (Dictionary<string, string>)Session["LogoList"];
            if (d == null)
            {
                d = new Dictionary<string, string>();
            }

            imgLogo.Visible = false;
            //Invoice aInvoice = GetInvoiceFromSession(true);
            string key = "";
            string tempFileName = "";

            //InvoiceItem aInvoiceItem = aInvoice.GetInvoiceItem(aProductKey, aAccountNumber);
            if (aInvoiceItem != null)
            {
                //CheckDetail aCheckDetail = aInvoiceItem.CheckDetailObject;
                //key = aCheckDetail.RoutingNumber + "-" + aCheckDetail.BankAccountNumber;

                sizedSaveAsName = aCheckDetail.SizedLogoName;
            }

            string sizedLogoDir = @"..\images\logos\sized\";
            if (d.ContainsKey(key))
            {
                tempFileName = d[key];
            }

            if (!String.IsNullOrEmpty(sizedSaveAsName))
            {
                imgLogo.Visible = true;
                imgLogo.ImageUrl = Path.Combine(sizedLogoDir, sizedSaveAsName);
            }
        }
        

        public Bitmap CreateThumbnail(Bitmap loBMP, int lnWidth, int lnHeight)
        {

            System.Drawing.Bitmap bmpOut = null;

            try
            {
                ImageFormat loFormat = loBMP.RawFormat;

                decimal lnRatio;
                int lnNewWidth = 0;
                int lnNewHeight = 0;

                if (loBMP.Width < lnWidth && loBMP.Height < lnHeight)
                    return loBMP;

                if (loBMP.Width >= loBMP.Height)
                {
                    lnRatio = (decimal)lnWidth / loBMP.Width;
                    lnNewWidth = lnWidth;
                    decimal lnTemp = loBMP.Height * lnRatio;
                    lnNewHeight = (int)lnTemp;
                    if (lnNewHeight > MAX_HEIGHT)
                    {
                        lnRatio = (decimal)MAX_HEIGHT / lnNewHeight;
                        lnNewHeight = MAX_HEIGHT;
                        lnTemp = lnWidth * lnRatio;
                        lnNewWidth = (int)lnTemp;
                    }
                }
                else
                {
                    lnRatio = (decimal)lnHeight / loBMP.Height;
                    lnNewHeight = lnHeight;
                    decimal lnTemp = loBMP.Width * lnRatio;
                    lnNewWidth = (int)lnTemp;
                }


                bmpOut = new Bitmap(lnNewWidth, lnNewHeight);
                Graphics g = Graphics.FromImage(bmpOut);
                g.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.HighQualityBicubic;
                g.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.HighQuality;
                g.CompositingQuality = System.Drawing.Drawing2D.CompositingQuality.HighQuality;
                g.PixelOffsetMode = System.Drawing.Drawing2D.PixelOffsetMode.HighQuality;
                g.FillRectangle(Brushes.White, 0, 0, lnNewWidth, lnNewHeight);
                g.DrawImage(loBMP, 0, 0, lnNewWidth, lnNewHeight);
                loBMP.Dispose();
            }
            catch
            {
                return null;
            }
            return bmpOut;
        }

    }
}
