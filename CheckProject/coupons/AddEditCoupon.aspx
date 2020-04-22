<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddEditCoupon.aspx.cs" Inherits="CheckProject.coupons.AddEditCoupon" %>
<%@ Register TagPrefix="AdvLaser" TagName="CharsRemaining" Src="../controls/CharactersRemaining.ascx" %>
<%@ Register TagPrefix="AdvLaser" TagName="ReqFld" Src="../controls/RequiredFieldIndicator.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="../styles/checkproject.css" type="text/css">
    <script src="../js/common.js" type="text/javascript"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script>
        $(function () {
            $("#txtStartDate").datepicker({ defaultDate: new Date() });
            $("#txtEndDate").datepicker();
        });
  </script>
    <style>
    .outerdiv
        {
        border-style:solid;
        border-color:#ffcc99;
        border-width:5px;
        height:400px;
        width:695px;
        }
        .selectedTab
        {
        background-color:#ffcc99;
        font-weight:bold;
        text-align:center;
        }
        .unselectedTab
        {
        background-color:#ffffcc;
        font-weight:bold;
        text-align:center;
        }
        .controlLabel{
            width:150px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" defaultfocus="txtCouponCode">
    <div>
    <table width="100%">
<tr>
<td align="center">

<div class="holderdiv">
<!--
<b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b>    
-->
<img src="../images/chkprint-header-2.jpg" />
<div class="contentb">        
<span>Add / Edit Coupon</span>  
</div>

<b class="b4"></b><b class="b3"></b><b class="b2"></b><b class="b1"></b>

</div>
</td>
</tr>
<tr>
<td align="center">
<div class="holderdiv">
  <b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b>    

<div class="contentb1">        
<div style="text-align:left">
<!-------------------------->

    <table border="0">
        <tr>
            <td class="entrylabel controlLabel" >Coupon Code:</td>
            <td>
                <AdvLaser:ReqFld ID="ReqFld1"  runat="server" Required="true" />                
                <asp:TextBox CssClass="textinput" runat="server" ID="txtCouponCode" Columns="10" TabIndex="1" MaxLength="8" />
                <asp:RequiredFieldValidator EnableClientScript="false" ID="RequiredFieldValidator1"  runat="server" ControlToValidate="txtCouponCode" ErrorMessage="Coupon Code is required" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td class="entrylabel controlLabel" >Description:</td>
            <td>
                <AdvLaser:ReqFld ID="ReqFld2"  runat="server" Required="true" />
                <asp:TextBox CssClass="textinput" runat="server" ID="txtDescription" Columns="30" TabIndex="2" MaxLength="25" />
                <asp:RequiredFieldValidator EnableClientScript="false" ID="RequiredFieldValidator2"  runat="server" ControlToValidate="txtDescription" ErrorMessage="Description is required" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td class="entrylabel controlLabel" >Category:</td>
            <td>
                <AdvLaser:ReqFld ID="ReqFld3"  runat="server" Required="true" />
                <asp:DropDownList ID="ddlCouponCategory" runat="server" TabIndex="3">
                    <asp:ListItem Text="Select" Value="0" />
                    <asp:ListItem Text="Printed Materials" Value="1" />
                    <asp:ListItem Text="Envelopes" Value="2" />
                    <asp:ListItem Text="All" Value="3" />
                </asp:DropDownList>
                <asp:RequiredFieldValidator EnableClientScript="false" ID="RequiredFieldValidator3"  runat="server" ControlToValidate="ddlCouponCategory" InitialValue="0" ErrorMessage="Coupon Category is required" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td class="entrylabel controlLabel" >Start Date:</td>
            <td>
                <AdvLaser:ReqFld ID="ReqFld4"  runat="server" Required="true" />                
                <asp:TextBox CssClass="textinput" runat="server" ID="txtStartDate" Columns="10" TabIndex="4" MaxLength="25" Text="" />
                <asp:RequiredFieldValidator EnableClientScript="false" ID="RequiredFieldValidator4"  runat="server" ControlToValidate="txtStartDate" ErrorMessage="Start Date is required" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td class="entrylabel controlLabel" >End Date:</td>
            <td>
                <AdvLaser:ReqFld ID="ReqFld5"  runat="server" Required="true" />                
                <asp:TextBox CssClass="textinput" runat="server" ID="txtEndDate" Columns="10" TabIndex="5" MaxLength="25" />
                <asp:RequiredFieldValidator EnableClientScript="false" ID="RequiredFieldValidator5"  runat="server" ControlToValidate="txtEndDate" ErrorMessage="End Date is required" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td class="entrylabel controlLabel" >Coupon Type:</td>
            <td>
                <AdvLaser:ReqFld ID="ReqFld6"  runat="server" Required="true" />                
                <asp:DropDownList ID="ddlCouponType" runat="server" TabIndex="6">
                    <asp:ListItem Text="Select" Value="0" />
                    <asp:ListItem Text="Dollars Off" Value="1" />
                    <asp:ListItem Text="Percent Off" Value="2" />
                </asp:DropDownList>
                <asp:RequiredFieldValidator EnableClientScript="false" ID="RequiredFieldValidator6"  runat="server" ControlToValidate="ddlCouponType" InitialValue="0" ErrorMessage="Coupon Type is required" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td class="entrylabel controlLabel" >Discount Value:</td>
            <td>
                <AdvLaser:ReqFld ID="ReqFld7"  runat="server" Required="true" />                
                <asp:TextBox  runat="server" ID="txtDiscountValue" Columns="10" TabIndex="7" MaxLength="3"  />
                <asp:RequiredFieldValidator EnableClientScript="false" ID="RequiredFieldValidator7"  runat="server" ControlToValidate="txtDiscountValue" ErrorMessage="Discount Value is required" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td class="entrylabel controlLabel" >Minimum Order:</td>
            <td>
                <AdvLaser:ReqFld ID="ReqFld8"  runat="server" Required="true" />                
                <asp:TextBox CssClass="textinput" runat="server" ID="txtMinimumOrder" Columns="10" TabIndex="8" MaxLength="3" />
                <asp:RequiredFieldValidator EnableClientScript="false" ID="RequiredFieldValidator8"  runat="server" ControlToValidate="txtMinimumOrder" ErrorMessage="Minimum is required" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button runat="server" ID="btnSave" OnClick="btnSave_Click" Text="Save" />
                <asp:Button runat="server" ID="btnCancel" OnClick="btnCancel_Click" Text="Cancel" />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td align="left">                
                <asp:Label runat="server" Visible="false"  ID="lblErrorMessage"  />
            </td>
        </tr>
    </table>
<!-------------------------->
</div>    
</div>

<b class="b4"></b><b class="b3"></b><b class="b2"></b><b class="b1"></b>
</div>
</td>
</tr>
</table>
    </div>
    </form>
</body>
</html>
