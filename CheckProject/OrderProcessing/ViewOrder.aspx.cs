using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AdvLaser.AdvLaserObjects;
using CheckProject.WebUtils;
using NLog;
using AdvLaser.AdvLaserDataAccess;
using System.Collections;
using AdvantageLaserData.Data.BusObjects;

namespace CheckProject.OrderProcessing
{
    public partial class ViewOrder : BasePage
    {
        const int DESCRIPTION_LENGTH = 35;
        string errorMessage;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            errorMessage = Request.Params.Get("ErrorMessage");
            string aAccountNumber = Request.Params.Get("AccountNumber");
            if (String.IsNullOrEmpty(aAccountNumber))
            {
                aAccountNumber = "0";
            }
            if(String.IsNullOrEmpty(errorMessage))
            {
                errorMessage = "";
            }
            Invoice aInvoice = GetInvoiceFromSession(true);

            verifyCoupon(aInvoice);

            bool hasEnvelopes = envelopesInOrder(aInvoice);

            if (Session["PopUpViewed"] == null && !hasEnvelopes)
            {
                litOnLoad.Text = @"onload=openWindow();";
            }
            else
            {
                litOnLoad.Text = "";
            }

            displayInvoiceDepositSlipItems(aInvoice);
            displayInvoiceDepostStampItems(aInvoice);
            displayInvoiceCheckItems(aInvoice);
            displayInvoiceDepositBookItems(aInvoice);
            populateAddDepositStamps(aInvoice);
            displayEnvelopes(aInvoice);
            lblErrorMessage.Text = errorMessage;
            btnContinue.Enabled = (aInvoice.InvoiceItems.Count > 0);
            if (aInvoice.InvoiceItems.Count == 0)
            {
                TableRow tr = new TableRow();
                TableCell td = new TableCell();
                td.ColumnSpan = 4;
                td.Text = "There are no items in this order.";
                tr.Cells.Add(td);
                tblInvoiceItems.Rows.Add(tr);
            }
            
            if (!IsPostBack)
            {
                foreach (ListItem i in ddlAccount.Items)
                {
                    i.Selected = (i.Text == aAccountNumber);
                }
            }

            //imgStamp.ImageUrl = getImageURL(aAccountNumber);
            //imgStamp.ImageUrl = getImageURL(ddlAccount.SelectedValue);

            const int DEPOSIT_STAMP = 7;
            Product depositStamp = ProductDataAccess.GetOne(DEPOSIT_STAMP);
            lblDepositStampPrice.Text = depositStamp.Price.ToString("$0.00");
        }

        private string getImageURL(string aAccountNumber)
        {
            string aCompanyName = "";
            string aBankName = "";
            if (aAccountNumber == "0")
            {
                return "../PreviewBuilder/SelfInkingStampBuilder.aspx";
            }
            else
            {
                Invoice aInvoice = GetInvoiceFromSession(true);
                foreach (InvoiceItem item in aInvoice.InvoiceItems)
                {
                    
                    Product aProduct = ProductDataAccess.GetOne(Convert.ToInt32(item.ProductKey));

                    ProductType aProductType = ProductTypeDataAccess.GetOne(Convert.ToInt32(aProduct.ProductTypeKey));
                    ProductCategory aProductCategory = ProductCategoryDataAccess.GetOne(Convert.ToInt32(aProductType.ProductCategoryKey));
                    if (aProductCategory.ProductCategoryKey == 1)
                    {
                        if (aAccountNumber == item.DepositSlipObject.AccountNumber)
                        {
                            aBankName = item.DepositSlipObject.BankInfoLine1;
                            aCompanyName = item.DepositSlipObject.Line1;
                            if (String.IsNullOrEmpty(aCompanyName))
                            {
                                aCompanyName = aInvoice.CustomerObject.FirstName + " " + aInvoice.CustomerObject.LastName;
                            }
                            return "../PreviewBuilder/SelfInkingStampBuilder.aspx?CompanyName=" + Server.UrlEncode(aCompanyName) + "&BankName=" + Server.UrlEncode(aBankName) + "&AccountNumber=" + aAccountNumber;
                        }
                    }
                    if (aProductCategory.ProductCategoryKey == 3)
                    {
                        if (aAccountNumber == item.CheckDetailObject.BankAccountNumber)
                        {
                            aBankName = item.CheckDetailObject.BankInfoLine1;
                            aCompanyName = item.CheckDetailObject.Line1;
                            if (String.IsNullOrEmpty(aCompanyName))
                            {
                                if (aInvoice.CustomerObject != null)
                                {
                                    aCompanyName = aInvoice.CustomerObject.FirstName + " " + aInvoice.CustomerObject.LastName;
                                }
                            }
                            if (aProduct.ProductTypeKey == 6)
                            {
                                aCompanyName = "ADP";
                            }
                            return "../PreviewBuilder/SelfInkingStampBuilder.aspx?CompanyName=" + aCompanyName + "&BankName=" + aBankName + "&AccountNumber=" + aAccountNumber;
                        }
                    }
                }
            }
            return "../PreviewBuilder/SelfInkingStampBuilder.aspx";
        }

        private void populateAddDepositStamps(Invoice aInvoice)
        {
            ArrayList list = new ArrayList();
            if (aInvoice != null)
            {
                list = WebUtils.WebUtils.GetAccountNumbersFromInvoice(aInvoice);

                for(int i = 0;i<list.Count;i++)
                {
                    string aAccountNumber = (string)list[i];
                    ListItem item = new ListItem(aAccountNumber, aAccountNumber);
                    ddlAccount.Items.Add(item);
                    ddlDepositStampAccount.Items.Add(item);
                }
            }
        }

        private bool envelopesInOrder(Invoice aInvoice)
        {
            foreach (InvoiceItem item in aInvoice.InvoiceItems)
            {
                Product aProduct = ProductDataAccess.GetOne(Convert.ToInt32(item.ProductKey));
                ProductType aProductType = ProductTypeDataAccess.GetOne(Convert.ToInt32(aProduct.ProductTypeKey));
                ProductCategory aProductCategory = ProductCategoryDataAccess.GetOne(Convert.ToInt32(aProductType.ProductCategoryKey));
                if (aProductCategory.ProductCategoryKey == 4)
                {
                    return true;
                }
            }
            return false;
        }

        private void displayEnvelopes(Invoice aInvoice)
        {
            TableRow tr;
            TableCell td;
            LinkButton b;
            ImageButton ib;
            Label l;
            if (aInvoice != null)
            {
                foreach (InvoiceItem item in aInvoice.InvoiceItems)
                {
                    Product aProduct = ProductDataAccess.GetOne(Convert.ToInt32(item.ProductKey));
                    ProductType aProductType = ProductTypeDataAccess.GetOne(Convert.ToInt32(aProduct.ProductTypeKey));
                    ProductCategory aProductCategory = ProductCategoryDataAccess.GetOne(Convert.ToInt32(aProductType.ProductCategoryKey));
                    if (aProductCategory.ProductCategoryKey == 4)
                    {
                        tr = new TableRow();
                        tr.CssClass = "lineitem";
                        td = new TableCell();
                        l = new Label();
                        l.ToolTip = aProductType.Description;
                        l.Text = GetShortenedString(aProductType.Description, DESCRIPTION_LENGTH);
                        td.Controls.Add(l);
                        tr.Cells.Add(td);
                        td = new TableCell();
                        td.Text = "&nbsp;";
                        tr.Cells.Add(td);
                        td = new TableCell();
                        l = new Label();
                        l.ToolTip = getEnvelopeDisplayDescription(item);
                        l.Text = GetShortenedString(getEnvelopeDisplayDescription(item),DESCRIPTION_LENGTH);// item.Description;
                        td.Controls.Add(l);
                        tr.Cells.Add(td);
                        td = new TableCell();
                        td.Text = item.Price.ToString("$#,##0.00");
                        tr.Cells.Add(td);
                        td = new TableCell();
                        td.Text = "&nbsp;";
                        tr.Cells.Add(td);
                        td = new TableCell();
                        ImageButton btn = new ImageButton();
                        btn.CommandName = aProduct.ProductKey.ToString();
                        btn.CommandArgument = "";
                        btn.Click += new ImageClickEventHandler(btnRemove_OnClick);
                        btn.Attributes.Add("onclick", "javascript:return confirmDelete();return false;");
                        btn.ImageUrl = "../images/Remove.gif";
                        td.Controls.Add(btn);
                        tr.Cells.Add(td);
                        tblInvoiceItems.Rows.Add(tr);
                    }
                }
            }
        }

        private string getEnvelopeDisplayDescription(InvoiceItem item)
        {
            if (item.Quantity > 1)
            {            
                return item.Quantity.ToString() + item.Description.Substring(2);
            }
            else
            {
                return item.Description;
            }
        }


        private void displayInvoiceDepostStampItems(Invoice aInvoice)
        {
            TableRow tr;
            TableCell td;
            if (aInvoice != null)
            {
                foreach (InvoiceItem item in aInvoice.InvoiceItems)
                {
                    Product aProduct = ProductDataAccess.GetOne(Convert.ToInt32(item.ProductKey));

                    ProductType aProductType = ProductTypeDataAccess.GetOne(Convert.ToInt32(aProduct.ProductTypeKey));
                    ProductCategory aProductCategory = ProductCategoryDataAccess.GetOne(Convert.ToInt32(aProductType.ProductCategoryKey));
                    if (aProductCategory.ProductCategoryKey == 2)
                    {
                        tr = new TableRow();
                        tr.CssClass = "lineitem";
                        td = new TableCell();
                        string aAccountNumber = item.DepositStampObject.AccountNumber;
                        td.ToolTip = aProductType.Description;
                        td.Text = GetShortenedString(aProductType.Description, DESCRIPTION_LENGTH);
                        tr.Cells.Add(td);
                        td = new TableCell();
                        td.Text = aAccountNumber;
                        tr.Cells.Add(td);
                        td = new TableCell();
                        td.Text = aProduct.Description;
                        tr.Cells.Add(td);
                        td = new TableCell();
                        td.Text = item.Price.ToString("$#,##0.00");
                        tr.Cells.Add(td);
                        td = new TableCell();
                        td.Text = "&nbsp;";
                        tr.Cells.Add(td);
                        td = new TableCell();
                        ImageButton btn = new ImageButton();
                        btn.CommandName = aProduct.ProductKey.ToString();
                        btn.CommandArgument = aAccountNumber;
                        btn.Click += new ImageClickEventHandler(btnRemove_OnClick);
                        btn.Attributes.Add("onclick", "javascript:return confirmDelete();return false;");
                        btn.ImageUrl = "../images/Remove.gif";
                        td.Controls.Add(btn);
                        tr.Cells.Add(td);
                        tblInvoiceItems.Rows.Add(tr);
                    }
                }
            }
        }
        private void displayInvoiceDepositSlipItems(Invoice aInvoice)
        {
            TableRow tr;
            TableCell td;
            LinkButton b;
            ImageButton ib;
            if (aInvoice != null)
            {
                foreach (InvoiceItem item in aInvoice.InvoiceItems)
                {
                    tr = new TableRow();
                    tr.CssClass = "lineitem";
                    td = new TableCell();
                    Product aProduct = ProductDataAccess.GetOne(Convert.ToInt32(item.ProductKey));

                    ProductType aProductType = ProductTypeDataAccess.GetOne(Convert.ToInt32(aProduct.ProductTypeKey));
                    ProductCategory aProductCategory = ProductCategoryDataAccess.GetOne(Convert.ToInt32(aProductType.ProductCategoryKey));
                    if (aProductCategory.ProductCategoryKey == 1)
                    {
                        string aAccountNumber = item.DepositSlipObject.AccountNumber;
                        td.ToolTip = aProductType.Description;
                        td.Text = GetShortenedString(aProductType.Description, DESCRIPTION_LENGTH);
                        tr.Cells.Add(td);
                        td = new TableCell();
                        td.Text = aAccountNumber;
                        tr.Cells.Add(td);
                        td = new TableCell();
                        td.Text = aProduct.QuantityPriceDisplay;
                        tr.Cells.Add(td);
                        td = new TableCell();
                        td.Text = (aProduct.Quantity * aProduct.Price).ToString("$#0.00");
                        tr.Cells.Add(td);
                        td = new TableCell();
                        ib = new ImageButton();
                        ib.ImageUrl = "../images/Edit.gif";
                        ib.PostBackUrl = "../OrderDepositSlip/DepositSlipInfo.aspx?ProductKey=" + aProduct.ProductKey.ToString() + "&AccountNumber=" + aAccountNumber;
                        td.Controls.Add(ib);
                        tr.Cells.Add(td);                        
                        td = new TableCell();
                        ImageButton btn = new ImageButton();
                        btn.CommandName = aProduct.ProductKey.ToString();
                        btn.CommandArgument = aAccountNumber;
                        btn.Click += new ImageClickEventHandler(btnRemove_OnClick);
                        btn.Attributes.Add("onclick", "javascript:return confirmDelete();return false;");
                        btn.ImageUrl = "../images/Remove.gif";
                        td.Controls.Add(btn);
                        tr.Cells.Add(td);
                        tblInvoiceItems.Rows.Add(tr);
                    }
                }
                /*
                tr = new TableRow();
                td = new TableCell();
                td.ColumnSpan = 4;
                td.Text = "Subtotal";
                tr.Cells.Add(td);
                td = new TableCell();
                decimal orderTotal = aInvoice.OrderTotal();
                td.Text = orderTotal.ToString("$#,##0.00");
                tr.Cells.Add(td);
                tblInvoiceItems.Rows.Add(tr);
                tr = new TableRow();
                td = new TableCell();
                td.ColumnSpan = 4;
                td.Text = "Shipping";
                tr.Cells.Add(td);
                td = new TableCell();
                decimal shippingTotal = aInvoice.ShippingTotal;
                td.Text = shippingTotal.ToString("$#,##0.00");
                tr.Cells.Add(td);
                tblInvoiceItems.Rows.Add(tr);
                tr = new TableRow();
                td = new TableCell();
                td.ColumnSpan = 4;
                td.Text = "Total";
                tr.Cells.Add(td);
                td = new TableCell();
                decimal invoiceTotal = orderTotal + shippingTotal;
                td.Text = invoiceTotal.ToString("$#,##0.00");
                tr.Cells.Add(td);
                tblInvoiceItems.Rows.Add(tr);
                */
            }
        }
        private void displayInvoiceDepositBookItems(Invoice aInvoice)
        {
            TableRow tr;
            TableCell td;
            LinkButton b;
            ImageButton ib;
            if (aInvoice != null)
            {
                foreach (InvoiceItem item in aInvoice.InvoiceItems)
                {
                    tr = new TableRow();
                    tr.CssClass = "lineitem";
                    td = new TableCell();
                    Product aProduct = ProductDataAccess.GetOne(Convert.ToInt32(item.ProductKey));

                    ProductType aProductType = ProductTypeDataAccess.GetOne(Convert.ToInt32(aProduct.ProductTypeKey));
                    ProductCategory aProductCategory = ProductCategoryDataAccess.GetOne(Convert.ToInt32(aProductType.ProductCategoryKey));
                    if (aProductCategory.ProductCategoryKey == 5)
                    {
                        string aAccountNumber = item.DepositBookObject.AccountNumber;
                        td.ToolTip = aProductType.Description;
                        td.Text = GetShortenedString(aProductType.Description, DESCRIPTION_LENGTH);
                        tr.Cells.Add(td);
                        td = new TableCell();
                        td.Text = aAccountNumber;
                        tr.Cells.Add(td);
                        td = new TableCell();
                        td.Text = aProduct.QuantityPriceDisplay;
                        tr.Cells.Add(td);
                        td = new TableCell();
                        td.Text = (aProduct.Quantity * aProduct.Price).ToString("$#0.00");
                        tr.Cells.Add(td);
                        td = new TableCell();
                        ib = new ImageButton();
                        ib.ImageUrl = "../images/Edit.gif";
                        ib.PostBackUrl = "../OrderDepositSlip/DepositBookInfo.aspx?ProductKey=" + aProduct.ProductKey.ToString() + "&AccountNumber=" + aAccountNumber;
                        td.Controls.Add(ib);
                        tr.Cells.Add(td);
                        td = new TableCell();
                        ImageButton btn = new ImageButton();
                        btn.CommandName = aProduct.ProductKey.ToString();
                        btn.CommandArgument = aAccountNumber;
                        btn.Click += new ImageClickEventHandler(btnRemove_OnClick);
                        btn.Attributes.Add("onclick", "javascript:return confirmDelete();return false;");
                        btn.ImageUrl = "../images/Remove.gif";
                        td.Controls.Add(btn);
                        tr.Cells.Add(td);
                        tblInvoiceItems.Rows.Add(tr);
                    }
                }
                /*
                tr = new TableRow();
                td = new TableCell();
                td.ColumnSpan = 4;
                td.Text = "Subtotal";
                tr.Cells.Add(td);
                td = new TableCell();
                decimal orderTotal = aInvoice.OrderTotal();
                td.Text = orderTotal.ToString("$#,##0.00");
                tr.Cells.Add(td);
                tblInvoiceItems.Rows.Add(tr);
                tr = new TableRow();
                td = new TableCell();
                td.ColumnSpan = 4;
                td.Text = "Shipping";
                tr.Cells.Add(td);
                td = new TableCell();
                decimal shippingTotal = aInvoice.ShippingTotal;
                td.Text = shippingTotal.ToString("$#,##0.00");
                tr.Cells.Add(td);
                tblInvoiceItems.Rows.Add(tr);
                tr = new TableRow();
                td = new TableCell();
                td.ColumnSpan = 4;
                td.Text = "Total";
                tr.Cells.Add(td);
                td = new TableCell();
                decimal invoiceTotal = orderTotal + shippingTotal;
                td.Text = invoiceTotal.ToString("$#,##0.00");
                tr.Cells.Add(td);
                tblInvoiceItems.Rows.Add(tr);
                */
            }
        }

        private void displayInvoiceCheckItems(Invoice aInvoice)
        {
            TableRow tr;
            TableCell td;
            LinkButton b;
            ImageButton ib;
            Label l;
            if (aInvoice != null)
            {
                foreach (InvoiceItem item in aInvoice.InvoiceItems)
                {

                    tr = new TableRow();
                    tr.CssClass = "lineitem";
                    td = new TableCell();
                    Product aProduct = ProductDataAccess.GetOne(Convert.ToInt32(item.ProductKey));

                    ProductType aProductType = ProductTypeDataAccess.GetOne(Convert.ToInt32(aProduct.ProductTypeKey));
                    ProductCategory aProductCategory = ProductCategoryDataAccess.GetOne(Convert.ToInt32(aProductType.ProductCategoryKey));
                    if (aProductCategory.ProductCategoryKey == 3)
                    {
                        string aAccountNumber = item.CheckDetailObject.BankAccountNumber;
                        l = new Label();
                        string productDescription = aProductType.Description;
                        if (!String.IsNullOrEmpty(item.SoftwareName))
                        {
                            productDescription = "Voucher Checks for " + item.SoftwareName;
                        }
                        l.ToolTip = productDescription;
                        l.Text = GetShortenedString(productDescription,DESCRIPTION_LENGTH);
                        td.Controls.Add(l);
                        
                        if (!item.CheckDetailObject.Approved)
                        {
                            Image img = new Image();
                            img.ImageUrl = "../images/unapproved.png";
                            img.ToolTip = "Unapproved";
                            img.Height = Unit.Pixel(15);
                            img.Width = Unit.Pixel(15);
                            img.Style.Add(HtmlTextWriterStyle.PaddingLeft, "5px");
                            td.Controls.Add(img);
                        }
                        tr.Cells.Add(td);
                        td = new TableCell();
                        l = new Label();
                        l.Text = aAccountNumber;
                        td.Controls.Add(l);
                        
                        tr.Cells.Add(td);
                        td = new TableCell();
                        if (item.CheckDetailObject.ColorLogo)
                        {
                            td.Text = aProduct.ColorSurchargeQuantityPriceDisplay;
                        }
                        else
                        {
                            td.Text = aProduct.QuantityPriceDisplay;
                        }
                        tr.Cells.Add(td);
                        td = new TableCell();
                        if (item.CheckDetailObject.ColorLogo)
                        {
                            td.Text = (aProduct.Quantity * (aProduct.Price + aProduct.ColorSurcharge)).ToString("$#0.00");
                        }
                        else
                        {
                            td.Text = (aProduct.Quantity * aProduct.Price).ToString("$#0.00");
                        }
                        tr.Cells.Add(td);
                        td = new TableCell();
                        ib = new ImageButton();
                        ib.ImageUrl = "../images/Edit.gif";
                        ib.PostBackUrl = "../OrderCheck/CheckInfo.aspx?ProductKey=" + aProduct.ProductKey.ToString() + "&AccountNumber=" + aAccountNumber;
                        td.Controls.Add(ib);
                        tr.Cells.Add(td);
                        td = new TableCell();
                        ImageButton btn = new ImageButton();
                        btn.CommandName = aProduct.ProductKey.ToString();
                        btn.CommandArgument = aAccountNumber;
                        btn.Click += new ImageClickEventHandler(btnRemove_OnClick);
                        btn.Attributes.Add("onclick", "javascript:return confirmDelete();return false;");
                        btn.ImageUrl = "../images/Remove.gif";
                        td.Controls.Add(btn);
                        tr.Cells.Add(td);
                        tblInvoiceItems.Rows.Add(tr);
                    }
                }
                /*
                tr = new TableRow();
                td = new TableCell();
                td.ColumnSpan = 4;
                td.Text = "Subtotal";
                tr.Cells.Add(td);
                td = new TableCell();
                decimal orderTotal = aInvoice.OrderTotal();
                td.Text = orderTotal.ToString("$#,##0.00");
                tr.Cells.Add(td);
                tblInvoiceItems.Rows.Add(tr);
                tr = new TableRow();
                td = new TableCell();
                td.ColumnSpan = 4;
                td.Text = "Shipping";
                tr.Cells.Add(td);
                td = new TableCell();
                decimal shippingTotal = aInvoice.ShippingTotal;
                td.Text = shippingTotal.ToString("$#,##0.00");
                tr.Cells.Add(td);
                tblInvoiceItems.Rows.Add(tr);
                tr = new TableRow();
                td = new TableCell();
                td.ColumnSpan = 4;
                td.Text = "Total";
                tr.Cells.Add(td);
                td = new TableCell();
                decimal invoiceTotal = orderTotal + shippingTotal;
                td.Text = invoiceTotal.ToString("$#,##0.00");
                tr.Cells.Add(td);
                tblInvoiceItems.Rows.Add(tr);
                */
            }
        }

        public void btnAddDepositBook_OnClick(object sender, EventArgs e)
        {
            if (ddlAccount.SelectedIndex >= 0)
            {
                string aAccountNumber = ddlAccount.SelectedValue;
                // redirect to deposit slip book page
                Response.Redirect("../OrderDepositSlip/DepositBookInfo.aspx?ProductTypeKey=12&AccountNumber=" + aAccountNumber);
            }
        }

        public void btnAddDepositStamp_OnClick(object sender, EventArgs e)
        {
            if (ddlDepositStampAccount.SelectedIndex >= 0)
            {
                Product aProduct = ProductDataAccess.GetOne(7);
                string aAccountNumber = ddlDepositStampAccount.SelectedValue;
                string aLine1 = "";
                string aBankName = "";
                InvoiceItem item = new InvoiceItem();
                DepositStamp aDepositStamp = new DepositStamp();
                Invoice aInvoice = GetInvoiceFromSession();
                foreach (InvoiceItem i in aInvoice.InvoiceItems)
                {
                    if (i.DepositSlipObject != null)
                    {
                        if (i.DepositSlipObject.AccountNumber == aAccountNumber)
                        {
                            aLine1 = i.DepositSlipObject.Line1;
                            aBankName = i.DepositSlipObject.BankInfoLine1;
                            break;
                        }
                    }
                    if (i.CheckDetailObject != null)
                    {
                        if (i.CheckDetailObject.BankAccountNumber == aAccountNumber)
                        {
                            aLine1 = i.CheckDetailObject.Line1;
                            aBankName = i.CheckDetailObject.BankInfoLine1;
                            break;
                        }
                    }
                }
                aDepositStamp.AccountNumber = aAccountNumber;
                aDepositStamp.Line1 = aLine1;
                aDepositStamp.BankName = aBankName;
                aDepositStamp.CustomerObject = aInvoice.CustomerObject;
                item.ProductKey = 7; //TODO think about removing hard code
                item.Description = aProduct.Description;
                item.DepositStampObject = aDepositStamp;
                item.Quantity = 1;
                item.Price = ((Product)ProductDataAccess.GetOne(item.ProductKey)).Price;
                item.ShippingRate = ((Product)ProductDataAccess.GetOne(item.ProductKey)).ShippingRate;
                try
                {
                    aInvoice.AddInvoiceItem(item);
                }
                catch (System.Exception ex)
                {
                    errorMessage = ex.Message;

                }
            }
            Response.Redirect("ViewOrder.aspx?ErrorMessage="+errorMessage);
        }

        public void btnRemove_OnClick(object sender, EventArgs e)
        {
            Invoice aInvoice = GetInvoiceFromSession();
            string aAccountNumber = ((ImageButton)sender).CommandArgument;
            int aProductKey = Convert.ToInt32(((ImageButton)sender).CommandName);
            aInvoice.RemoveInvoiceItem(aProductKey, aAccountNumber);
            Response.Redirect("ViewOrder.aspx");
        }

        public void ddlAccount_OnIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect("ViewOrder.aspx?AccountNumber="+ddlAccount.SelectedValue);
        }

        private void verifyCoupon(Invoice aInvoice)
        {
            if (aInvoice.CouponKey > 0)
            {
                Coupon aCoupon = CouponDataAccess.GetOne(aInvoice.CouponKey);
                CouponProductCategoryCollection productCategoryList = CouponProductCategoryCollectionDataAccess.GetProductCategories(aCoupon.CouponCategoryKey);
                decimal totalEligibleAmount = 0m;
                foreach (InvoiceItem item in aInvoice.InvoiceItems)
                {
                    foreach (ProductCategory cat in productCategoryList)
                    {
                        if (item.ProductObject.ProductTypeObject.ProductCategoryKey == cat.ProductCategoryKey)
                        {
                            if (item.ProductObject.ProductTypeObject.ProductCategoryKey == ProductCategory.CATEGORY_CHECK)
                            {
                                totalEligibleAmount += item.Price;
                            }
                        }
                        if (item.ProductObject.ProductTypeObject.ProductCategoryKey == ProductCategory.CATEGORY_DEPOSITSTAMP)
                        {
                            totalEligibleAmount += (item.Price * item.Quantity);
                        }
                        if (item.ProductObject.ProductTypeObject.ProductCategoryKey == cat.ProductCategoryKey)
                        {
                            if (item.ProductObject.ProductTypeObject.ProductCategoryKey == ProductCategory.CATEGORY_DEPOSITSLIP)
                            {
                                totalEligibleAmount += item.Price;
                            }
                        }
                        if (item.ProductObject.ProductTypeObject.ProductCategoryKey == cat.ProductCategoryKey)
                        {
                            if (item.ProductObject.ProductTypeObject.ProductCategoryKey == ProductCategory.CATEGORY_ENVELOPE)
                            {
                                totalEligibleAmount += item.Price;
                            }
                        }
                        if (item.ProductObject.ProductTypeObject.ProductCategoryKey == cat.ProductCategoryKey)
                        {
                            if (item.ProductObject.ProductTypeObject.ProductCategoryKey == ProductCategory.CATEGORY_DEPOSITBOOK)
                            {
                                totalEligibleAmount += item.Price;
                            }
                        }
                    }
                }
                decimal minimumOrder = aCoupon.MinimumOrder;
                if (totalEligibleAmount < minimumOrder)
                {
                    aInvoice.CouponKey = Int32.MinValue;
                    aInvoice.CouponDiscount = 0m;
                    return;
                }
                if (aCoupon.CouponTypeKey == Coupon.COUPON_TYPE_PERCENT)
                {
                    aInvoice.CouponDiscount = Math.Round(aCoupon.PercentValue / 100 * totalEligibleAmount, 2);
                }
            }
        }
    }
}
