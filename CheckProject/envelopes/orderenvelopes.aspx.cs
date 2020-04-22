using AdvLaser.AdvLaserDataAccess;
using AdvLaser.AdvLaserObjects;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CheckProject.WebUtils;

namespace CheckProject.envelopes
{
    public partial class orderenvelopes : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string sql = "exec usp_SelectProduct_DoubleWindowEnvelopes";
            ArrayList envelopeList = ProductTypeDataAccess.GetProductTypeList(sql);
            ArrayList filteredList = new ArrayList();

            Invoice invoice = GetInvoiceFromSession(true);
            bool hasCheck = invoice.HasCheck();
            bool hasADPCheck = invoice.HasADPCheck();
            if (hasCheck)
            {
                if (hasADPCheck)
                {
                    foreach (ProductType envelopeType in envelopeList)
                    {
                        if(envelopeType.EnvelopeCompatibilityKey == ProductType.ENVELOPE_COMPATIBILITY_ADP)
                        {
                            filteredList.Add(envelopeType);
                        }
                    }
                }
                else
                {
                    foreach (ProductType envelopeType in envelopeList)
                    {
                        if (envelopeType.EnvelopeCompatibilityKey == ProductType.ENVELOPE_COMPATIBILITY_GENERIC)
                        {
                            filteredList.Add(envelopeType);
                        }
                    }
                }
            }
            else
            {
                filteredList = envelopeList;
            }
            TableRow tr;
            TableCell td;



            foreach (ProductType envelopeType in filteredList)
            {
                tr = new TableRow();
                td = new TableCell();
                td.Text = envelopeType.Description;
                tr.Cells.Add(td);
                tblEnvelopes.Rows.Add(tr);
                string productSQL = "exec usp_GetProductsForProductType " + envelopeType.ProductTypeKey.ToString();
                ArrayList productList = ProductDataAccess.GetProductList(productSQL);
                foreach (Product env in productList)
                {
                    tr = new TableRow();
                    td = new TableCell();
                    td.CssClass = "indent2";
                    td.Text = getEnvelopeDescription(env.Description, env.Price);
                    tr.Cells.Add(td);
                    td = new TableCell();
                    DropDownList ddl = new DropDownList();
                    ddl.ID = env.ProductKey.ToString();
                    ListItem item = new ListItem("Quantity");
                    ddl.Items.Add(item);
                    for (int i = 1; i < 11; i++)
                    {
                        item = new ListItem(i.ToString());
                        ddl.Items.Add(item);
                    }
                    Label l = new Label();
                    l.CssClass = "partNumber";
                    l.Text = getEnvelopePartNumber(env.Description);
                    td.Controls.Add(ddl);
                    td.Controls.Add(l);
                    tr.Cells.Add(td);
                    tblEnvelopes.Rows.Add(tr);
                }
            }
            if (!IsPostBack)
            {
                fillQuantities();
            }
        }

        private void fillQuantities()
        {
            Invoice invoice = GetInvoiceFromSession(true);
            foreach (InvoiceItem item in invoice.InvoiceItems)
            {
                Product product = ProductDataAccess.GetOne(item.ProductKey);
                var obj = product.ProductTypeObject;
                if (obj.ProductCategoryKey == 4)
                {
                    DropDownList ctl = (DropDownList)FindControl(item.ProductKey.ToString());
                    ctl.SelectedValue = item.Quantity.ToString();
                }
            }
        }

        protected void btnSubmit_OnClick(object sender, EventArgs e)
        {
            List<DropDownList> list = (List<DropDownList>)WebUtils.WebUtils.GetAllControlsOfType<DropDownList>(Page);
            Invoice invoice = GetInvoiceFromSession(true);
            foreach (DropDownList ddl in list)
            {

                int quantity = 0;
                string v = ddl.SelectedItem.Text;
                Int32.TryParse(v, out quantity);
                InvoiceItem aInvoiceItem = new InvoiceItem();
                bool itemfound = false;
                foreach (InvoiceItem item in invoice.InvoiceItems)
                {
                    if (Convert.ToInt32(ddl.ID) == item.ProductKey)
                    {
                        aInvoiceItem = item;
                        itemfound = true;
                        if (quantity == 0)
                        {
                            invoice.RemoveInvoiceItem(item.ProductKey, String.Empty);
                        }
                        break;
                    }
                }
                if (quantity > 0)
                {

                    int productKey = Convert.ToInt32(ddl.ID);
                    Product aProduct = ProductDataAccess.GetOne(productKey);
                    aInvoiceItem.ProductKey = Convert.ToInt32(aProduct.ProductKey);

                    string newDescription = aProduct.Description.Replace("1000", (1000 * quantity).ToString());
                    aInvoiceItem.Description = newDescription;
                    aInvoiceItem.Quantity = quantity;
                    aInvoiceItem.Price = aProduct.Price * quantity;
                    aInvoiceItem.ShippingRate = aProduct.ShippingRate;
                    try
                    {
                        if (itemfound)
                        {
                        }
                        else
                        {
                            invoice.AddInvoiceItem(aInvoiceItem);
                        }
                    }
                    catch (System.Exception ex)
                    {
                        LogError(ex.Message);
                        throw new Exception(ex.Message);

                    }
                }

            }
            Session["InvoiceObject"] = invoice;
            Response.Redirect("../OrderProcessing/ViewOrder.aspx");
        }
    }
}