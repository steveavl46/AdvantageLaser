using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using AdvLaser.Logging;
using AdvLaser.AdvLaserDataAccess;
using AdvLaser.AdvLaserObjects;
using System.Data.SqlClient;
using System.Data;
using System.Collections;

using System.Drawing;
using System.IO;
using System.Drawing.Drawing2D;
using System.Text;
using System.Drawing.Imaging;
namespace CheckProject.WebUtils
{
    public class BasePage : System.Web.UI.Page
    {
        CheckDetail aCheckDetail;
        StringFormat sfCenter = new StringFormat();
        StringFormat sfLeft = new StringFormat();
        FontFamily aMICRFont = new FontFamily("MICR E13B 2.1");
        FontFamily defaultFont = new FontFamily("Arial");
        float aFontEMSize = 10;
        float addressLineFontEMSize = 9;
        const int LEFT_OF_ADDRESS = 1;
        const int RIGHT_OF_ADDRESS = 2;
        const int BELOW_ADDRESS = 4;
        const int ABOVE_ADDRESS = 3;
        public const int FULL_IMAGE = 1;
        public const int CHECK_ONLY = 2;
        const int QBVOUCHER = 4;
        const int PEACHTREE = 5;
        const int QBSTANDARD = 8;
        const int ADPMANUALPAYROLL = 6;
        const int ELITEACCOUNTSPAYABLE = 9;

        const int PEACHTREE_FULLCHECK_OFFSET = 290;
        const int ADP_MANUALPAYROLL_OFFSET = 600;
        const int ELITEACCOUNTSPAYABLE_OFFSET = 300;

        string connectionString = BaseDataAccess.ConnectionString;

        public string AppBasePath;

        protected override void OnLoad(EventArgs e)
        {
            // System.Reflection.Assembly.GetExecutingAssembly().GetName().Version
            // ... add custom logic here ...
            AppBasePath = (string)ConfigurationSettings.AppSettings["appBasePath"];

            validateIP();

            Label lbl = (Label)FindControl("lblErrorMessage");
            if (lbl != null)
            {
                lbl.Text = "Please correct highlighted fields";
                lbl.CssClass = "errMsg";
            }

            Label lblTestSystem = (Label)FindControl("lblTestSystem");
            if (lblTestSystem != null)
            {
                lblTestSystem.Visible = true;
                if (connectionString.IndexOf("CheckProject;") > 0)
                {
                    lblTestSystem.Visible = false;
                }
            }

            sfCenter.Alignment = StringAlignment.Center;
            sfLeft.Alignment = StringAlignment.Near;
            

            // Be sure to call the base class's OnLoad method!
            base.OnLoad(e);
        }

        protected void Page_PreRender()
        {
            ArrayList list = new ArrayList();
            foreach (BaseValidator valControl in Page.Validators)
            {
                WebControl aControl = (WebControl)Page.FindControl(valControl.ControlToValidate);

                if (!valControl.IsValid)
                {
                    aControl.BackColor = System.Drawing.Color.Yellow;
                    list.Add(aControl.ID);
                }
                else
                {
                    if (!list.Contains(aControl.ID))
                    {
                        aControl.BackColor = System.Drawing.Color.White;
                    }
                }
            }
        }

        private void validateIP()
        {
            string invalidRequestTarget = "../InvalidCharacter.aspx";
            var ipValidationCode = BaseDataAccess.GetIPValidationCode(getComputerIP());
            var aPageName = Request.RawUrl;
            if(ipValidationCode > 0)
            {
                Response.Redirect(invalidRequestTarget+ "?ValidationCode=" + ipValidationCode.ToString());
            }
        }

        void Page_Error(object sender, EventArgs e)
        {
            string target = "../Error.aspx";

            string invalidRequestTarget = "../InvalidCharacter.aspx";

            string aPageName = sender.ToString();
            var isInvalidCharacterError = false;

            var msg = Server.GetLastError().GetBaseException().Message;
            if(msg != null && msg.Contains("Input string was not in a correct format"))
            {
                var ip = getComputerIP();
                BaseDataAccess.BlockIP(ip);
                isInvalidCharacterError  = true;
                LogError("Suspected sql injection detected");
                validateIP();
            }


            if (aPageName.IndexOf("ThankYou") > 1)
            {
                target = "Error.aspx";
                invalidRequestTarget = "InvalidCharacter.aspx";
            }
            if (aPageName.IndexOf("SelectProduct") > 1)
            {
                target = "Error.aspx";
                invalidRequestTarget = "InvalidCharacter.aspx";
            }
            if (isInvalidCharacterError)
            {
                Response.Redirect(invalidRequestTarget);
            }
            else
            {
                Server.Transfer(target);
            }
        }

        public void LogInfo(string msg)
        {

            AdvLaser.Logging.Logger.LogInfo((string)Session["GUID"] + ": " + msg);
        }

        public void LogError(string msg)
        {
            AdvLaser.Logging.Logger.LogError((string)Session["GUID"] + ": " + msg);
        }

        public void LogError(string msg, System.Exception ex)
        {
            LogError(msg + " " + ex.Message);
        }

        public Invoice GetInvoiceFromSession(bool ignoreNullSession)
        {
            Invoice aInvoice = Session["InvoiceObject"] != null ? (Invoice)Session["InvoiceObject"] : null;
            if (aInvoice == null)
            {
                if (ignoreNullSession)
                {
                    aInvoice = new Invoice();
                }
                else
                {
                    Response.Redirect("../NoSession.aspx");
                }
            }
            //LogInfo("Invoice returned from session");
            if (String.IsNullOrEmpty(aInvoice.ComputerIP))
            {
                aInvoice.ComputerIP = getComputerIP();
            }
            return aInvoice;
        }

        public Invoice GetInvoiceFromSession()
        {
            return GetInvoiceFromSession(false);
        }

        public string getComputerIP()
        {
            string  strUserIPAddress = "";

            strUserIPAddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

            if(String.IsNullOrEmpty(strUserIPAddress)){
                strUserIPAddress = Request.ServerVariables["REMOTE_ADDR"];
            }
            return strUserIPAddress;
        }

        public int GetLogoHeightAdjustment()
        {
            int retVal = 0;
            int logoVerticalAdjustment = aCheckDetail.LogoVerticalAdjustment;
            if (logoVerticalAdjustment != Int32.MinValue)
            {
                retVal = logoVerticalAdjustment;
            }            
            return retVal;
        }


        public int GetLogoLeftAdjustment()
        {
            int retVal = 0;
            int logoLeftAdjustment = aCheckDetail.LogoLeftAdjustment;
            if (logoLeftAdjustment!= Int32.MinValue)
            {
                retVal = logoLeftAdjustment;
            }
            return retVal;
        }


        public int GetAddressHeightAdjustment()
        {
            int retVal = 0;
            int addressHeightAdjustment = aCheckDetail.AddressBlockVerticalAdjustment;
            if (addressHeightAdjustment != Int32.MinValue)
            {
                retVal = addressHeightAdjustment;
            }
            return retVal;
        }


        public int GetAddressLeftAdjustment()
        {
            int retVal = 0;
            int addressLeftAdjustment = aCheckDetail.AddressBlockLeftAdjustment;
            if (addressLeftAdjustment != Int32.MinValue)
            {
                retVal = addressLeftAdjustment;
            }
            return retVal;
        }

        public Bitmap GetFullCheckImage(int aProductKey, string aAccountNumber, int checkType)
        {
            
            Product aProduct = ProductDataAccess.GetOne(aProductKey);
            int aProductTypeKey = aProduct.ProductTypeKey;
            switch (aProductTypeKey)
            {
                case QBVOUCHER:
                    return GetFullCheckImage_QBVoucher(aProductKey,aAccountNumber,checkType);
                case PEACHTREE:
                    return GetFullCheckImage_Peachtree(aProductKey, aAccountNumber, checkType);
                case QBSTANDARD:
                    return GetFullCheckImage_QBStandard(aProductKey, aAccountNumber, checkType);
                case ADPMANUALPAYROLL:
                    return GetFullCheckImage_ADPManualPayroll(aProductKey, aAccountNumber, checkType);
                case ELITEACCOUNTSPAYABLE:
                    return GetFullCheckIMage_EliteAccountsPayable(aProductKey, aAccountNumber, checkType);
                default:
                    return new Bitmap(1,1);
            }
        }

        public Bitmap GetFullCheckIMage_EliteAccountsPayable(int aProductKey, string aAccountNumber, int checkType)
        {
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
            if (checkNumber.Length < 6)
            {
                checkNumber = checkNumber.PadLeft(6, '0');
            }
            string sMICRCheckNumber = checkNumber.PadLeft(8, '0');

            string stubLine = line1;

            int checkColorKey = aCheckDetail.CheckColorKey;
            int typeFaceKey = aCheckDetail.TypeFaceKey;

            CheckColor color = CheckColorDataAccess.GetOne(checkColorKey);

            TypeFace typeFace = TypeFaceDataAccess.GetOne(typeFaceKey);

            FontFamily addressFont = new FontFamily(typeFace.Description);




            string imagePath = "";
            int fullCheckOffset = ELITEACCOUNTSPAYABLE_OFFSET;
            int fullCheckMICROffset = ELITEACCOUNTSPAYABLE_OFFSET + 10 ;
            if (checkType == FULL_IMAGE)
            {
                imagePath = color.FullCheckImagePath;
            }
            if (checkType == CHECK_ONLY)
            {
                fullCheckOffset = 3;
                fullCheckMICROffset = 0;
                imagePath = color.ImagePath;
            }


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
                    gr.DrawString(line1, new Font(addressFont, addressLineFontEMSize, FontStyle.Regular), SystemBrushes.WindowText, getLinePoint(ELITEACCOUNTSPAYABLE, 0, checkType), getLineFormat());
                }
                else
                {
                    gr.DrawString(line1, new Font(addressFont, addressLineFontEMSize, FontStyle.Bold), SystemBrushes.WindowText, getLinePoint(ELITEACCOUNTSPAYABLE, 0, checkType), getLineFormat());
                }
                aCheckDetail.AddressBlockLeftPosition = getLinePoint(ELITEACCOUNTSPAYABLE, 0, checkType).X;
                aCheckDetail.AddressBlockVerticalPosition = getLinePoint(ELITEACCOUNTSPAYABLE, 0, checkType).Y;
            }
            else
            {
                aCheckDetail.AddressBlockLeftPosition = getLinePoint(ELITEACCOUNTSPAYABLE, 1, checkType).X;
                aCheckDetail.AddressBlockVerticalPosition = getLinePoint(ELITEACCOUNTSPAYABLE, 1, checkType).Y;
            }
            if (aCheckDetail.Line2FontWeightKey == 1)
            {
                gr.DrawString(line2, new Font(addressFont, addressLineFontEMSize, FontStyle.Regular), SystemBrushes.WindowText, getLinePoint(ELITEACCOUNTSPAYABLE, 1, checkType), getLineFormat());
            }
            else
            {
                gr.DrawString(line2, new Font(addressFont, addressLineFontEMSize, FontStyle.Bold), SystemBrushes.WindowText, getLinePoint(ELITEACCOUNTSPAYABLE, 1, checkType), getLineFormat());
            }
            gr.DrawString(line3, new Font(addressFont, addressLineFontEMSize), SystemBrushes.WindowText, getLinePoint(ELITEACCOUNTSPAYABLE, 2, checkType), getLineFormat());
            gr.DrawString(line4, new Font(addressFont, addressLineFontEMSize), SystemBrushes.WindowText, getLinePoint(ELITEACCOUNTSPAYABLE, 3, checkType), getLineFormat());
            gr.DrawString(line5, new Font(addressFont, addressLineFontEMSize), SystemBrushes.WindowText, getLinePoint(ELITEACCOUNTSPAYABLE, 4, checkType), getLineFormat());

            int left = 26;
            Point stubNamePoint1 = new Point(left, 10);
            Point stubNamePoint2 = new Point(left, 610);

            int lineOffset = 8;
            Point stubLine1Point = new Point(350, 615);
            Point stubLine2Point = new Point(350, 615 + lineOffset);
            Point stubLine3Point = new Point(350, 615 + (lineOffset*2));
            float stubFontSize = 6;

            if (checkType == FULL_IMAGE)
            {
                string stubLine1 = "DETACH AND RETAIN THIS STATEMENT";
                string stubLine2 = "THE ATTACHED CHECK IS IN PAYMENT OF THE ITEMS DESCRIBED BELOW.";
                string stubLine3 = "IF NOT CORRECT PLEASE NOTIFY US PROMPTLY. NO RECEIPT DESIRED.";
                gr.DrawString(stubLine, new Font(addressFont, addressLineFontEMSize), SystemBrushes.WindowText, stubNamePoint1);
                gr.DrawString(stubLine, new Font(addressFont, addressLineFontEMSize), SystemBrushes.WindowText, stubNamePoint2);

                gr.DrawString(stubLine1, new Font(addressFont, stubFontSize, FontStyle.Bold), SystemBrushes.WindowText, stubLine1Point, sfCenter);
                gr.DrawString(stubLine2, new Font(addressFont, stubFontSize, FontStyle.Regular), SystemBrushes.WindowText, stubLine2Point, sfCenter);
                gr.DrawString(stubLine3, new Font(addressFont, stubFontSize, FontStyle.Regular), SystemBrushes.WindowText, stubLine3Point, sfCenter);
            }


            //sf.LineAlignment = StringAlignment.Center;



            Point payToTheOrderLineStart = new Point(85, 130 + ELITEACCOUNTSPAYABLE_OFFSET);
            Point payToTheOrderLineEnd = new Point(515, 130 + ELITEACCOUNTSPAYABLE_OFFSET);
            Point numericLineStart = new Point(524, 130 + ELITEACCOUNTSPAYABLE_OFFSET);
            Point numericLineEnd = new Point(665, 130 + ELITEACCOUNTSPAYABLE_OFFSET);
            Point spelledAmountLineStart = new Point(31, 155 + ELITEACCOUNTSPAYABLE_OFFSET);
            Point spelledAmountLineEnd = new Point(615, 155 + ELITEACCOUNTSPAYABLE_OFFSET);
            Point dateLineStart = new Point(535, 80 + ELITEACCOUNTSPAYABLE_OFFSET);
            Point dateLineEnd = new Point(665, 80 + ELITEACCOUNTSPAYABLE_OFFSET);

            //lines
            if (aCheckDetail.PrintLines)
            {
                // pay to the order line
                gr.DrawLine(new Pen(Color.Black, 1), payToTheOrderLineStart, payToTheOrderLineEnd);
                // numeric amount line
                gr.DrawLine(new Pen(Color.Black, 1), numericLineStart, numericLineEnd);
                // spelled out amount line
                gr.DrawLine(new Pen(Color.Black, 1), spelledAmountLineStart, spelledAmountLineEnd);
                // date line
                gr.DrawLine(new Pen(Color.Black, 1), dateLineStart, dateLineEnd);
            }

            if (aCheckDetail.UseLogo)
            {
                LogInfo("Adding logo to image");

                Point logoPoint = getLogoPoint(ELITEACCOUNTSPAYABLE, checkType);
                aCheckDetail.LogoVerticalPosition = logoPoint.Y;
                aCheckDetail.LogoLeftPosition = logoPoint.X;
                gr.DrawImage(getLogo(aInvoiceItem), logoPoint);
                //gr.DrawString("*", new Font(addressFont, aFontEMSize, FontStyle.Regular), SystemBrushes.WindowText, logoPoint);


                LogInfo("Finished adding logo to graphic");
            }



            // fixed elements
            Point payPoint = new Point(26, 105 + fullCheckOffset);
            
            Point toPoint = new Point(26, 125 + fullCheckOffset);
            Point thePoint = new Point(26, 135 + fullCheckOffset);
            Point orderPoint = new Point(26, 145 + fullCheckOffset); 
            Point ofPoint = new Point(26, 155 + fullCheckOffset);
            Point amountPoint = new Point(600, 135 + fullCheckOffset);
            Point datePoint = new Point(470, 135 + fullCheckOffset);
            Point memoPoint = new Point(22, 230 + fullCheckOffset);
            Point authSigPoint = new Point(510, 236 + fullCheckOffset);
            Point namePoint = new Point(530,160 + fullCheckOffset);
            gr.DrawString("PAY", new Font(defaultFont, 8), SystemBrushes.WindowText, payPoint);
            gr.DrawString("TO", new Font(defaultFont, 7), SystemBrushes.WindowText, toPoint);
            gr.DrawString("THE", new Font(defaultFont, 7), SystemBrushes.WindowText, thePoint);
            gr.DrawString("ORDER", new Font(defaultFont, 7), SystemBrushes.WindowText, orderPoint);
            gr.DrawString("OF", new Font(defaultFont, 7), SystemBrushes.WindowText, ofPoint);
            gr.DrawString("AMOUNT", new Font(defaultFont, 7), SystemBrushes.WindowText, amountPoint);
            gr.DrawString("DATE", new Font(defaultFont, 7), SystemBrushes.WindowText, datePoint);
            //gr.DrawString("MEMO", new Font(defaultFont, 7), SystemBrushes.WindowText, memoPoint);
            //gr.DrawString("AUTHORIZED SIGNATURE", new Font(defaultFont, 5), SystemBrushes.WindowText, authSigPoint);

            // name above signature lines
            //gr.DrawString(line1, new Font(defaultFont, 7), SystemBrushes.WindowText, namePoint,sfCenter);

            if (aCheckDetail.SignatureLineCount == 2)
            {
                gr.DrawLine(new Pen(Color.Black, 1), new Point(435, 210 + fullCheckOffset), new Point(674, 210 + fullCheckOffset)); // top signature line
            }
            gr.DrawLine(new Pen(Color.Black, 1), new Point(435, 233 + fullCheckOffset), new Point(674, 233 + fullCheckOffset)); // bottom signature line

            gr.DrawString(checkNumber, new Font(defaultFont, 18, FontStyle.Regular, GraphicsUnit.Pixel), SystemBrushes.WindowText, getCheckNumberPoint(checkNumber, 1, checkType, ELITEACCOUNTSPAYABLE));
            gr.DrawString(checkNumber, new Font(defaultFont, 18, FontStyle.Regular, GraphicsUnit.Pixel), SystemBrushes.WindowText, getCheckNumberPoint(checkNumber, 2, checkType, ELITEACCOUNTSPAYABLE));
            gr.DrawString(checkNumber, new Font(defaultFont, 18, FontStyle.Regular, GraphicsUnit.Pixel), SystemBrushes.WindowText, getCheckNumberPoint(checkNumber, 3, checkType, ELITEACCOUNTSPAYABLE));


            Point msgPoint = new Point(550, 165);

            Point checkNumberMICRPoint = new Point(100, 258 + fullCheckMICROffset);
            Point routingNumberMICRPoint = new Point(236, 258 + fullCheckMICROffset);
            Point accountNumberMICRPoint = new Point(420, 258 + fullCheckMICROffset);
            Font font = new Font("Arial", 9, FontStyle.Regular, GraphicsUnit.Pixel);

            // message above signature
            if (checkType == FULL_IMAGE)
            {
                msgPoint = new Point(550, 165 + ELITEACCOUNTSPAYABLE_OFFSET);
            }
            gr.DrawString(msg, font, new SolidBrush(Color.Black), msgPoint, sfCenter);

            gr.DrawString(bankInfoLine1, new Font(defaultFont, 7, FontStyle.Bold), SystemBrushes.WindowText, getBankLinePoint(ELITEACCOUNTSPAYABLE, 1, checkType), getLineFormat());
            gr.DrawString(bankInfoLine2, new Font(defaultFont, 7), SystemBrushes.WindowText, getBankLinePoint(ELITEACCOUNTSPAYABLE, 2, checkType), getLineFormat());
            gr.DrawString(bankInfoLine3, new Font(defaultFont, 7), SystemBrushes.WindowText, getBankLinePoint(ELITEACCOUNTSPAYABLE, 3, checkType), getLineFormat());
            gr.DrawString(bankFraction, new Font(defaultFont, 7), SystemBrushes.WindowText, getBankLinePoint(ELITEACCOUNTSPAYABLE, 4, checkType), getLineFormat());

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
            //gr.DrawString(accountNumber + "C", new Font(aMICRFont, aMICRFontEMSize, FontStyle.Bold), SystemBrushes.WindowText, accountNumberMICRPoint);

            LogInfo("Started saving graphic object");
            gr.Save();
            return bmp;
        }
        public Bitmap GetFullCheckImage_Peachtree(int aProductKey, string aAccountNumber, int checkType)
        {
            int fullCheckOffset = 0;
            if (checkType == FULL_IMAGE)
            {
                fullCheckOffset = PEACHTREE_FULLCHECK_OFFSET;
            }
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

            if (checkNumber.Length < 6)
            {
                checkNumber = checkNumber.PadLeft(6, '0');
            }

            string sMICRCheckNumber = checkNumber.PadLeft(8, '0');
            string msg = aCheckDetail.MessageAboveSignature;

            string stubLine;

            if (aCheckDetail.CheckStubLineKey == 2)
            {
                stubLine = line1 + " - " + line2;
            }
            else
            {
                stubLine = line1;
            }

            int checkColorKey = aCheckDetail.CheckColorKey;
            int typeFaceKey = aCheckDetail.TypeFaceKey;

            CheckColor color = CheckColorDataAccess.GetOne(checkColorKey);

            TypeFace typeFace = TypeFaceDataAccess.GetOne(typeFaceKey);

            FontFamily addressFont = new FontFamily(typeFace.Description);

            string imagePath = "";
            if (checkType == FULL_IMAGE)
            {
                imagePath = color.FullCheckImagePath;
            }
            if (checkType == CHECK_ONLY)
            {
                imagePath = color.ImagePath;
            }


            int aMICRFontEMSize = 10;

            Brush defaultTextBrush = SystemBrushes.WindowText;

            
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
                    gr.DrawString(line1, new Font(addressFont, addressLineFontEMSize, FontStyle.Regular), SystemBrushes.WindowText, getLinePoint(PEACHTREE, 0, checkType), getLineFormat());
                }
                else
                {
                    gr.DrawString(line1, new Font(addressFont, addressLineFontEMSize, FontStyle.Bold), SystemBrushes.WindowText, getLinePoint(PEACHTREE, 0, checkType), getLineFormat());
                }
                aCheckDetail.AddressBlockLeftPosition = getLinePoint(PEACHTREE, 0, checkType).X;
                aCheckDetail.AddressBlockVerticalPosition = getLinePoint(PEACHTREE, 0, checkType).Y;
            }
            else
            {
                aCheckDetail.AddressBlockLeftPosition = getLinePoint(PEACHTREE, 1, checkType).X;
                aCheckDetail.AddressBlockVerticalPosition = getLinePoint(PEACHTREE, 1, checkType).Y;
            }
            if (aCheckDetail.Line2FontWeightKey == 1)
            {
                gr.DrawString(line2, new Font(addressFont, addressLineFontEMSize, FontStyle.Regular), SystemBrushes.WindowText, getLinePoint(PEACHTREE, 1, checkType), getLineFormat());
            }
            else
            {
                gr.DrawString(line2, new Font(addressFont, addressLineFontEMSize, FontStyle.Bold), SystemBrushes.WindowText, getLinePoint(PEACHTREE, 1, checkType), getLineFormat());
            }
            gr.DrawString(line3, new Font(addressFont, addressLineFontEMSize), SystemBrushes.WindowText, getLinePoint(PEACHTREE, 2, checkType), getLineFormat());
            gr.DrawString(line4, new Font(addressFont, addressLineFontEMSize), SystemBrushes.WindowText, getLinePoint(PEACHTREE, 3, checkType), getLineFormat());
            gr.DrawString(line5, new Font(addressFont, addressLineFontEMSize), SystemBrushes.WindowText, getLinePoint(PEACHTREE, 4, checkType), getLineFormat());

            if (checkType == FULL_IMAGE)
            {
                gr.DrawString(stubLine, new Font(addressFont, addressLineFontEMSize), SystemBrushes.WindowText, new Point(40,40));
                gr.DrawString(stubLine, new Font(addressFont, addressLineFontEMSize), SystemBrushes.WindowText, new Point(40,600));
            }


            if (aCheckDetail.UseLogo)
            {
                LogInfo("Adding logo to image");

                Point logoPoint = getLogoPoint(PEACHTREE, checkType);
                aCheckDetail.LogoVerticalPosition = logoPoint.Y;
                aCheckDetail.LogoLeftPosition = logoPoint.X;
                gr.DrawImage(getLogo(aInvoiceItem), logoPoint);
                //gr.DrawString("*", new Font(addressFont, addressLineFontEMSize, FontStyle.Regular), SystemBrushes.WindowText, logoPoint);


                LogInfo("Finished adding logo to graphic");
            }

            // fixed elements
            Point payPoint;
            Point toThePoint;
            Point orderPoint;
            Point ofPoint;
            Point checkNoPoint;
            Point datePoint;
            Point amountPoint;
            
            payPoint = new Point(26, 110 + fullCheckOffset);
            toThePoint = new Point(26, 122 + fullCheckOffset);
            orderPoint = new Point(26, 134 + fullCheckOffset);
            ofPoint = new Point(26, 146 + fullCheckOffset);

            checkNoPoint = new Point(335, 90 + fullCheckOffset);
            datePoint = new Point(480, 90 + fullCheckOffset);
            amountPoint = new Point(610, 90 + fullCheckOffset);

            gr.DrawString("PAY", new Font(defaultFont, 7), SystemBrushes.WindowText, payPoint);
            gr.DrawString("TO THE", new Font(defaultFont, 7), SystemBrushes.WindowText, toThePoint);
            gr.DrawString("ORDER", new Font(defaultFont, 7), SystemBrushes.WindowText, orderPoint);
            gr.DrawString("OF", new Font(defaultFont, 7), SystemBrushes.WindowText, ofPoint);

            if (aCheckDetail.ShowCheckNo)
            {
                gr.DrawString("CHECK NO.", new Font(defaultFont, 7), SystemBrushes.WindowText, checkNoPoint);
            }
            gr.DrawString("DATE", new Font(defaultFont, 7), SystemBrushes.WindowText, datePoint);
            gr.DrawString("AMOUNT", new Font(defaultFont, 7), SystemBrushes.WindowText, amountPoint);

            if (aCheckDetail.SignatureLineCount == 2)
            {
                gr.DrawLine(new Pen(Color.Black, 1), new Point(435, 210 + fullCheckOffset), new Point(674, 210 + fullCheckOffset)); // top signature line
            }
            gr.DrawLine(new Pen(Color.Black, 1), new Point(435, 237 + fullCheckOffset), new Point(674, 237 + fullCheckOffset)); // bottom signature line

            StringFormat checkNumberFormat = new StringFormat();
            checkNumberFormat.Alignment = StringAlignment.Far;

            //gr.DrawString(checkNumber, new Font(defaultFont, 18, FontStyle.Regular, GraphicsUnit.Pixel), SystemBrushes.WindowText, getCheckNumberPoint(checkNumber, 1), checkNumberFormat);
            gr.DrawString(checkNumber, new Font(defaultFont, 18, FontStyle.Regular, GraphicsUnit.Pixel), SystemBrushes.WindowText, new Point(658,25), checkNumberFormat);
            gr.DrawString(checkNumber, new Font(defaultFont, 18, FontStyle.Regular, GraphicsUnit.Pixel), SystemBrushes.WindowText, new Point(658, 310), checkNumberFormat);
            gr.DrawString(checkNumber, new Font(defaultFont, 18, FontStyle.Regular, GraphicsUnit.Pixel), SystemBrushes.WindowText, new Point(658, 600), checkNumberFormat);


            Point msgPoint = new Point(550, 165 + fullCheckOffset);

            Point checkNumberMICRPoint = new Point(100, 258 + fullCheckOffset);
            Point routingNumberMICRPoint = new Point(236, 258 + fullCheckOffset);
            Point accountNumberMICRPoint = new Point(420, 258 + fullCheckOffset);
            Font font = new Font("Arial", 9, FontStyle.Regular, GraphicsUnit.Pixel);

            // message above signature
            gr.DrawString(msg, font, new SolidBrush(Color.Black), msgPoint, sfCenter);

            gr.DrawString(bankInfoLine1, new Font(defaultFont, 7,FontStyle.Bold), SystemBrushes.WindowText, getBankLinePoint(PEACHTREE,1,checkType), getLineFormat());
            gr.DrawString(bankInfoLine2, new Font(defaultFont, 7), SystemBrushes.WindowText, getBankLinePoint(PEACHTREE, 2, checkType), getLineFormat());
            gr.DrawString(bankInfoLine3, new Font(defaultFont, 7), SystemBrushes.WindowText, getBankLinePoint(PEACHTREE, 3, checkType), getLineFormat());
            gr.DrawString(bankFraction, new Font(defaultFont, 7), SystemBrushes.WindowText, getBankLinePoint(PEACHTREE, 4, checkType), getLineFormat());

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

            LogInfo("Started saving graphic object");
            gr.Save();
            return bmp;
        }
        public Bitmap GetFullCheckImage_QBVoucher(int aProductKey, string aAccountNumber, int checkType)
        {
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
            //if (checkNumber.Length < 6)
            //{
            //    checkNumber = checkNumber.PadLeft(6, '0');
            //}
            string sMICRCheckNumber = checkNumber.PadLeft(8, '0');

            string stubLine;

            if (aCheckDetail.CheckStubLineKey == 2)
            {
                stubLine = line1 + " - " + line2;
            }
            else
            {
                stubLine = line1;
            }

            int checkColorKey = aCheckDetail.CheckColorKey;
            int typeFaceKey = aCheckDetail.TypeFaceKey;

            CheckColor color = CheckColorDataAccess.GetOne(checkColorKey);

            TypeFace typeFace = TypeFaceDataAccess.GetOne(typeFaceKey);

            FontFamily addressFont = new FontFamily(typeFace.Description);
            



            string imagePath = "";
            if (checkType == FULL_IMAGE)
            {
                imagePath = color.FullCheckImagePath;
            }
            if (checkType == CHECK_ONLY)
            {
                imagePath = color.ImagePath;
            }

            if (aCheckDetail.PrintPaymentRecordOnStub && checkType == FULL_IMAGE)
            {
                if (imagePath.IndexOf("QBVoucher") > 0)
                {
                    imagePath = imagePath.Replace("QBVoucher","QBVoucher/recordonly");
                }
            }

            
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
                    gr.DrawString(line1, new Font(addressFont, addressLineFontEMSize, FontStyle.Regular), SystemBrushes.WindowText, getLinePoint(QBVOUCHER, 0, checkType), getLineFormat());
                }
                else
                {
                    gr.DrawString(line1, new Font(addressFont, addressLineFontEMSize, FontStyle.Bold), SystemBrushes.WindowText, getLinePoint(QBVOUCHER, 0, checkType), getLineFormat());
                }
                aCheckDetail.AddressBlockLeftPosition = getLinePoint(QBVOUCHER,0,checkType).X;
                aCheckDetail.AddressBlockVerticalPosition = getLinePoint(QBVOUCHER, 0, checkType).Y;
            }
            else
            {
                aCheckDetail.AddressBlockLeftPosition = getLinePoint(QBVOUCHER, 1, checkType).X;
                aCheckDetail.AddressBlockVerticalPosition = getLinePoint(QBVOUCHER, 1, checkType).Y;
            }
            if (aCheckDetail.Line2FontWeightKey == 1)
            {
                gr.DrawString(line2, new Font(addressFont, addressLineFontEMSize, FontStyle.Regular), SystemBrushes.WindowText, getLinePoint(QBVOUCHER, 1, checkType), getLineFormat());
            }
            else
            {
                gr.DrawString(line2, new Font(addressFont, addressLineFontEMSize, FontStyle.Bold), SystemBrushes.WindowText, getLinePoint(QBVOUCHER, 1, checkType), getLineFormat());
            }
            gr.DrawString(line3, new Font(addressFont, addressLineFontEMSize), SystemBrushes.WindowText, getLinePoint(QBVOUCHER, 2, checkType), getLineFormat());
            gr.DrawString(line4, new Font(addressFont, addressLineFontEMSize), SystemBrushes.WindowText, getLinePoint(QBVOUCHER, 3, checkType), getLineFormat());
            gr.DrawString(line5, new Font(addressFont, addressLineFontEMSize), SystemBrushes.WindowText, getLinePoint(QBVOUCHER, 4, checkType), getLineFormat());

            if (checkType == FULL_IMAGE)
            {
                gr.DrawString(stubLine, new Font(addressFont, addressLineFontEMSize), SystemBrushes.WindowText, getStubLinePoint(1));
                gr.DrawString(stubLine, new Font(addressFont, addressLineFontEMSize), SystemBrushes.WindowText, getStubLinePoint(2));
            }


            //sf.LineAlignment = StringAlignment.Center;

            Point payToTheOrderLineStart = new Point(85, 130);
            Point payToTheOrderLineEnd = new Point(515, 130);
            Point numericLineStart = new Point(524, 130);
            Point numericLineEnd = new Point(665, 130);
            Point spelledAmountLineStart = new Point(31, 155);
            Point spelledAmountLineEnd = new Point(615, 155);
            Point dateLineStart = new Point(535, 80);
            Point dateLineEnd = new Point(665, 80);

            //lines
            if (aCheckDetail.PrintLines)
            {
                // pay to the order line
                gr.DrawLine(new Pen(Color.Black, 1), payToTheOrderLineStart, payToTheOrderLineEnd);
                // numeric amount line
                gr.DrawLine(new Pen(Color.Black, 1), numericLineStart, numericLineEnd);
                // spelled out amount line
                gr.DrawLine(new Pen(Color.Black, 1), spelledAmountLineStart, spelledAmountLineEnd);
                // date line
                gr.DrawLine(new Pen(Color.Black, 1), dateLineStart, dateLineEnd);
            }

            if (aCheckDetail.UseLogo)
            {
                LogInfo("Adding logo to image");

                Point logoPoint = getLogoPoint(QBVOUCHER, checkType);
                aCheckDetail.LogoVerticalPosition = logoPoint.Y;
                aCheckDetail.LogoLeftPosition = logoPoint.X;
                gr.DrawImage(getLogo(aInvoiceItem), logoPoint);
                //gr.DrawString("*", new Font(addressFont, aFontEMSize, FontStyle.Regular), SystemBrushes.WindowText, logoPoint);


                LogInfo("Finished adding logo to graphic");
            }

            

            // fixed elements
            Point payToThePoint = new Point(26, 110);
            Point orderOfPoint = new Point(26, 122);
            Point dollarsPoint = new Point(618, 142);
            Point dollarSignPoint = new Point(513, 110);
            Point memoPoint = new Point(22, 230);
            Point authSigPoint = new Point(510,236);
            gr.DrawString("PAY TO THE", new Font(defaultFont, 7), SystemBrushes.WindowText, payToThePoint);
            gr.DrawString("ORDER OF", new Font(defaultFont, 7), SystemBrushes.WindowText, orderOfPoint);
            gr.DrawString("DOLLARS", new Font(defaultFont, 7), SystemBrushes.WindowText, dollarsPoint);
            gr.DrawString("$", new Font(defaultFont, 12, FontStyle.Bold), SystemBrushes.WindowText, dollarSignPoint);
            gr.DrawString("MEMO", new Font(defaultFont, 7), SystemBrushes.WindowText, memoPoint);
            gr.DrawString("AUTHORIZED SIGNATURE", new Font(defaultFont, 5), SystemBrushes.WindowText, authSigPoint);

            if (aCheckDetail.SignatureLineCount == 2)
            {
                gr.DrawLine(new Pen(Color.Black, 1), new Point(435, 210), new Point(674, 210)); // top signature line
            }
            gr.DrawLine(new Pen(Color.Black, 1), new Point(435, 233), new Point(674, 233)); // bottom signature line

            gr.DrawString(checkNumber, new Font(defaultFont, 18, FontStyle.Regular, GraphicsUnit.Pixel), SystemBrushes.WindowText, getCheckNumberPoint(checkNumber, 1));
            gr.DrawString(checkNumber, new Font(defaultFont, 18, FontStyle.Regular, GraphicsUnit.Pixel), SystemBrushes.WindowText, getCheckNumberPoint(checkNumber, 2));
            gr.DrawString(checkNumber, new Font(defaultFont, 18, FontStyle.Regular, GraphicsUnit.Pixel), SystemBrushes.WindowText, getCheckNumberPoint(checkNumber, 3));


            Point msgPoint = new Point(550, 165);
            
            Point checkNumberMICRPoint = new Point(100, 258);
            Point routingNumberMICRPoint = new Point(236, 258);
            Point accountNumberMICRPoint = new Point(420, 258);
            Font font = new Font("Arial", 9, FontStyle.Regular, GraphicsUnit.Pixel);

            // message above signature
            gr.DrawString(msg, font, new SolidBrush(Color.Black), msgPoint, sfCenter);

            gr.DrawString(bankInfoLine1, new Font(defaultFont, 7, FontStyle.Bold), SystemBrushes.WindowText, getBankLinePoint(QBVOUCHER, 1, checkType), getLineFormat());
            gr.DrawString(bankInfoLine2, new Font(defaultFont, 7), SystemBrushes.WindowText, getBankLinePoint(QBVOUCHER, 2, checkType), getLineFormat());
            gr.DrawString(bankInfoLine3, new Font(defaultFont, 7), SystemBrushes.WindowText, getBankLinePoint(QBVOUCHER, 3, checkType), getLineFormat());
            gr.DrawString(bankFraction, new Font(defaultFont, 7), SystemBrushes.WindowText, getBankLinePoint(QBVOUCHER, 4, checkType), getLineFormat());

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
            //gr.DrawString(accountNumber + "C", new Font(aMICRFont, aMICRFontEMSize, FontStyle.Bold), SystemBrushes.WindowText, accountNumberMICRPoint);

            LogInfo("Started saving graphic object");
            gr.Save();
            return bmp;
        }

        public Bitmap GetFullCheckImage_QBStandard(int aProductKey, string aAccountNumber, int checkType)
        {
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
            int iCheckNumber = Convert.ToInt32(checkNumber);
            //if (checkNumber.Length < 6)
            //{
            //    checkNumber = checkNumber.PadLeft(6, '0');
            //}
            string sMICRCheckNumber = checkNumber.PadLeft(8, '0');

            /*
            string stubLine;

            if (aCheckDetail.CheckStubLineKey == 2)
            {
                stubLine = line1 + " - " + line2;
            }
            else
            {
                stubLine = line1;
            }
            */

            int checkColorKey = aCheckDetail.CheckColorKey;
            int typeFaceKey = aCheckDetail.TypeFaceKey;

            CheckColor color = CheckColorDataAccess.GetOne(checkColorKey);

            TypeFace typeFace = TypeFaceDataAccess.GetOne(typeFaceKey);

            FontFamily addressFont = new FontFamily(typeFace.Description);




            string imagePath = "";
            if (checkType == FULL_IMAGE)
            {
                imagePath = color.FullCheckImagePath;
            }
            if (checkType == CHECK_ONLY)
            {
                imagePath = color.ImagePath;
            }

            if (aCheckDetail.PrintPaymentRecordOnStub && checkType == FULL_IMAGE)
            {
                if (imagePath.IndexOf("QBVoucher") > 0)
                {
                    imagePath = imagePath.Replace("QBVoucher", "QBVoucher/recordonly");
                }
            }


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
                    gr.DrawString(line1, new Font(addressFont, addressLineFontEMSize, FontStyle.Regular), SystemBrushes.WindowText, getLinePoint(QBVOUCHER, 0, checkType), getLineFormat());
                }
                else
                {
                    gr.DrawString(line1, new Font(addressFont, addressLineFontEMSize, FontStyle.Bold), SystemBrushes.WindowText, getLinePoint(QBVOUCHER, 0, checkType), getLineFormat());
                }
                aCheckDetail.AddressBlockLeftPosition = getLinePoint(QBVOUCHER, 0, checkType).X;
                aCheckDetail.AddressBlockVerticalPosition = getLinePoint(QBVOUCHER, 0, checkType).Y;
            }
            else
            {
                aCheckDetail.AddressBlockLeftPosition = getLinePoint(QBVOUCHER, 1, checkType).X;
                aCheckDetail.AddressBlockVerticalPosition = getLinePoint(QBVOUCHER, 1, checkType).Y;
            }
            if (aCheckDetail.Line2FontWeightKey == 1)
            {
                gr.DrawString(line2, new Font(addressFont, addressLineFontEMSize, FontStyle.Regular), SystemBrushes.WindowText, getLinePoint(QBVOUCHER, 1, checkType), getLineFormat());
            }
            else
            {
                gr.DrawString(line2, new Font(addressFont, addressLineFontEMSize, FontStyle.Bold), SystemBrushes.WindowText, getLinePoint(QBVOUCHER, 1, checkType), getLineFormat());
            }
            gr.DrawString(line3, new Font(addressFont, addressLineFontEMSize), SystemBrushes.WindowText, getLinePoint(QBVOUCHER, 2, checkType), getLineFormat());
            gr.DrawString(line4, new Font(addressFont, addressLineFontEMSize), SystemBrushes.WindowText, getLinePoint(QBVOUCHER, 3, checkType), getLineFormat());
            gr.DrawString(line5, new Font(addressFont, addressLineFontEMSize), SystemBrushes.WindowText, getLinePoint(QBVOUCHER, 4, checkType), getLineFormat());

            if (checkType == FULL_IMAGE)
            {
                if (aCheckDetail.Line1FontWeightKey == 1)
                {
                    gr.DrawString(line1, new Font(addressFont, addressLineFontEMSize, FontStyle.Regular), SystemBrushes.WindowText, getLinePoint(QBVOUCHER, 0, checkType).X, getLinePoint(QBVOUCHER, 0, checkType).Y + getHeightOffset(1), getLineFormat());
                    gr.DrawString(line1, new Font(addressFont, addressLineFontEMSize, FontStyle.Regular), SystemBrushes.WindowText, getLinePoint(QBVOUCHER, 0, checkType).X, getLinePoint(QBVOUCHER, 0, checkType).Y + getHeightOffset(2), getLineFormat());
                }
                else
                {
                    gr.DrawString(line1, new Font(addressFont, addressLineFontEMSize, FontStyle.Bold), SystemBrushes.WindowText, getLinePoint(QBVOUCHER, 0, checkType).X, getLinePoint(QBVOUCHER, 0, checkType).Y + getHeightOffset(1), getLineFormat());
                    gr.DrawString(line1, new Font(addressFont, addressLineFontEMSize, FontStyle.Bold), SystemBrushes.WindowText, getLinePoint(QBVOUCHER, 0, checkType).X, getLinePoint(QBVOUCHER, 0, checkType).Y + getHeightOffset(2), getLineFormat());
                }
                if (aCheckDetail.Line2FontWeightKey == 1)
                {
                    gr.DrawString(line2, new Font(addressFont, addressLineFontEMSize, FontStyle.Regular), SystemBrushes.WindowText, getLinePoint(QBVOUCHER, 1, checkType).X, getLinePoint(QBVOUCHER, 1, checkType).Y + getHeightOffset(1), getLineFormat());
                    gr.DrawString(line2, new Font(addressFont, addressLineFontEMSize, FontStyle.Regular), SystemBrushes.WindowText, getLinePoint(QBVOUCHER, 1, checkType).X, getLinePoint(QBVOUCHER, 1, checkType).Y + getHeightOffset(2), getLineFormat());
                }
                else
                {
                    gr.DrawString(line2, new Font(addressFont, addressLineFontEMSize, FontStyle.Bold), SystemBrushes.WindowText, getLinePoint(QBVOUCHER, 1, checkType).X, getLinePoint(QBVOUCHER, 1, checkType).Y + getHeightOffset(1), getLineFormat());
                    gr.DrawString(line2, new Font(addressFont, addressLineFontEMSize, FontStyle.Bold), SystemBrushes.WindowText, getLinePoint(QBVOUCHER, 1, checkType).X, getLinePoint(QBVOUCHER, 1, checkType).Y + getHeightOffset(2), getLineFormat());
                }
                gr.DrawString(line3, new Font(addressFont, addressLineFontEMSize), SystemBrushes.WindowText, getLinePoint(QBVOUCHER, 2, checkType).X, getLinePoint(QBVOUCHER, 2, checkType).Y + getHeightOffset(1), getLineFormat());
                gr.DrawString(line3, new Font(addressFont, addressLineFontEMSize), SystemBrushes.WindowText, getLinePoint(QBVOUCHER, 2, checkType).X, getLinePoint(QBVOUCHER, 2, checkType).Y + getHeightOffset(2), getLineFormat());
                gr.DrawString(line4, new Font(addressFont, addressLineFontEMSize), SystemBrushes.WindowText, getLinePoint(QBVOUCHER, 3, checkType).X, getLinePoint(QBVOUCHER, 3, checkType).Y + getHeightOffset(1), getLineFormat());
                gr.DrawString(line4, new Font(addressFont, addressLineFontEMSize), SystemBrushes.WindowText, getLinePoint(QBVOUCHER, 3, checkType).X, getLinePoint(QBVOUCHER, 3, checkType).Y + getHeightOffset(2), getLineFormat());
                gr.DrawString(line5, new Font(addressFont, addressLineFontEMSize), SystemBrushes.WindowText, getLinePoint(QBVOUCHER, 4, checkType).X, getLinePoint(QBVOUCHER, 4, checkType).Y + getHeightOffset(1), getLineFormat());
                gr.DrawString(line5, new Font(addressFont, addressLineFontEMSize), SystemBrushes.WindowText, getLinePoint(QBVOUCHER, 4, checkType).X, getLinePoint(QBVOUCHER, 4, checkType).Y + getHeightOffset(2), getLineFormat());
            }


            //sf.LineAlignment = StringAlignment.Center;

            Point payToTheOrderLineStart = new Point(85, 130);
            Point payToTheOrderLineEnd = new Point(515, 130);
            Point numericLineStart = new Point(524, 130);
            Point numericLineEnd = new Point(665, 130);
            Point spelledAmountLineStart = new Point(31, 155);
            Point spelledAmountLineEnd = new Point(615, 155);
            Point dateLineStart = new Point(535, 80);
            Point dateLineEnd = new Point(665, 80);

            //lines
            if (aCheckDetail.PrintLines)
            {
                // pay to the order line
                gr.DrawLine(new Pen(Color.Black, 1), payToTheOrderLineStart, payToTheOrderLineEnd);
                // numeric amount line
                gr.DrawLine(new Pen(Color.Black, 1), numericLineStart, numericLineEnd);
                // spelled out amount line
                gr.DrawLine(new Pen(Color.Black, 1), spelledAmountLineStart, spelledAmountLineEnd);
                // date line
                gr.DrawLine(new Pen(Color.Black, 1), dateLineStart, dateLineEnd);
            }
            if (checkType == FULL_IMAGE)
            {
                payToTheOrderLineStart = new Point(85, 130 + getHeightOffset(1));
                payToTheOrderLineEnd = new Point(515, 130 + getHeightOffset(1));
                numericLineStart = new Point(524, 130 + getHeightOffset(1));
                numericLineEnd = new Point(665, 130 + getHeightOffset(1));
                spelledAmountLineStart = new Point(31, 155 + getHeightOffset(1));
                spelledAmountLineEnd = new Point(615, 155 + getHeightOffset(1));
                dateLineStart = new Point(535, 80 + getHeightOffset(1));
                dateLineEnd = new Point(665, 80 + getHeightOffset(1));
                if (aCheckDetail.PrintLines)
                {
                    gr.DrawLine(new Pen(Color.Black, 1), payToTheOrderLineStart, payToTheOrderLineEnd);
                    // numeric amount line
                    gr.DrawLine(new Pen(Color.Black, 1), numericLineStart, numericLineEnd);
                    // spelled out amount line
                    gr.DrawLine(new Pen(Color.Black, 1), spelledAmountLineStart, spelledAmountLineEnd);
                    // date line
                    gr.DrawLine(new Pen(Color.Black, 1), dateLineStart, dateLineEnd);
                }
                payToTheOrderLineStart = new Point(85, 130 + getHeightOffset(2));
                payToTheOrderLineEnd = new Point(515, 130 + getHeightOffset(2));
                numericLineStart = new Point(524, 130 + getHeightOffset(2));
                numericLineEnd = new Point(665, 130 + getHeightOffset(2));
                spelledAmountLineStart = new Point(31, 155 + getHeightOffset(2));
                spelledAmountLineEnd = new Point(615, 155 + getHeightOffset(2));
                dateLineStart = new Point(535, 80 + getHeightOffset(2));
                dateLineEnd = new Point(665, 80 + getHeightOffset(2));
                if (aCheckDetail.PrintLines)
                {
                    gr.DrawLine(new Pen(Color.Black, 1), payToTheOrderLineStart, payToTheOrderLineEnd);
                    // numeric amount line
                    gr.DrawLine(new Pen(Color.Black, 1), numericLineStart, numericLineEnd);
                    // spelled out amount line
                    gr.DrawLine(new Pen(Color.Black, 1), spelledAmountLineStart, spelledAmountLineEnd);
                    // date line
                    gr.DrawLine(new Pen(Color.Black, 1), dateLineStart, dateLineEnd);
                }
            }

            if (aCheckDetail.UseLogo)
            {
                LogInfo("Adding logo to image");

                Point logoPoint = getLogoPoint(QBVOUCHER, checkType);
                aCheckDetail.LogoVerticalPosition = logoPoint.Y;
                aCheckDetail.LogoLeftPosition = logoPoint.X;
                gr.DrawImage(getLogo(aInvoiceItem), logoPoint);
                //gr.DrawString("*", new Font(addressFont, aFontEMSize, FontStyle.Regular), SystemBrushes.WindowText, logoPoint);


                if (checkType == FULL_IMAGE)
                {
                    gr.DrawImage(getLogo(aInvoiceItem), logoPoint.X, logoPoint.Y + getHeightOffset(1));
                    gr.DrawImage(getLogo(aInvoiceItem), logoPoint.X, logoPoint.Y + getHeightOffset(2));
                }
            }
            




            // fixed elements
            Point payToThePoint = new Point(26, 110);
            Point orderOfPoint = new Point(26, 122);
            Point dollarsPoint = new Point(618, 142);
            Point dollarSignPoint = new Point(513, 110);
            Point memoPoint = new Point(22, 230);
            Point authSigPoint = new Point(510, 231);
            gr.DrawString("PAY TO THE", new Font(defaultFont, 7), SystemBrushes.WindowText, payToThePoint);
            gr.DrawString("ORDER OF", new Font(defaultFont, 7), SystemBrushes.WindowText, orderOfPoint);
            gr.DrawString("DOLLARS", new Font(defaultFont, 7), SystemBrushes.WindowText, dollarsPoint);
            gr.DrawString("$", new Font(defaultFont, 12, FontStyle.Bold), SystemBrushes.WindowText, dollarSignPoint);
            gr.DrawString("MEMO", new Font(defaultFont, 7), SystemBrushes.WindowText, memoPoint);
            gr.DrawString("AUTHORIZED SIGNATURE", new Font(defaultFont, 5), SystemBrushes.WindowText, authSigPoint);
            if (checkType == FULL_IMAGE)
            {
                gr.DrawString("PAY TO THE", new Font(defaultFont, 7), SystemBrushes.WindowText, payToThePoint.X, payToThePoint.Y + getHeightOffset(1));
                gr.DrawString("ORDER OF", new Font(defaultFont, 7), SystemBrushes.WindowText, orderOfPoint.X, orderOfPoint.Y + getHeightOffset(1));
                gr.DrawString("DOLLARS", new Font(defaultFont, 7), SystemBrushes.WindowText, dollarsPoint.X, dollarsPoint.Y + getHeightOffset(1));
                gr.DrawString("$", new Font(defaultFont, 12, FontStyle.Bold), SystemBrushes.WindowText, dollarSignPoint.X, dollarSignPoint.Y + getHeightOffset(1));
                gr.DrawString("MEMO", new Font(defaultFont, 7), SystemBrushes.WindowText, memoPoint.X, memoPoint.Y + getHeightOffset(1));
                gr.DrawString("AUTHORIZED SIGNATURE", new Font(defaultFont, 5), SystemBrushes.WindowText, authSigPoint.X, authSigPoint.Y + getHeightOffset(1));

                gr.DrawString("PAY TO THE", new Font(defaultFont, 7), SystemBrushes.WindowText, payToThePoint.X, payToThePoint.Y + getHeightOffset(2));
                gr.DrawString("ORDER OF", new Font(defaultFont, 7), SystemBrushes.WindowText, orderOfPoint.X, orderOfPoint.Y + getHeightOffset(2));
                gr.DrawString("DOLLARS", new Font(defaultFont, 7), SystemBrushes.WindowText, dollarsPoint.X, dollarsPoint.Y + getHeightOffset(2));
                gr.DrawString("$", new Font(defaultFont, 12, FontStyle.Bold), SystemBrushes.WindowText, dollarSignPoint.X, dollarSignPoint.Y + getHeightOffset(2));
                gr.DrawString("MEMO", new Font(defaultFont, 7), SystemBrushes.WindowText, memoPoint.X, memoPoint.Y + getHeightOffset(2));
                gr.DrawString("AUTHORIZED SIGNATURE", new Font(defaultFont, 5), SystemBrushes.WindowText, authSigPoint.X, authSigPoint.Y + getHeightOffset(2));
            }

            if (aCheckDetail.SignatureLineCount == 2)
            {
                gr.DrawLine(new Pen(Color.Black, 1), new Point(435, 200), new Point(674, 200)); // top signature line
            }
            gr.DrawLine(new Pen(Color.Black, 1), new Point(435, 230), new Point(674, 230)); // bottom signature line
            if (checkType == FULL_IMAGE)
            {
                gr.DrawLine(new Pen(Color.Black, 1), new Point(435, 230 + getHeightOffset(1)), new Point(674, 230 + getHeightOffset(1))); // bottom signature line
                gr.DrawLine(new Pen(Color.Black, 1), new Point(435, 230 + getHeightOffset(2)), new Point(674, 230 + getHeightOffset(2))); // bottom signature line
                if (aCheckDetail.SignatureLineCount == 2)
                {
                    gr.DrawLine(new Pen(Color.Black, 1), new Point(435, 210 + getHeightOffset(1)), new Point(674, 210 + getHeightOffset(1))); // top signature line
                    gr.DrawLine(new Pen(Color.Black, 1), new Point(435, 210 + getHeightOffset(2)), new Point(674, 210 + getHeightOffset(2))); // top signature line
                }
            }

            Point checkNumberPoint = getCheckNumberPoint(checkNumber, 1);
            gr.DrawString(iCheckNumber.ToString(), new Font(defaultFont, 18, FontStyle.Regular, GraphicsUnit.Pixel), SystemBrushes.WindowText, checkNumberPoint);
            if (checkType == FULL_IMAGE)
            {
                gr.DrawString((iCheckNumber + 1).ToString(), new Font(defaultFont, 18, FontStyle.Regular, GraphicsUnit.Pixel), SystemBrushes.WindowText, checkNumberPoint.X, checkNumberPoint.Y + getHeightOffset(1));
                gr.DrawString((iCheckNumber + 2).ToString(), new Font(defaultFont, 18, FontStyle.Regular, GraphicsUnit.Pixel), SystemBrushes.WindowText, checkNumberPoint.X, checkNumberPoint.Y + getHeightOffset(2));
            }


            Point msgPoint = new Point(550, 160);

            Point checkNumberMICRPoint = new Point(112, 253);
            Point routingNumberMICRPoint = new Point(236, 258);
            Point accountNumberMICRPoint = new Point(420, 258);
            Font font = new Font("Arial", 9, FontStyle.Regular, GraphicsUnit.Pixel);

            // message above signature
            gr.DrawString(msg, font, new SolidBrush(Color.Black), msgPoint, sfCenter);
            if (checkType == FULL_IMAGE)
            {
                gr.DrawString(msg, font, new SolidBrush(Color.Black), msgPoint.X, msgPoint.Y + getHeightOffset(1), sfCenter);
                gr.DrawString(msg, font, new SolidBrush(Color.Black), msgPoint.X, msgPoint.Y + getHeightOffset(2), sfCenter);
            }

            gr.DrawString(bankInfoLine1, new Font(defaultFont, 7, FontStyle.Bold), SystemBrushes.WindowText, getBankLinePoint(QBVOUCHER, 1, checkType), getLineFormat());
            gr.DrawString(bankInfoLine2, new Font(defaultFont, 7), SystemBrushes.WindowText, getBankLinePoint(QBVOUCHER, 2, checkType), getLineFormat());
            gr.DrawString(bankInfoLine3, new Font(defaultFont, 7), SystemBrushes.WindowText, getBankLinePoint(QBVOUCHER, 3, checkType), getLineFormat());
            gr.DrawString(bankFraction, new Font(defaultFont, 7), SystemBrushes.WindowText, getBankLinePoint(QBVOUCHER, 4, checkType), getLineFormat());
            if (checkType == FULL_IMAGE)
            {
                gr.DrawString(bankInfoLine1, new Font(defaultFont, 7, FontStyle.Bold), SystemBrushes.WindowText, getBankLinePoint(QBVOUCHER, 1, checkType).X, getBankLinePoint(QBVOUCHER, 1, checkType).Y + getHeightOffset(1), getLineFormat());
                gr.DrawString(bankInfoLine2, new Font(defaultFont, 7), SystemBrushes.WindowText, getBankLinePoint(QBVOUCHER, 2, checkType).X,getBankLinePoint(QBVOUCHER, 2, checkType).Y + getHeightOffset(1), getLineFormat());
                gr.DrawString(bankInfoLine3, new Font(defaultFont, 7), SystemBrushes.WindowText, getBankLinePoint(QBVOUCHER, 3, checkType).X, getBankLinePoint(QBVOUCHER, 3, checkType).Y + getHeightOffset(1), getLineFormat());
                gr.DrawString(bankFraction, new Font(defaultFont, 7), SystemBrushes.WindowText, getBankLinePoint(QBVOUCHER, 4, checkType).X, getBankLinePoint(QBVOUCHER, 4, checkType).Y + getHeightOffset(1), getLineFormat());
                gr.DrawString(bankInfoLine1, new Font(defaultFont, 7, FontStyle.Bold), SystemBrushes.WindowText, getBankLinePoint(QBVOUCHER, 1, checkType).X, getBankLinePoint(QBVOUCHER, 1, checkType).Y + getHeightOffset(2), getLineFormat());
                gr.DrawString(bankInfoLine2, new Font(defaultFont, 7), SystemBrushes.WindowText, getBankLinePoint(QBVOUCHER, 2, checkType).X, getBankLinePoint(QBVOUCHER, 2, checkType).Y + getHeightOffset(2), getLineFormat());
                gr.DrawString(bankInfoLine3, new Font(defaultFont, 7), SystemBrushes.WindowText, getBankLinePoint(QBVOUCHER, 3, checkType).X, getBankLinePoint(QBVOUCHER, 3, checkType).Y + getHeightOffset(2), getLineFormat());
                gr.DrawString(bankFraction, new Font(defaultFont, 7), SystemBrushes.WindowText, getBankLinePoint(QBVOUCHER, 4, checkType).X, getBankLinePoint(QBVOUCHER, 4, checkType).Y + getHeightOffset(2), getLineFormat());
            }
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

            StringBuilder micrLine1 = new StringBuilder();
            micrLine1.Append("C");
            micrLine1.Append(getPaddedCheckNumber(iCheckNumber + 1, 8));
            micrLine1.Append("C");
            micrLine1.Append(MICR_SPACER);
            micrLine1.Append("A");
            micrLine1.Append(routingNumber);
            micrLine1.Append("A");
            micrLine1.Append(MICR_SPACER);
            micrLine1.Append(accountNumber);
            micrLine1.Append("C");

            StringBuilder micrLine2 = new StringBuilder();
            micrLine2.Append("C");
            micrLine2.Append(getPaddedCheckNumber(iCheckNumber + 2, 8));
            micrLine2.Append("C");
            micrLine2.Append(MICR_SPACER);
            micrLine2.Append("A");
            micrLine2.Append(routingNumber);
            micrLine2.Append("A");
            micrLine2.Append(MICR_SPACER);
            micrLine2.Append(accountNumber);
            micrLine2.Append("C");

            gr.DrawString(micrLine.ToString(), new Font(aMICRFont, aMICRFontEMSize, FontStyle.Bold), SystemBrushes.WindowText, checkNumberMICRPoint);
            //gr.DrawString("A" + routingNumber + "A", new Font(aMICRFont, aMICRFontEMSize, FontStyle.Bold), SystemBrushes.WindowText, routingNumberMICRPoint);
            //gr.DrawString(accountNumber + "C", new Font(aMICRFont, aMICRFontEMSize, FontStyle.Bold), SystemBrushes.WindowText, accountNumberMICRPoint);
            if (checkType == FULL_IMAGE)
            {
                gr.DrawString(micrLine1.ToString(), new Font(aMICRFont, aMICRFontEMSize, FontStyle.Bold), SystemBrushes.WindowText, checkNumberMICRPoint.X,checkNumberMICRPoint.Y + getHeightOffset(1));
                gr.DrawString(micrLine2.ToString(), new Font(aMICRFont, aMICRFontEMSize, FontStyle.Bold), SystemBrushes.WindowText, checkNumberMICRPoint.X, checkNumberMICRPoint.Y + getHeightOffset(2));
            }
            LogInfo("Started saving graphic object");
            gr.Save();
            return bmp;
        }

        public Bitmap GetFullCheckImage_ADPManualPayroll(int aProductKey, string aAccountNumber, int checkType)
        {
            int fullCheckOffset = 0;
            if (checkType == FULL_IMAGE)
            {
                fullCheckOffset = ADP_MANUALPAYROLL_OFFSET;
            }
            Invoice aInvoice = GetInvoiceFromSession();

            InvoiceItem aInvoiceItem = aInvoice.GetInvoiceItem(aProductKey, aAccountNumber);
            aCheckDetail = aInvoiceItem.CheckDetailObject;

            string bankInfoLine1 = aCheckDetail.BankInfoLine1;
            string bankInfoLine2 = aCheckDetail.BankInfoLine2;
            string bankInfoLine3 = aCheckDetail.BankInfoLine3;
            string accountNumber = aCheckDetail.BankAccountNumber;
            string routingNumber = aCheckDetail.RoutingNumber;
            string bankFraction = aCheckDetail.Fraction;
            string checkNumber = aCheckDetail.StartingNumber;

            if (checkNumber.Length < 6)
            {
                checkNumber = checkNumber.PadLeft(6, '0');
            }

            string sMICRCheckNumber = checkNumber.PadLeft(8, '0');
            string msg = aCheckDetail.MessageAboveSignature;


            int checkColorKey = aCheckDetail.CheckColorKey;
            int typeFaceKey = aCheckDetail.TypeFaceKey;

            CheckColor color = CheckColorDataAccess.GetOne(checkColorKey);

            TypeFace typeFace = TypeFaceDataAccess.GetOne(typeFaceKey);

            FontFamily addressFont = new FontFamily(typeFace.Description);

            string imagePath = "";
            if (checkType == FULL_IMAGE)
            {
                imagePath = color.FullCheckImagePath;
            }
            if (checkType == CHECK_ONLY)
            {
                imagePath = color.ImagePath;
            }


            int aMICRFontEMSize = 10;

            Brush defaultTextBrush = SystemBrushes.WindowText;


            Bitmap bmp = new Bitmap(Server.MapPath(imagePath));

            LogInfo("Using base image:" + imagePath);

            Graphics gr;
            gr = Graphics.FromImage(bmp);

            LogInfo("Graphics object created from image");

            gr.SmoothingMode = SmoothingMode.AntiAlias;

            Point payToTheOrderLineStart = new Point(85, 130);
            Point payToTheOrderLineEnd = new Point(515, 130);
            Point numericLineStart = new Point(524, 130);
            Point numericLineEnd = new Point(665, 130);
            Point spelledAmountLineStart = new Point(31, 155);
            Point spelledAmountLineEnd = new Point(615, 155);
            Point dateLineStart = new Point(535, 80);
            Point dateLineEnd = new Point(665, 80);

            //lines
            if (aCheckDetail.PrintLines)
            {
                // pay to the order line
                gr.DrawLine(new Pen(Color.Black, 1), payToTheOrderLineStart, payToTheOrderLineEnd);
                // numeric amount line
                gr.DrawLine(new Pen(Color.Black, 1), numericLineStart, numericLineEnd);
                // spelled out amount line
                gr.DrawLine(new Pen(Color.Black, 1), spelledAmountLineStart, spelledAmountLineEnd);
                // date line
                gr.DrawLine(new Pen(Color.Black, 1), dateLineStart, dateLineEnd);
            }
            if (checkType == FULL_IMAGE)
            {
                payToTheOrderLineStart = new Point(85, 130 + getHeightOffset(1));
                payToTheOrderLineEnd = new Point(515, 130 + getHeightOffset(1));
                numericLineStart = new Point(524, 130 + getHeightOffset(1));
                numericLineEnd = new Point(665, 130 + getHeightOffset(1));
                spelledAmountLineStart = new Point(31, 155 + getHeightOffset(1));
                spelledAmountLineEnd = new Point(615, 155 + getHeightOffset(1));
                dateLineStart = new Point(535, 80 + getHeightOffset(1));
                dateLineEnd = new Point(665, 80 + getHeightOffset(1));
                if (aCheckDetail.PrintLines)
                {
                    gr.DrawLine(new Pen(Color.Black, 1), payToTheOrderLineStart, payToTheOrderLineEnd);
                    // numeric amount line
                    gr.DrawLine(new Pen(Color.Black, 1), numericLineStart, numericLineEnd);
                    // spelled out amount line
                    gr.DrawLine(new Pen(Color.Black, 1), spelledAmountLineStart, spelledAmountLineEnd);
                    // date line
                    gr.DrawLine(new Pen(Color.Black, 1), dateLineStart, dateLineEnd);
                }
                payToTheOrderLineStart = new Point(85, 130 + getHeightOffset(2));
                payToTheOrderLineEnd = new Point(515, 130 + getHeightOffset(2));
                numericLineStart = new Point(524, 130 + getHeightOffset(2));
                numericLineEnd = new Point(665, 130 + getHeightOffset(2));
                spelledAmountLineStart = new Point(31, 155 + getHeightOffset(2));
                spelledAmountLineEnd = new Point(615, 155 + getHeightOffset(2));
                dateLineStart = new Point(535, 80 + getHeightOffset(2));
                dateLineEnd = new Point(665, 80 + getHeightOffset(2));
                if (aCheckDetail.PrintLines)
                {
                    gr.DrawLine(new Pen(Color.Black, 1), payToTheOrderLineStart, payToTheOrderLineEnd);
                    // numeric amount line
                    gr.DrawLine(new Pen(Color.Black, 1), numericLineStart, numericLineEnd);
                    // spelled out amount line
                    gr.DrawLine(new Pen(Color.Black, 1), spelledAmountLineStart, spelledAmountLineEnd);
                    // date line
                    gr.DrawLine(new Pen(Color.Black, 1), dateLineStart, dateLineEnd);
                }
            }


            if (aCheckDetail.SignatureLineCount == 2)
            {
                gr.DrawLine(new Pen(Color.Black, 1), new Point(435, 210 + fullCheckOffset), new Point(674, 210 + fullCheckOffset)); // top signature line
            }
            gr.DrawLine(new Pen(Color.Black, 1), new Point(435, 237 + fullCheckOffset), new Point(674, 237 + fullCheckOffset)); // bottom signature line
            gr.DrawString("AUTHORIZED SIGNATURE", new Font(defaultFont, 5, FontStyle.Regular, GraphicsUnit.Pixel), SystemBrushes.WindowText, new Point(525, 240 + fullCheckOffset));

            StringFormat checkNumberFormat = new StringFormat();
            checkNumberFormat.Alignment = StringAlignment.Far;


            gr.DrawString(checkNumber, new Font(defaultFont, 18, FontStyle.Regular, GraphicsUnit.Pixel), SystemBrushes.WindowText, new Point(658, 30 + fullCheckOffset), checkNumberFormat);


            Point msgPoint = new Point(550, 165 + fullCheckOffset);

            Point checkNumberMICRPoint = new Point(100, 258 + fullCheckOffset);
            Point routingNumberMICRPoint = new Point(236, 258 + fullCheckOffset);
            Point accountNumberMICRPoint = new Point(420, 258 + fullCheckOffset);
            Font font = new Font("Arial", 9, FontStyle.Regular, GraphicsUnit.Pixel);

            // message above signature
            gr.DrawString(msg, font, new SolidBrush(Color.Black), msgPoint, sfCenter);

            gr.DrawString(bankInfoLine1, new Font(defaultFont, 7, FontStyle.Bold), SystemBrushes.WindowText, getBankLinePoint(ADPMANUALPAYROLL, 1, checkType), getLineFormat());
            gr.DrawString(bankInfoLine2, new Font(defaultFont, 7), SystemBrushes.WindowText, getBankLinePoint(ADPMANUALPAYROLL, 2, checkType), getLineFormat());
            gr.DrawString(bankInfoLine3, new Font(defaultFont, 7), SystemBrushes.WindowText, getBankLinePoint(ADPMANUALPAYROLL, 3, checkType), getLineFormat());
            gr.DrawString(bankFraction, new Font(defaultFont, 7), SystemBrushes.WindowText, getBankLinePoint(ADPMANUALPAYROLL, 4, checkType), getLineFormat());

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

            LogInfo("Started saving graphic object");
            gr.Save();
            return bmp;
        }

        public string getPaddedCheckNumber(int inVal, int padLength)
        {
            string retVal = inVal.ToString();
            if (retVal.Length < padLength)
            {
                retVal = retVal.PadLeft(padLength, '0');
            }
            return retVal;
        }

        public static Bitmap MakeGrayscale3(Bitmap original)
        {
            //create a blank bitmap the same size as original
            Bitmap newBitmap = new Bitmap(original.Width, original.Height);

            //get a graphics object from the new image
            Graphics g = Graphics.FromImage(newBitmap);

            //create the grayscale ColorMatrix
            ColorMatrix colorMatrix = new ColorMatrix(
               new float[][]
      {
         new float[] {.3f, .3f, .3f, 0, 0},
         new float[] {.59f, .59f, .59f, 0, 0},
         new float[] {.11f, .11f, .11f, 0, 0},
         new float[] {0, 0, 0, 1, 0},
         new float[] {0, 0, 0, 0, 1}
      });

            //create some image attributes
            ImageAttributes attributes = new ImageAttributes();

            //set the color matrix attribute
            attributes.SetColorMatrix(colorMatrix);

            //draw the original image on the new image
            //using the grayscale color matrix
            g.DrawImage(original, new Rectangle(0, 0, original.Width, original.Height),
               0, 0, original.Width, original.Height, GraphicsUnit.Pixel, attributes);

            //dispose the Graphics object
            g.Dispose();
            return newBitmap;
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

        private float getBankBlockWidth()
        {
            Bitmap b = new Bitmap(1, 1);
            Graphics g = Graphics.FromImage(b);
            float f = new float();
            Font font;
            string familyName = "Arial";
            FontStyle fontStyle = FontStyle.Regular;
            if (aCheckDetail.TypeFaceKey == 2)
            {
                familyName = "Times New Roman";
            }

            // look at line 1
            font = new Font(familyName, aFontEMSize, fontStyle);
            SizeF s = g.MeasureString(aCheckDetail.BankInfoLine1, font);
            f = s.Width;
            s = g.MeasureString(aCheckDetail.BankInfoLine2, font);
            if (f < s.Width)
            {
                f = s.Width;
            }
            s = g.MeasureString(aCheckDetail.BankInfoLine3, font);
            if (f < s.Width)
            {
                f = s.Width;
            }
            return f;
        }

        private float getAddressBlockWidth()
        {
            Bitmap b = new Bitmap(1,1);
            Graphics g = Graphics.FromImage(b);
            float f = new float();
            Font font;
            string familyName = "Arial";
            FontStyle fontStyle = FontStyle.Regular;
            if(aCheckDetail.TypeFaceKey == 2)
            {
                familyName = "Times New Roman";
            }
            
            // look at line 1
            if(aCheckDetail.Line1FontWeightKey == 2)
            {
                fontStyle = FontStyle.Bold;
            }
            font = new Font(familyName,addressLineFontEMSize,fontStyle);
            SizeF s = g.MeasureString(aCheckDetail.Line1, font);
            f = s.Width;
            // look at line 2
            if (aCheckDetail.Line1FontWeightKey == 1)
            {
                fontStyle = FontStyle.Regular;
            }
            else
            {
                fontStyle = FontStyle.Bold;
            }
            font = new Font(familyName, addressLineFontEMSize, fontStyle);
            s = g.MeasureString(aCheckDetail.Line2, font);

            if (f < s.Width)
            {
                f = s.Width;
            }
            // reset fontstyle to regular
            fontStyle = FontStyle.Regular;
            font = new Font(familyName, addressLineFontEMSize, fontStyle);
            // look at line 3
            s = g.MeasureString(aCheckDetail.Line3, font);

            if (f < s.Width)
            {
                f = s.Width;
            }
            // look at line 4
            s = g.MeasureString(aCheckDetail.Line4, font);

            if (f < s.Width)
            {
                f = s.Width;
            }
            // look at line 5
            s = g.MeasureString(aCheckDetail.Line5, font);

            if (f < s.Width)
            {
                f = s.Width;
            }

            return f;
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
                        if (!aCheckDetail.ColorLogo)
                        {
                            logo = MakeGrayscale3((Bitmap)logo);
                        }


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

        private Point getCheckNumberPoint(string checkNumber, int which, int imageType, int productTypeKey)
        {
            Point checkNumberPoint = new Point();

            if (productTypeKey == ELITEACCOUNTSPAYABLE)
            {
                checkNumberPoint.X = 610 - (int)(checkNumber.Length * 2.5);
                switch (which)
                {
                    case 1:
                        checkNumberPoint.Y = 15 + 7;
                        break;
                    case 2:
                        checkNumberPoint.Y = 320;
                        break;
                    case 3:
                        checkNumberPoint.Y = 610;
                        break;
                }
            }
            else
            {
                return getCheckNumberPoint(checkNumber, which);
            }
            
            return checkNumberPoint;
        }

        private Point getCheckNumberPoint(string checkNumber, int which)
        {
            // changed x from 600 to 610
            Point checkNumberPoint = new Point();
            checkNumberPoint.X = 610 - (int)(checkNumber.Length * 2.5);
            switch (which)
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

        private int getHeightOffset(int which)
        {
            switch (which)
            {
                case 1:
                    return 285;
                case 2:
                    return 570;
                default:
                    return 0;
            }
        }

        private Point getBankLinePoint(int productTypeKey, int lineOrder, int imageType)
        {
            int line1Base = 32;
            int line2Base = 42;
            int line3Base = 52;
            int line4Base = 72;

            switch (productTypeKey)
            {
                case QBVOUCHER:
                    break;
                case PEACHTREE:
                    if (imageType == CHECK_ONLY)
                    {
                    }
                    else
                    {
                        line1Base += PEACHTREE_FULLCHECK_OFFSET;
                        line2Base += PEACHTREE_FULLCHECK_OFFSET;
                        line3Base += PEACHTREE_FULLCHECK_OFFSET;
                        line4Base += PEACHTREE_FULLCHECK_OFFSET;
                    }
                    break;
                case ELITEACCOUNTSPAYABLE:
                    if (imageType == CHECK_ONLY)
                    {
                        line1Base += 3;
                        line2Base += 3;
                        line3Base += 3;
                        line4Base += 3;
                    }
                    else
                    {
                        line1Base += ELITEACCOUNTSPAYABLE_OFFSET;
                        line2Base += ELITEACCOUNTSPAYABLE_OFFSET;
                        line3Base += ELITEACCOUNTSPAYABLE_OFFSET;
                        line4Base += ELITEACCOUNTSPAYABLE_OFFSET;
                    }
                    break;
                case ADPMANUALPAYROLL:
                    if (imageType == CHECK_ONLY)
                    {
                    }
                    else
                    {
                        line1Base += ADP_MANUALPAYROLL_OFFSET;
                        line2Base += ADP_MANUALPAYROLL_OFFSET;
                        line3Base += ADP_MANUALPAYROLL_OFFSET;
                        line4Base += ADP_MANUALPAYROLL_OFFSET;
                    }
                    break;
            }

            float bankWidth = getBankBlockWidth();
            int x = 373;
            int adjust = 0;
            if (aCheckDetail.TextAlignKey != 1)
            {
                adjust = 30;// (int)bankWidth / 2;
            }
            x += adjust;
            Point bankInfoLine1Point = new Point(x, line1Base);
            Point bankInfoLine2Point = new Point(x, line2Base);
            Point bankInfoLine3Point = new Point(x, line3Base);
            Point bankFractionPoint = new Point(x, line4Base);

            switch (lineOrder)
            {
                case 1:
                    return bankInfoLine1Point;
                case 2:
                    return bankInfoLine2Point;
                case 3:
                    return bankInfoLine3Point;
                case 4:
                    return bankFractionPoint;
                default:
                    return new Point(1, 1);
            }
        }

        private Point getLogoPoint(int productTypeKey, int imageType)
        {
            int x = 0; // horizontal
            int y = 30; // vertical
            int belowAddressOffset = 0;
            int fullCheckOffSet = 0;
            switch (productTypeKey)
            {
                case QBVOUCHER:
                    break;
                case QBSTANDARD:
                    break;
                case PEACHTREE:
                    if (imageType == FULL_IMAGE)
                    {
                        fullCheckOffSet = PEACHTREE_FULLCHECK_OFFSET;
                    }
                    break;
                case ELITEACCOUNTSPAYABLE:
                    if (imageType == FULL_IMAGE)
                    {
                        fullCheckOffSet = ELITEACCOUNTSPAYABLE_OFFSET;
                    }
                    break;
            }
            if (aCheckDetail.LogoLocationKey == RIGHT_OF_ADDRESS)
            {
                x += (int)getAddressBlockWidth() + 55;
            }
            else
            {
                x += 25;
            }
            if (aCheckDetail.LogoLocationKey == BELOW_ADDRESS)
            {
                Point lastLinePoint = getLinePoint(QBVOUCHER,4,CHECK_ONLY);
                int h = lastLinePoint.Y;
                belowAddressOffset += h -30;
            }

            x += GetLogoLeftAdjustment();
            y += GetLogoHeightAdjustment() + belowAddressOffset + fullCheckOffSet;

            return new Point(x, y);
        }
        private Point getLinePoint(int productTypeKey, int lineOrder, int imageType)
        {

            int line1Base = 28;
            int line2Base = 40;
            int line3Base = 52;
            int line4Base = 64;
            int line5Base = 76;

            switch (productTypeKey)
            {
                case QBVOUCHER:
                    
                    break;
                case PEACHTREE:
                    if (imageType == CHECK_ONLY)
                    {
                    }
                    else
                    {
                        line1Base += PEACHTREE_FULLCHECK_OFFSET;
                        line2Base += PEACHTREE_FULLCHECK_OFFSET;
                        line3Base += PEACHTREE_FULLCHECK_OFFSET;
                        line4Base += PEACHTREE_FULLCHECK_OFFSET;
                        line5Base += PEACHTREE_FULLCHECK_OFFSET;
                    }
                    break;
                case ELITEACCOUNTSPAYABLE:
                    if (imageType == CHECK_ONLY)
                    {
                        line1Base += 3;
                        line2Base += 3;
                        line3Base += 3;
                        line4Base += 3;
                        line5Base += 3;
                    }
                    else
                    {
                        line1Base += ELITEACCOUNTSPAYABLE_OFFSET;
                        line2Base += ELITEACCOUNTSPAYABLE_OFFSET;
                        line3Base += ELITEACCOUNTSPAYABLE_OFFSET;
                        line4Base += ELITEACCOUNTSPAYABLE_OFFSET;
                        line5Base += ELITEACCOUNTSPAYABLE_OFFSET;
                    }
                    break;
            }


            if (aCheckDetail.SuppressLine1)
            {
                lineOrder = lineOrder - 1;
            }
            int leftAlignStart = 55;
            int centerAlignStart = 100;
            // changed to a fixed point
            centerAlignStart = 200;
            int logoHeight = 0;
            if (aCheckDetail.UseLogo)
            {
                if (aCheckDetail.LogoLocationKey == LEFT_OF_ADDRESS)
                {
                    int logoWidth = aCheckDetail.LogoWidth;
                    
                    int offSet = logoWidth - 15;
                    leftAlignStart = leftAlignStart + offSet;
                    centerAlignStart = centerAlignStart + offSet;

                    // changed to a fixed point
                    centerAlignStart = 200;
                    if (logoWidth > 0)
                    {
                        centerAlignStart = logoWidth + ((400 - logoWidth) / 2);
                    }
                }
                if (aCheckDetail.LogoLocationKey == ABOVE_ADDRESS)
                {
                    logoHeight = aCheckDetail.LogoHeight;
                }
            }
            
            float addressBlockWidth = getAddressBlockWidth();
            centerAlignStart = leftAlignStart + ((int)addressBlockWidth / 2);
            leftAlignStart += GetAddressLeftAdjustment();
            centerAlignStart += GetAddressLeftAdjustment();
            int heightAdjust = GetAddressHeightAdjustment() + logoHeight;

            ArrayList checkLinesLeft = new ArrayList();
            checkLinesLeft.Add(new Point(leftAlignStart, line1Base + heightAdjust));
            checkLinesLeft.Add(new Point(leftAlignStart, line2Base + heightAdjust));
            checkLinesLeft.Add(new Point(leftAlignStart, line3Base + heightAdjust));
            checkLinesLeft.Add(new Point(leftAlignStart, line4Base + heightAdjust));
            checkLinesLeft.Add(new Point(leftAlignStart, line5Base + heightAdjust));

            ArrayList checkLinesCenter = new ArrayList();
            checkLinesCenter.Add(new Point(centerAlignStart, line1Base + heightAdjust));
            checkLinesCenter.Add(new Point(centerAlignStart, line2Base + heightAdjust));
            checkLinesCenter.Add(new Point(centerAlignStart, line3Base + heightAdjust));
            checkLinesCenter.Add(new Point(centerAlignStart, line4Base + heightAdjust));
            checkLinesCenter.Add(new Point(centerAlignStart, line5Base + heightAdjust));

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

        public  string getEnvelopeDescription(string description, decimal price)
        {
            return description.Substring(0, description.IndexOf("Envelopes") + 9) + " " + price.ToString("$#0.00");
        }

        public string getEnvelopePartNumber(string description)
        {
            return description.Substring(description.IndexOf("Envelopes") + 10);
        }

        public void RemoveUnapprovedChecksFromInvoice()
        {
            Invoice aInvoice = GetInvoiceFromSession(true);
            try
            {
                if (aInvoice != null)
                {
                    foreach (InvoiceItem item in aInvoice.InvoiceItems)
                    {
                        Product aProduct = ProductDataAccess.GetOne(Convert.ToInt32(item.ProductKey));

                        ProductType aProductType = ProductTypeDataAccess.GetOne(Convert.ToInt32(aProduct.ProductTypeKey));
                        ProductCategory aProductCategory = ProductCategoryDataAccess.GetOne(Convert.ToInt32(aProductType.ProductCategoryKey));
                        if (aProductCategory.ProductCategoryKey == 3)
                        {
                            if (!item.CheckDetailObject.Approved)
                            {
                                aInvoice.RemoveInvoiceItem(aProduct.ProductKey, item.CheckDetailObject.BankAccountNumber);
                            }
                        }
                    }
                }
            }
            catch
            {
                LogInfo("Ignored error in RemoveUnapprovedChecksFromInvoice");
            }
        }

        public string GetShortenedString(string strIn, int length)
        {
            if(strIn.Length <= length){
                return strIn;
            }
            else{
                return strIn.Substring(0, length) + "...";
            }
        }
    }
}