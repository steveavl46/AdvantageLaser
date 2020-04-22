using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CheckProject.controls
{
    public partial class Header : System.Web.UI.UserControl
    {
        public string StepNumber;
        protected void Page_Load(object sender, EventArgs e)
        {
            tdStep1.CssClass = "progresscell1_off";
            tdStep2.CssClass = "progresscell2_off";
            tdStep3.CssClass = "progresscell3_off";
            tdStep4.CssClass = "progresscell4_off";
            tdStep5.CssClass = "progresscell5_off";
            tdStep6.CssClass = "progresscell6_off";
            tdStep7.CssClass = "progresscell7_off";

            lnkSelectProduct.CssClass = "navlink_off";
            lnkViewOrder.CssClass = "navlink_off";
            lnkCustomerInfo.CssClass = "navlink_off";
            lnkShippingInfo.CssClass = "navlink_off";
            lnkPlaceOrder.CssClass = "navlink_off";

            lnkSelectProduct.PostBackUrl = "../OrderStart/selectproduct.aspx";
            lnkViewOrder.PostBackUrl = "../orderprocessing/vieworder.aspx";
            lnkCustomerInfo.PostBackUrl = "../orderprocessing/addressentry.aspx";
            lnkShippingInfo.PostBackUrl = "../orderprocessing/shippingentry.aspx";
            lnkPlaceOrder.PostBackUrl = "../orderprocessing/confirmorder.aspx";
            imgHeader.ImageUrl = "../images/chkprint-header-2.jpg";

            switch(StepNumber)
            {
                case "1":
                    tdStep1.CssClass = "progresscell1_on";
                    lnkSelectProduct.CssClass = "navlink_on";
                    imgHeader.ImageUrl = "../images/chkprint-header-2.jpg";
                    break;
                case "2":
                    tdStep2.CssClass = "progresscell2_on";
                    break;
                case "3":
                    tdStep3.CssClass = "progresscell3_on";
                    break;
                case "4":
                    tdStep4.CssClass = "progresscell4_on";
                    lnkViewOrder.CssClass = "navlink_on";
                    break;
                case "5":
                    tdStep5.CssClass = "progresscell5_on";
                    lnkCustomerInfo.CssClass = "navlink_on";
                    break;
                case "6":
                    tdStep6.CssClass = "progresscell6_on";
                    lnkShippingInfo.CssClass = "navlink_on";
                    break;
                case "7":
                    tdStep7.CssClass = "progresscell7_on";
                    lnkPlaceOrder.CssClass = "navlink_on";
                    break;                
                default:
                    break;
            }
        }
    }
}