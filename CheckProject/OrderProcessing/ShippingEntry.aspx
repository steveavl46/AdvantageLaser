<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShippingEntry.aspx.cs" Inherits="CheckProject.OrderProcessing.ShippingEntry" %>
<%@ Register TagPrefix="AdvLaser" TagName="Header" Src="../controls/Header.ascx" %>
<%@ Register TagPrefix="AdvLaser" TagName="ReqFld" Src="../controls/RequiredFieldIndicator.ascx" %>
<%@ Register TagPrefix="AdvLaser" TagName="CharsRemaining" Src="../controls/CharactersRemaining.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
     <link rel="stylesheet" href="../styles/checkproject.css" type="text/css">
     <script src="../js/common.js" type="text/javascript"></script>
     <script language="javascript">
         function showShippingRates() {
             window.open("ShippingRates.aspx");
         }

         function testWarning() {
             alert("Rush shipping does not apply to deposit stamps.\n The stamp will arrive separately");
         }
     </script>
    <style>
        .couponWarning{
            border-color:red;
            border-width:2px;
            border-style:solid; 
            width:400px;
            display:inline-block;
        }
        .couponSuccess{
            border-color:green;
            border-width:2px;
            border-style:solid; 
            width:400px;
            display:inline-block;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" defaultbutton="btnContinue" defaultfocus="ddlCreditCardType">
    <div>
    <table width="100%">
<tr>
<td align="center">

       
    <AdvLaser:Header runat="server" StepNumber="6"  />   
    <asp:Label runat="server" ID="lblTestSystem" Text="This is a test system" ForeColor="Red" Visible="false" />
</td>
</tr>
<tr>
<td align="center">
<div class="holderdiv" style="height:auto;">
  <b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b>    

<div class="contentb1b" style="height:auto">        
<div >
<asp:Table ID="Table1" runat="server" BorderColor="Red" BorderStyle="None" BorderWidth="1px">
                    <asp:TableRow runat="server">
                        <asp:TableCell runat="server" ColumnSpan="2">
                            <div style="margin-left:0px;border-color:Black;border-width:1px;border-style:solid">
                            <div style="margin-left:0px;" class="header1" width="100%">Payment Method</div>
                            <asp:Table runat="server"> 
                                <asp:TableRow ID="TableRow2" runat="server">
                                    <asp:TableCell ID="tdStart" runat="server"  VerticalAlign="Top" CssClass="entrylabel">
                                        Credit Card: <asp:RadioButton TabIndex="1" AutoPostBack="true" runat="server" ID="radCreditCard" OnCheckedChanged="radPaymentMethod_OnChanged" GroupName="PaymentMethod" />
                                    </asp:TableCell>
                                    <asp:TableCell ID="TableCell3" runat="server" cssclass="entrylabel">
                                        <asp:Label ID="Label1" runat="server" Text="Type:" />
                                    </asp:TableCell>
                                    <asp:TableCell ID="TableCell4" runat="server" CssClass="entrycell">
                                        <AdvLaser:ReqFld ID="reqAdvCreditCardType" runat="server" Required="true" />
                                        <asp:DropDownList CssClass="textinput" TabIndex="2" runat="server" ID="ddlCreditCardType" >
                                            <asp:ListItem Value="0" Text="Select"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator EnableClientScript="false" ID="reqCreditCardType" runat="server" ControlToValidate="ddlCreditCardType" ErrorMessage="Credit Card Type is required" Display="None" />
                                    </asp:TableCell>
                                    <asp:TableCell ID="TableCell7" runat="server" cssclass="entrylabel">
                                        <asp:Label ID="Label3" runat="server" Text="Expiration:" />
                                    </asp:TableCell>
                                    <asp:TableCell ID="TableCell8" runat="server" CssClass="entrycell">
                                        <AdvLaser:ReqFld ID="reqAdvCardExpiration" runat="server" Required="true" />
                                        <asp:DropDownList CssClass="textinput" runat="server" ID="ddlExpirationMonth" TabIndex="10" />
                                        <asp:DropDownList CssClass="textinput" runat="server" ID="ddlExpirationYear" TabIndex="11" />
                                        <asp:CustomValidator runat="server" ID="cstExpirationMonth" EnableClientScript="false" ControlToValidate="ddlExpirationMonth" OnServerValidate="CheckExpiration" />
                                        <asp:CustomValidator runat="server" ID="cstExpirationYear" EnableClientScript="false" ControlToValidate="ddlExpirationYear" OnServerValidate="CheckExpiration" />
                                    </asp:TableCell>
                                </asp:TableRow>
                               
                                <asp:TableRow ID="TableRow3"  runat="server">
                                    <asp:TableCell runat="server">&nbsp;</asp:TableCell>
                                    <asp:TableCell ID="TableCell5" runat="server" cssclass="entrylabel">
                                        <asp:Label ID="Label2" runat="server" Text="Card #:" />
                                    </asp:TableCell>
                                    <asp:TableCell ID="TableCell6" runat="server" CssClass="entrycell">
                                        <AdvLaser:ReqFld ID="reqAdvCreditCardNumber" runat="server" Required="true" />
                                        <asp:Textbox CssClass="textinput" runat="server" ID="txtCreditCardNumber" Columns="18" MaxLength="16" TabIndex="9"  />
                                        <asp:RequiredFieldValidator EnableClientScript="false" ID="reqCreditCardNumber" runat="server" ControlToValidate="txtCreditCardNumber" ErrorMessage="Credit Card # is required" Display="None" />
                                        <asp:RegularExpressionValidator  EnableClientScript="false" ID="regCreditCardNumber" runat="server" ControlToValidate="txtCreditCardNumber" Display="None" ErrorMessage="Credit card number does not pass validation" ValidationExpression="^(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14}|6(?:011|5[0-9][0-9])[0-9]{12}|3[47][0-9]{13})$" />
                                    </asp:TableCell>
                                     <asp:TableCell ID="TableCell9" runat="server" cssclass="entrylabel">
                                        <asp:Label ID="Label4" runat="server" Text="Security Code:" />
                                    </asp:TableCell>
                                    <asp:TableCell ID="TableCell10" runat="server" CssClass="entrycell">
                                        <AdvLaser:ReqFld ID="reqAdvSecurityCode" runat="server" Required="true" />
                                        <asp:TextBox CssClass="textinput" runat="server" id="txtSecurityCode" Columns="4" MaxLength="4" TabIndex="12"  />
                                        <asp:RequiredFieldValidator  EnableClientScript="false" ID="reqSecurityCode" runat="server" Display="None" ControlToValidate="txtSecurityCode" ErrorMessage="Security code is required" />
                                        <asp:RegularExpressionValidator  EnableClientScript="false" ID="regSecurityCode" runat="server" ControlToValidate="txtSecurityCode" Display="None" ErrorMessage="Security code is not in a valid format" ValidationExpression="^\d{3}$|^\d{4}$" />
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow ID="TableRow1" runat="server">
                                    <asp:TableCell ID="TableCell1" runat="server" ColumnSpan="5"><hr /></asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow ID="TableRow4"  runat="server">
                                    <asp:TableCell runat="server" CssClass="entrylabel">
                                        Debit my account:
                                        <asp:RadioButton AutoPostBack="true" runat="server" ID="radDebit" GroupName="PaymentMethod" OnCheckedChanged="radPaymentMethod_OnChanged" TabIndex="13" />
                                    </asp:TableCell>
                                    <asp:TableCell runat="server" CssClass="entrylabel">Account:</asp:TableCell>
                                    <asp:TableCell ID="TableCell11" runat="server" CssClass="entrycell">
                                        <AdvLaser:ReqFld ID="reqAdvDebitAccount" runat="server" Required="true" />
                                        <asp:DropDownList CssClass="textinput" runat="server" ID="ddlAccountToDebit" TabIndex="14">
                                            <asp:ListItem Value="" Text="Select" />
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator  EnableClientScript="false" ID="reqDebitAccount" runat="server" Display="None" ControlToValidate="ddlAccountToDebit"  />
                                    </asp:TableCell>
                                </asp:TableRow>
                                 <asp:TableRow ID="TableRow14" runat="server">
                                    <asp:TableCell ID="TableCell26" runat="server" ColumnSpan="5"><hr /></asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow ID="TableRow5" runat="server">
                                    <asp:TableCell runat="server" CssClass="entrylabel">
                                        Bill Me:
                                        <asp:RadioButton AutoPostBack="true" runat="server" ID="radBillMe" GroupName="PaymentMethod" OnCheckedChanged="radPaymentMethod_OnChanged" />
                                     </asp:TableCell>
                                     <asp:TableCell runat="server" CssClass="entrycell" ColumnSpan="3">
                                        Requires previous relationship.
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                            </div>
                        </asp:TableCell>
                    </asp:TableRow>
                    
<asp:TableRow runat="server">
    <asp:TableCell runat="server">
        <div style="margin-left:0px;border-width:1px;border-color:Black;border-style:solid">
        <div style="margin-left:0px;" class="header1" width="100%">
            Shipping Address
            
        </div>
        <asp:Table ID="Table2" runat="server">
            <asp:TableRow runat="server">
                <asp:TableCell runat="server" CssClass="entrylabel">Address:</asp:TableCell>
                <asp:TableCell runat="server" CssClass="entrycell">
                    <asp:CheckBox TabIndex="18" runat="server" ID="chkCopy" CausesValidation="false" OnCheckedChanged="chkCopy_Changed" AutoPostBack="true" />
                             Copy Billing Address
                </asp:TableCell>
            </asp:TableRow>
                    <asp:TableRow ID="TableRow6" runat="server">
                        <asp:TableCell ID="TableCell2" runat="server" cssclass="entrylabel">
                            <asp:Label ID="Label6" runat="server" Text="Line 1:" />
                        </asp:TableCell>
                        <asp:TableCell ID="TableCell12" runat="server" CssClass="entrycell">
                            <AdvLaser:ReqFld ID="ReqFld9" runat="server" Required="true" />
                            <asp:TextBox CssClass="textinput" runat="server" ID="txtShippingLine1" Columns="40" TabIndex="19" MaxLength="35" onblur="checkLimit(this,'ShippingLine1Counter');" onkeyup="checkLimit(this,'ShippingLine1Counter');"/>
                            <AdvLaser:CharsRemaining ID="ShippingLine1Counter" MaxLength="35" runat="server" />
                            <asp:RequiredFieldValidator  EnableClientScript="false" ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtShippingLine1" ErrorMessage="Shipping Line 1 is required" Display="None" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow ID="TableRow7" runat="server">
                        <asp:TableCell ID="TableCell13" runat="server" cssclass="entrylabel">
                            <asp:Label ID="Label7" runat="server" Text="Line 2:" />
                        </asp:TableCell>
                        <asp:TableCell ID="TableCell14" runat="server" CssClass="entrycell">
                            <AdvLaser:ReqFld ID="ReqFld11" runat="server" Required="false" />
                            <asp:TextBox CssClass="textinput" runat="server" ID="txtShippingLine2" Columns="40" TabIndex="20" MaxLength="35" onblur="checkLimit(this,'ShippingLine2Counter');" onkeyup="checkLimit(this,'ShippingLine2Counter');"/>
                            <AdvLaser:CharsRemaining ID="ShippingLine2Counter" MaxLength="35" runat="server" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow ID="TableRow8" runat="server">
                        <asp:TableCell ID="TableCell15" runat="server" cssclass="entrylabel">
                            <asp:Label ID="Label8" runat="server" Text="City:" />
                        </asp:TableCell>
                        <asp:TableCell ID="TableCell16" runat="server" CssClass="entrycell">
                            <AdvLaser:ReqFld ID="ReqFld13" runat="server" Required="true" />
                            <asp:TextBox CssClass="textinput" runat="server" ID="txtShippingCity" Columns="40" TabIndex="21" MaxLength="35" onblur="checkLimit(this,'ShippingCityCounter');" onkeyup="checkLimit(this,'ShippingCityCounter');"/>
                            <AdvLaser:CharsRemaining ID="ShippingCityCounter" MaxLength="35" runat="server" />
                            <asp:RequiredFieldValidator  EnableClientScript="false" ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtShippingCity" ErrorMessage="Shipping City is required" Display="None" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow ID="TableRow9" runat="server">
                        <asp:TableCell ID="TableCell17" runat="server" cssclass="entrylabel">
                            <asp:Label ID="Label9" runat="server" Text="State:" />
                        </asp:TableCell>
                        <asp:TableCell ID="TableCell18" runat="server" CssClass="entrycell">
                            <AdvLaser:ReqFld ID="ReqFld15" runat="server" Required="true" />
                            <asp:DropDownList CssClass="textinput" runat="server" ID="ddlShippingState" TabIndex="22" AutoPostBack="true">
                                <asp:ListItem Text="Select" Value="" />
                            </asp:DropDownList>         
                            <span class="entrylabel" style="padding-left:10px">Ground Rate:</span><span> <asp:Label runat="server" ID="lblGroundRate" CssClass="entrycell" /></span>
                            <asp:RequiredFieldValidator  EnableClientScript="false" ID="RequiredFieldValidator10" runat="server" ControlToValidate="ddlShippingState" ErrorMessage="Shipping State is required" Display="None" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow ID="TableRow10" runat="server">
                        <asp:TableCell ID="TableCell19" runat="server" cssclass="entrylabel">
                            <asp:Label ID="Label10" runat="server" Text="Zip Code:" />
                        </asp:TableCell>
                        <asp:TableCell ID="TableCell20" runat="server" CssClass="entrycell">
                            <AdvLaser:ReqFld ID="ReqFld17" runat="server" Required="true" />
                            <asp:TextBox CssClass="textinput" runat="server" ID="txtShippingZipCode" Columns="10" MaxLength="10" TabIndex="23" onblur="checkLimit(this,'ZipCodeCounter');" onkeyup="checkLimit(this,'ZipCodeCounter');"/>
                            <AdvLaser:CharsRemaining ID="ZipCodeCounter" MaxLength="10" runat="server" />
                            <asp:RequiredFieldValidator  EnableClientScript="false" ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtShippingZipCode" ErrorMessage="Shipping Zip Code is required" Display="None" />
                            <asp:RegularExpressionValidator  EnableClientScript="false" ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtShippingZipCode" Display="None" ErrorMessage="Shipping zip code format is not valid" ValidationExpression="^\d{5}$|^\d{5}\-\d{4}$" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow ID="TableRow11" runat="server">
                        <asp:TableCell ID="TableCell21" runat="server" CssClass="entrylabel" VerticalAlign="Top">Shipping:<asp:ImageButton runat="server" ImageUrl="../images/help/question_mark.jpg" Width="15px" Height="15px" style="padding-left:3px" OnClientClick="javascript:showShippingRates();return false;" /></asp:TableCell>
                        <asp:TableCell ID="TableCell22" runat="server" CssClass="entrycell" VerticalAlign="Top">
                            <!--<AdvLaser:ReqFld ID="ReqFld2" runat="server" Required="false" />-->
                            <asp:RadioButtonList runat="server" ID="radListShipping" style="font-size:small" OnSelectedIndexChanged="radShippingTypeChanged" AutoPostBack="true">
                                <asp:ListItem Text="Fed Ex Ground Shipping" Value="1" Selected="True" />
                                <asp:ListItem Text="RUSH 24 Hour Processing" Value="2" />
                            </asp:RadioButtonList>
                            <asp:RadioButtonList runat="server" ID="radExpediteSubType" style="margin-left:25px;font-size:small">

                            </asp:RadioButtonList>
                            
                            <!--<a href="javascript:showShippingRates();">info</a>-->
                        </asp:TableCell>
                    </asp:TableRow>
                   
                    <asp:TableRow ID="TableRow13" runat="server">
                        <asp:TableCell ID="TableCell25" runat="server" ColumnSpan="4">
                            <asp:Label runat="server" Visible="false"  ID="lblErrorMessage" />
                        </asp:TableCell>
                    </asp:TableRow>                
                </asp:Table>
                
                </div>
    </asp:TableCell>
</asp:TableRow>

                
                
                </asp:Table>   
    <div>
        <div>
            Referral Code: <asp:TextBox runat="server" ID="txtReferralCode" Columns="15" MaxLength="30" onKeyUP="this.value = this.value.toUpperCase();" />
        </div>
            <div>Coupon code? Enter it here <asp:TextBox runat="server" ID="txtCouponCode" Columns="8" MaxLength="8" onKeyUP="this.value = this.value.toUpperCase();" /> <asp:Button runat="server" ID="btnApply" Text="Apply" OnClick="btnApply_OnClick" /></div>
            <div><asp:Label runat="server" ID="lblCouponError" Text="" /></div>
        </div>                 
</div>    
</div>

        

<b class="b4"></b><b class="b3"></b><b class="b2"></b><b class="b1"></b>
</div>
</td>
</tr>
<tr>
    <td style="text-align:center">
        <asp:HiddenField runat="server" ID="hdnCouponKey" />
        <asp:HiddenField runat="server" ID="hdnCouponDiscount" />
        <asp:ImageButton ImageUrl="../images/Previous.gif" ID="LinkButton1" runat="server" Text="Previous" PostBackUrl="AddressEntry.aspx" OnClick="btnPrevious_OnClick" CausesValidation="false" OnClientClick="return confirmCancel()" /> 
        <asp:ImageButton ImageUrl="../images/Continue.gif" runat="server" ID="btnContinue" OnClick="btnContinue_OnClick" Text="Continue" />
    </td>
</tr>
</table>
    </div>
    </form>
</body>
</html>
