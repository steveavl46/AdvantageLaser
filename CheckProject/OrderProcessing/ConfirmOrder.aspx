<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConfirmOrder.aspx.cs" Inherits="CheckProject.OrderProcessing.ConfirmOrder" %>
<%@ Register TagPrefix="AdvLaser" TagName="Header" Src="../controls/Header.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="../styles/checkproject.css" type="text/css">
    <script src="../js/common.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        function showShippingRates() {
            window.open("ShippingRates.aspx");
        }
    </script>
    <style>
        .couponWarning{
            border-color:yellow;
            border-width:2px;
            border-style:solid; 
            width:400px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
<div>
    <table width="100%">
<tr>
<td align="center">

       
<AdvLaser:Header ID="Header1" runat="server" StepNumber="7"  />   
<asp:Label runat="server" ID="lblTestSystem" Text="This is a test system" ForeColor="Red" Visible="false" />
</td>
</tr>
<tr>
<td align="center">
<!-- start asp table here -->
<asp:Table runat="server" ID="tblNoCustomer" Visible="false">
    <asp:TableRow runat="server">
        <asp:TableCell runat="server" ID="tdErrorMessage" ForeColor="Red">
        </asp:TableCell>
    </asp:TableRow>
</asp:Table>
<asp:Table runat="server" ID="tblContent">
<asp:TableRow runat="server">
<asp:TableCell runat="server" HorizontalAlign="Center">


<div class="holderdiv" style="text-align:center">
  <b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b>    

<div class="contentb2" style="text-align:center">        
<div style="text-align:center">
<table width="100%">
    <tr>
        <td align="center" >
            <div style="border-color:black;border-width:1px;border-style:solid; width:660px;text-align:center">
            <!--<div style="border-color:red;border-width:1px;border-style:solid; width:610px;height:150px">-->
            <table width="100%" cellpadding="0" cellspacing="0" >
                <tr>
                    <td class="header1">
                        <table width="100%">
                            <tr>
                                <td style="padding-left:100px;width:100%">Order Details</td>
                                <td>
                                    <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="../images/Edit-Cart.gif" CausesValidation="false" OnClick="btnEditCart_OnClick" />
                                </td>
                            </tr>
                        </table>
                    </td>    
                </tr>
                <tr>
                    <td >
                        <!--<div style="overflow:auto;width:600px;height:95px">-->
                        <asp:Table runat="server" ID="tblInvoiceItems" Width="100%" >
                        
                        <asp:TableRow runat="server">
                            <asp:TableCell runat="server" CssClass="header2">Product</asp:TableCell>
                            <asp:TableCell runat="server" CssClass="header2">Account</asp:TableCell>
                            <asp:TableCell runat="server" CssClass="header2">Description</asp:TableCell>
                            <asp:TableCell runat="server" CssClass="header2">Price</asp:TableCell>
                        </asp:TableRow>
                        </asp:Table>
                        <!--</div>-->
                    </td>
                </tr>

            </table>
            </div>
            
        </td>

    </tr>
    <tr>
        <td align="center">
            <table>
                <tr>
                    <td width="325px" align="left">
                        <div style="border-top: solid 1px black; border-left: solid 1px black;border-right: solid 1px black;width:325px;height:260px">
                        <table width="100%" cellpadding="0" cellspacing="0" >
                            <tr>
                                <td class="header1" >
                                    <table width="100%">
                                        <tr>
                                            <td align="left" style="width:100%">Customer Info</td>
                                            <td align="right">
                                                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="../images/Edit.gif" CausesValidation="false" OnClick="btnAddressEntry_OnClick" />
                                            </td>
                                        </tr>
                                    </table>                                                               
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                    <table width="100%" border="0px">
                                        <tr>
                                            <td class="confirm_page_label" style="text-align:left" width="100px">Company:</td>
                                            <td><asp:Label CssClass="confirm_page_label1" runat="server" ID="lblCompanyName" /></td>
                                        </tr>
                                        <tr>
                                            <td class="confirm_page_label" style="text-align:left"  width="100px">Name:</td>
                                            <td><asp:Label CssClass="confirm_page_label1" runat="server" ID="lblCustomerName" /></td>
                                        </tr>
                                        <tr>
                                            <td class="confirm_page_label" style="text-align:left" width="100px">EMail:</td>
                                            <td><asp:Label CssClass="confirm_page_label1" runat="server" ID="lblEMail" /></td>
                                        </tr>
                                        <tr>
                                            <td class="confirm_page_label" style="text-align:left" width="100px">Phone:</td>
                                            <td><asp:Label CssClass="confirm_page_label1" runat="server" ID="lblPhone" /></td>
                                        </tr>
                                        <tr>
                                            <td class="confirm_page_label" style="text-align:left" width="100px">Fax:</td>
                                            <td><asp:Label CssClass="confirm_page_label1" runat="server" ID="lblFax" /></td>
                                        </tr>
                                        <tr>
                                            <td class="confirm_page_label" style="text-align:left" width="100px">Billing Line 1:</td>
                                            <td><asp:Label CssClass="confirm_page_label1" runat="server" ID="lblBillingLine1" /></td>
                                        </tr>
                                        <tr>
                                            <td class="confirm_page_label" style="text-align:left" width="100px">Billing Line 2:</td>
                                            <td><asp:Label CssClass="confirm_page_label1" runat="server" ID="lblBillingLine2" /></td>
                                        </tr>
                                        <tr>
                                            <td class="confirm_page_label" style="text-align:left" width="100px">City, State, Zip:</td>
                                            <td><asp:Label CssClass="confirm_page_label1" runat="server" ID="lblBillingCityStateZip" /></td>
                                        </tr>

                                    </table>
                                </td>
                            </tr>
                            
                        </table>
                        </div>
                        <div style="text-align:right;width:325px;border-left: solid 1px black;border-bottom: solid 1px black;border-right: solid 1px black;">
                        <asp:Label ID="lblAddressError" runat="server" BackColor="Yellow" Text="Required Information is Missing" Visible="false" />
                        </div>
                    </td>
                    <td align="left">
                        <div style="border-top: solid 1px black; border-left: solid 1px black;border-right: solid 1px black;width:325px;height:260px">
                            <table width="100%" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="header1">
                                        <table width="100%">
                                        <tr>
                                            <td align="left" style="width:100%">Payment / Shipping Info</td>
                                            <td align="right">
                                                <asp:ImageButton runat="server" ImageUrl="../images/Edit.gif" CausesValidation="false" OnClick="btnShippingEntry_OnClick" />
                                            </td>
                                        </tr>
                                    </table>                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table width="100%">
                                            <tr>
                                                <td class="confirm_page_label" style="text-align:left;width:120px"><asp:Label ID="lblPayType1" runat="server" /> </td>
                                                <td><asp:Label CssClass="confirm_page_label1" runat="server" ID="lblCardType" /></td>
                                            </tr>
                                            <tr>
                                                <td class="confirm_page_label" style="text-align:left;width:120px"><asp:Label ID="lblPayType2" runat="server" /> </td>
                                                <td><asp:Label CssClass="confirm_page_label1" runat="server" ID="lblCardNumber" /></td>
                                            </tr>
                                            <tr>
                                                <td class="confirm_page_label" style="text-align:left;width:120px"><asp:Label ID="lblPayType3" runat="server" /></td>
                                                <td><asp:Label CssClass="confirm_page_label1" runat="server" ID="lblExpiration" /></td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="confirm_page_label" style="text-align:left;width:120px">Shipping Method:</td>
                                                <td> <asp:Label CssClass="confirm_page_label1" runat="server" ID="lblShippingMethod" /></td>
                                            </tr>
                                            <tr>
                                            
                                                <td class="confirm_page_label" style="text-align:left;width:120px">Expedite:</td>
                                                <td><asp:Label CssClass="confirm_page_label1" runat="server" ID="lblExpedite" /></td>
                                            </tr>
                                            <tr>
                                                <td class="confirm_page_label" style="text-align:left;width:120px">Shipping Line 1:</td>
                                                <td><asp:Label CssClass="confirm_page_label1" runat="server" ID="lblShippingLine1" /></td>
                                            </tr>
                                            <tr>
                                                <td class="confirm_page_label" style="text-align:left;width:120px">Shipping Line 2:</td>
                                                <td><asp:Label CssClass="confirm_page_label1" runat="server" ID="lblShippingLine2" /></td>
                                            </tr>
                                            <tr>
                                                <td class="confirm_page_label" style="text-align:left;width:120px">City, State, Zip:</td>
                                                <td><asp:Label CssClass="confirm_page_label1" runat="server" ID="lblShippingCityStateZip" /></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>

                            </table>
                        </div>
                        <div style="text-align:right;width:325px;border-left: solid 1px black;border-bottom: solid 1px black;border-right: solid 1px black;">
                        <asp:Label ID="lblShippingError" runat="server" BackColor="Yellow" Text="Required Information is Missing" Visible="false" />
                        </div>
                    </td>
                </tr>
            </table>
        </td>
        
    </tr>

</table>

</div>    
</div>

<b class="b4"></b><b class="b3"></b><b class="b2"></b><b class="b1"></b>
</div>

</asp:TableCell>
</asp:TableRow>
</asp:Table>
<!-- end asp table here -->
</td>
</tr>
<tr>
    <td style="text-align:center">
        <asp:ImageButton ImageUrl="../images/Place-Order.gif" runat="server"  OnClick="btnPlaceOrder_OnClick" ID="btnPlaceOrder" CssClass="nav_button" />
    </td>
</tr>
</table>
    </div>
    </form>
</body>
</html>
