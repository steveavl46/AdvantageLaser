using AdvLaser.AdvLaserDataAccess;
using AdvLaser.AdvLaserObjects;
using CheckProject.WebUtils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CheckProject.coupons
{
    public partial class AddEditCoupon : BasePage
    {
        Coupon aCoupon;
        bool isEditing;
        string couponKey;

        protected void Page_Load(object sender, EventArgs e)
        {
            couponKey = Request.Params["CouponKey"];
            if (String.IsNullOrEmpty(couponKey))
            {
                aCoupon = new Coupon();
                aCoupon.StartDate = DateTime.Now;
                aCoupon.EndDate = DateTime.Now;
                isEditing = false;
            }
            else
            {
                aCoupon = CouponDataAccess.GetOne(Convert.ToInt32(couponKey));
                isEditing = true;
            }
            if (!IsPostBack)
            {                
                populatePage(aCoupon);
            }
        }

        private void populatePage(Coupon aCoupon)
        {
            txtCouponCode.Text = aCoupon.CouponCode;
            txtDescription.Text = aCoupon.Description;
            txtStartDate.Text = aCoupon.StartDate.ToString("MM/dd/yyyy");
            txtEndDate.Text = aCoupon.EndDate.ToString("MM/dd/yyyy");
            if (isEditing)
            {
                setDropDownValue(ddlCouponCategory, aCoupon.CouponCategoryKey);
                setDropDownValue(ddlCouponType, aCoupon.CouponTypeKey);
                if (aCoupon.CouponTypeKey == 1)
                {
                    txtDiscountValue.Text = aCoupon.DollarValue.ToString();
                }
                else
                {
                    txtDiscountValue.Text = aCoupon.PercentValue.ToString();
                }
                txtMinimumOrder.Text = aCoupon.MinimumOrder.ToString();
            }
        }
        private void setDropDownValue(DropDownList ddl, int value)
        {
            foreach (ListItem i in ddl.Items)
            {
                i.Selected = i.Value == value.ToString();
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            lblErrorMessage.Visible = !Page.IsValid;
            if (Page.IsValid)
            {
                try
                {
                    aCoupon.CouponCode = txtCouponCode.Text;
                    aCoupon.Description = txtDescription.Text;
                    aCoupon.CouponTypeKey = Convert.ToInt32(ddlCouponType.SelectedValue);
                    if (aCoupon.CouponTypeKey == 1)
                    {
                        aCoupon.DollarValue = Convert.ToDecimal(txtDiscountValue.Text);
                    }
                    if (aCoupon.CouponTypeKey == 2)
                    {
                        aCoupon.PercentValue = Convert.ToDecimal(txtDiscountValue.Text);
                    }
                    aCoupon.StartDate = Convert.ToDateTime(txtStartDate.Text);
                    aCoupon.EndDate = Convert.ToDateTime(txtEndDate.Text);
                    aCoupon.MinimumOrder = Convert.ToDecimal(txtMinimumOrder.Text);
                    aCoupon.CouponCategoryKey = Convert.ToInt32(ddlCouponCategory.SelectedValue);
                    aCoupon.Save();
                    Response.Redirect("CouponList.aspx");
                }
                catch (System.Exception ex)
                {
                    lblErrorMessage.Visible = true;
                    lblErrorMessage.Text = ex.Message;
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("CouponList.aspx");
        }
    }
}