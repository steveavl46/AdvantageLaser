using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using AdvLaser.AdvLaserDataAccess;
using System.Data;
using System.Data.Common;
using System.Collections;
using AdvLaser.AdvLaserObjects;

namespace CheckProject.OrderProcessing
{
    public partial class ShippingRates : System.Web.UI.Page
    {
        private DataTable datRates = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            fillRateTable(); 
            fillZoneTable();
            fillZoneBasedRateTable();
            fillFixedRateTable();
        }

        private void fillRateTable()
        {
            using (SqlConnection cn = new SqlConnection(BaseDataAccess.ConnectionString))
            {
                string sql = "select * from v_zoneshippingrates";
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = new SqlCommand(sql,cn);
                da.Fill(datRates);
            }
        }
        private void fillZoneTable()
        {
            using (SqlConnection cn = new SqlConnection(BaseDataAccess.ConnectionString))
            {
                string sql = "exec GetShippingZoneInfo";
                SqlCommand sqlCmd = new SqlCommand();
                BaseDataAccess.SetCommandType(sqlCmd, CommandType.Text, sql);

                sqlCmd.Connection = cn;
                cn.Open();
                SqlDataReader reader = sqlCmd.ExecuteReader();
                TableRow tr;
                TableCell td;
                while (reader.Read())
                {
                    string zoneDescription = (string)reader["shippingzonedescription"];
                    string stateList = (string)reader["statelist"];
                    tr = new TableRow();
                    td = new TableCell();
                    td.Text = zoneDescription;
                    tr.Cells.Add(td);
                    td = new TableCell();
                    td.Text = stateList;
                    tr.Cells.Add(td);
                    tblZones.Rows.Add(tr);
                }
            }
        }

        private void fillZoneBasedRateTable()
        {
            using (SqlConnection cn = new SqlConnection(BaseDataAccess.ConnectionString))
            {
                string sql = "select g.shippingrategroupkey, description from ShippingRateGroup g where exists (select 1 from ProductType where ShippingRateGroupKey = g.ShippingRateGroupKey)";
                SqlCommand sqlCmd = new SqlCommand();
                BaseDataAccess.SetCommandType(sqlCmd, CommandType.Text, sql);

                sqlCmd.Connection = cn;
                cn.Open();
                SqlDataReader readerRateGroup = sqlCmd.ExecuteReader();
                TableRow tr;
                TableCell td;
                while (readerRateGroup.Read())
                {
                    int shippingRateGroupKey = (int)readerRateGroup["shippingrategroupkey"];
                    string zoneDescription = (string)readerRateGroup["description"];
                    tr = new TableRow();
                    td = new TableCell();
                    td.ColumnSpan = 2;
                    td.CssClass = "header2";
                    td.Text = zoneDescription;
                    tr.Cells.Add(td);
                    tblRates.Rows.Add(tr);
                    tr = new TableRow();
                    td = new TableCell();
                    td.Controls.Add(createRateGroupDisplay(shippingRateGroupKey));
                    tr.Cells.Add(td);
                    tblRates.Rows.Add(tr);
                }
            }
        }

        private void fillFixedRateTable()
        {
            using (SqlConnection cn = new SqlConnection(BaseDataAccess.ConnectionString))
            {
                string sql = "select * from product where isnull(shippingrate,0) > 0";
                ArrayList productList = ProductDataAccess.GetProductList(sql);
                SqlCommand sqlCmd = new SqlCommand();
                BaseDataAccess.SetCommandType(sqlCmd, CommandType.Text, sql);
                TableRow tr;
                TableCell td;
                foreach(Product p in productList)
                {
                    string description = p.Description;
                    decimal shippingRate = p.ShippingRate;
                    tr = new TableRow();
                    td = new TableCell();

                    td.Text = description;
                    tr.Cells.Add(td);
                    td = new TableCell();
                    td.HorizontalAlign = HorizontalAlign.Left;
                    td.Text = shippingRate.ToString("$0.00");
                    tr.Cells.Add(td);
                    tblFixedRate.Rows.Add(tr);
                }
            }
        }

        private Table createRateGroupDisplay(int shippingRateGroupKey)
        {
            // will be a table with 1 row ans 2 cells
            // cell 1 will contain a table with the list of products in the Rate Group
            // cell 2 will contain a table with the zones and quantity breaks

            Table tblTemp = new Table();
            TableRow tr;
            TableCell td;
            tr = new TableRow();
            td = new TableCell();
            td.VerticalAlign = VerticalAlign.Top;
            td.Controls.Add(getProductsListTable(shippingRateGroupKey));
            tr.Cells.Add(td);
            td = new TableCell();
            td.Controls.Add(getZoneRateTable(shippingRateGroupKey));
            tr.Cells.Add(td);
            tblTemp.Rows.Add(tr);
            return tblTemp;
        }

        private Table getProductsListTable(int shippingRateGroupKey)
        {
            Table tblTemp = new Table();
            TableRow tr;
            TableCell td;
            tr = new TableRow();
            td = new TableCell();
            td.CssClass = "subhead";
            td.Text = "Products";
            tr.Cells.Add(td);
            tblTemp.Rows.Add(tr);
            using (SqlConnection cn = new SqlConnection(BaseDataAccess.ConnectionString))
            {
                string sql = "select description from producttype where ShippingRateGroupKey = " + shippingRateGroupKey.ToString() + " order by description";
                SqlCommand sqlCmd = new SqlCommand();
                BaseDataAccess.SetCommandType(sqlCmd, CommandType.Text, sql);

                sqlCmd.Connection = cn;
                cn.Open();
                SqlDataReader readerRateDescription = sqlCmd.ExecuteReader();

                while (readerRateDescription.Read())
                {
                    string description = (string)readerRateDescription["description"];
                    tr = new TableRow();
                    td = new TableCell();
                    
                    td.Text = description;
                    tr.Cells.Add(td);
                    tblTemp.Rows.Add(tr);
                }
            }
            return tblTemp;
        }

        private Table getZoneRateTable(int shippingRateGroupKey)
        {
            // get a datatable that has quantities for the rate group
            DataTable dt = new DataTable();
            using (SqlConnection cn = new SqlConnection(BaseDataAccess.ConnectionString))
            {

                string sql = "select distinct ratetypedescription, quantity from v_zoneshippingrates where shippingrategroupkey = " + shippingRateGroupKey.ToString() + " order by quantity";
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = new SqlCommand(sql, cn);
                da.Fill(dt);
            }

            Table tblTemp = new Table();
            TableRow tr;
            TableCell td;
            // create header row for rates
            tr = new TableRow();
            td = new TableCell();
            td.CssClass = "subhead";
            td.Text = "Zone";
            tr.Cells.Add(td);
            
            foreach(DataRow dr in dt.Rows)
            {
                string rateDescription = (string)dr["ratetypedescription"];
                int quantity = (int)dr["quantity"];
                td = new TableCell();
                if (rateDescription == "Up To")
                {
                    rateDescription = "<= ";
                }
                else
                {
                    rateDescription = "< ";
                }
                td.Text = rateDescription + quantity.ToString();
                td.CssClass = "subhead";
                tr.Cells.Add(td);
            }

            tblTemp.Rows.Add(tr);
            // end header row


            ArrayList shippingZoneList = ShippingZoneDataAccess.GetShippingZoneList("select * from shippingzone");
            foreach (ShippingZone zone in shippingZoneList)
            {
                tr = new TableRow();
                td = new TableCell();
                td.Text = zone.Description;
                tr.Cells.Add(td);
                tblTemp.Rows.Add(tr);
                string filter = "ZoneDescription='" + zone.Description + "'";
                DataRow[] drList = datRates.Select(filter);

                string zoneRate = "N/A";
                // loop through list of quantities
                foreach (DataRow row in dt.Rows)
                {
                    int baseQuantity = (int)row["quantity"];
                    // loop through list of quantities for the zone
                    foreach (DataRow r in drList)
                    {
                        int quantity = (int)r["quantity"];
                        if (quantity == baseQuantity)
                        {
                            zoneRate = ((decimal)r["ShippingRate"]).ToString("$#.00");
                            td = new TableCell();
                            if ((string)r["RateTypeDescription"] == "Per Unit")
                            {
                                zoneRate += "/1000";
                            }
                            td.Text = zoneRate;
                            tr.Cells.Add(td);
                            break;
                        }                                                
                    }
                }
            }
            return tblTemp;
        }
    }


}
