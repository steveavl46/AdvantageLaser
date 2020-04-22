using AdvantageLaserData.Data.BusObjects;
using AdvLaser.AdvLaserDataAccess;
using AdvLaser.AdvLaserObjects;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CheckProject.coupons
{
    public partial class CouponList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadGridData();
            }
            //string code = "test01a";
            //Coupon test = CouponDataAccess.GetOneByCode(code);
        }

        protected void grdData_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdData.PageIndex = e.NewPageIndex;
            LoadGridData();
        }

        private void LoadGridData()
        {
            CouponCollection list = CouponCollectionDataAccess.GetCoupons();
            grdData.DataSource = list;
            grdData.DataBind();
        }

        protected void lnkEdit_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string id = btn.CommandArgument;
            Response.Redirect("AddEditCoupon.aspx?CouponKey=" + id);
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddEditCoupon.aspx");
        }

    }
}