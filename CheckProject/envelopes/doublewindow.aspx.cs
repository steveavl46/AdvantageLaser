using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using AdvLaser.AdvLaserDataAccess;
using AdvLaser.AdvLaserObjects;
using CheckProject.WebUtils;

namespace CheckProject.envelopes
{
    public partial class doublewindow : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["PopUpViewed"] = "YES";
            string sql = "exec usp_SelectProduct_DoubleWindowEnvelopes";
            ArrayList envelopeList = ProductTypeDataAccess.GetProductTypeList(sql);
            TableRow tr;
            TableCell td;

            
            foreach (ProductType envelopeType in envelopeList)
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
                    td.Text = getEnvelopeDescription(env.Description,env.Price);
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
                        invoice.AddInvoiceItem(aInvoiceItem);
                    }
                    catch (System.Exception ex)
                    {
                        LogError(ex.Message);
                        throw new Exception(ex.Message);

                    }
                }
                
            }
            Session["InvoiceObject"] = invoice;
            //Response.Redirect("../OrderProcessing/AddressEntry.aspx");
        }
    }
}
