<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddressEntry.aspx.cs" Inherits="CheckProject.OrderProcessing.AddressEntry" %>
<%@ Register TagPrefix="AdvLaser" TagName="Header" Src="../controls/Header.ascx" %>
<%@ Register TagPrefix="AdvLaser" TagName="ReqFld" Src="../controls/RequiredFieldIndicator.ascx" %>
<%@ Register TagPrefix="AdvLaser" TagName="CharsRemaining" Src="../controls/CharactersRemaining.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">


    
    
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="../styles/checkproject.css" type="text/css">
    <script src="../js/common.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server" defaultbutton="btnContinue" defaultfocus="txtCompanyName">
    <div>
    <table width="100%" style="border-color:Red;border-style:solid;border-width:0px">
<tr>
<td align="center">

       
    <AdvLaser:Header ID="Header1" runat="server" StepNumber="5"  />     
    <asp:Label runat="server" ID="lblTestSystem" Text="This is a test system" ForeColor="Red" Visible="false" />
</td>
</tr>
<tr>
<td align="center">
<div class="holderdiv">
  <b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b>    

<div class="contentb1">        
<div >
    <table width="100%">
        <tr>
            <td>
            <div style="margin-left:0px;border-width:1px;border-color:Black;border-style:solid">
        <div style="margin-left:0px;" class="header1" width="100%">
            Customer Info            
        </div>
        <asp:Table ID="Table1" runat="server" BorderColor="Red" BorderStyle="none" BorderWidth="1px" Width="100%">
                    <asp:TableRow ID="TableRow5"  runat="server">
                        <asp:TableCell ID="TableCell9"  runat="server" cssclass="entrylabel" Width="200px">
                            <asp:Label ID="Label5"  runat="server" Text="Company Name:" />
                        </asp:TableCell>
                        <asp:TableCell ID="TableCell10"  runat="server" CssClass="entrycell">
                            <AdvLaser:ReqFld ID="ReqFld1"  runat="server" Required="false" />
                            <asp:TextBox CssClass="textinput" runat="server" ID="txtCompanyName" Columns="40" TabIndex="1" MaxLength="35" onblur="checkLimit(this,'CompanyNameCounter');" onkeyup="checkLimit(this,'CompanyNameCounter');"/>
                            <AdvLaser:CharsRemaining ID="CompanyNameCounter" MaxLength="35" runat="server" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow ID="TableRow6"  runat="server">
                        <asp:TableCell ID="TableCell11"  runat="server" cssclass="entrylabel">
                            <asp:Label ID="Label6" runat="server" Text="First Name:" />
                        </asp:TableCell>
                        <asp:TableCell ID="TableCell12"  runat="server" CssClass="entrycell">
                            <AdvLaser:ReqFld ID="ReqFld2"  runat="server" Required="true" />                            
                            <asp:TextBox cssclass="textinput" runat="server" ID="txtFirstName" Columns="40" TabIndex="2" MaxLength="35" onblur="checkLimit(this,'FirstNameCounter');" onkeyup="checkLimit(this,'FirstNameCounter');"/>
                            <AdvLaser:CharsRemaining ID="FirstNameCounter" MaxLength="35" runat="server" />
                            <asp:RequiredFieldValidator EnableClientScript="false" ID="RequiredFieldValidator6"  runat="server" ControlToValidate="txtFirstName" ErrorMessage="required" Display="None" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow ID="TableRow7"  runat="server">
                        <asp:TableCell ID="TableCell13"  runat="server" cssclass="entrylabel">
                            <asp:Label ID="Label7"  runat="server" Text="Last Name:" />
                        </asp:TableCell>
                        <asp:TableCell ID="TableCell14"  runat="server" CssClass="entrycell">
                            <AdvLaser:ReqFld ID="ReqFld3" runat="server" Required="true" />
                            <asp:TextBox CssClass="textinput" runat="server" ID="txtLastName" Columns="40" TabIndex="3" MaxLength="35" onblur="checkLimit(this,'LastNameCounter');" onkeyup="checkLimit(this,'LastNameCounter');"/>
                            <AdvLaser:CharsRemaining ID="LastNameCounter" MaxLength="35" runat="server" />
                            <asp:RequiredFieldValidator EnableClientScript="false" ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLastName" ErrorMessage="required" Display="None" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow ID="TableRow8"  runat="server">
                        <asp:TableCell ID="TableCell15" runat="server" cssclass="entrylabel">
                            <asp:Label ID="Label8"  runat="server" Text="EMail Address:" />
                        </asp:TableCell>
                        <asp:TableCell ID="TableCell16"   runat="server" CssClass="entrycell">
                            <AdvLaser:ReqFld ID="ReqFld4" runat="server" Required="true" />
                            <asp:TextBox CssClass="textinput" runat="server" ID="txtEMailAddress" Columns="40" TabIndex="4" MaxLength="50" onblur="checkLimit(this,'EMailCounter');" onkeyup="checkLimit(this,'EMailCounter');"/>
                            <AdvLaser:CharsRemaining ID="EMailCounter" MaxLength="50" runat="server" />
                            <asp:RequiredFieldValidator EnableClientScript="false" ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtEMailAddress" ErrorMessage="required" Display="None" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow ID="TableRow9"  runat="server">
                        <asp:TableCell ID="TableCell17"  runat="server" cssclass="entrylabel">
                            <asp:Label ID="Label9"  runat="server" Text="Confirm EMail Address:" />
                        </asp:TableCell>
                        <asp:TableCell ID="TableCell18"  runat="server" CssClass="entrycell">
                            <AdvLaser:ReqFld ID="ReqFld5" runat="server" Required="true" />
                            <asp:TextBox CssClass="textinput" runat="server" ID="txtConfirmEMailAddress" Columns="40" TabIndex="5" MaxLength="50" onblur="checkLimit(this,'ConfirmEMailCounter');" onkeyup="checkLimit(this,'ConfirmEMailCounter');"/>
                            <AdvLaser:CharsRemaining ID="ConfirmEMailCounter" MaxLength="50" runat="server" />
                            <asp:RequiredFieldValidator EnableClientScript="false" ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtConfirmEMailAddress" Display="None" ErrorMessage="required" />
                            <asp:CompareValidator EnableClientScript="false" ID="CompareValidator1" runat="server" ControlToCompare="txtEmailAddress" ControlToValidate="txtConfirmEMailAddress" Display="None" ErrorMessage="Please verify email address" Operator="Equal" Type="String" />
                        </asp:TableCell>
                        
                    </asp:TableRow>
                    <asp:TableRow ID="TableRow11"  runat="server">
                        <asp:TableCell ID="TableCell19"  runat="server" cssclass="entrylabel">
                            <asp:Label ID="Label10"  runat="server" Text="Phone Number:" />
                        </asp:TableCell>
                        <asp:TableCell ID="TableCell20"  runat="server" CssClass="entrycell">
                            <AdvLaser:ReqFld ID="ReqFld6" runat="server" Required="true" />
                            <asp:TextBox CssClass="textinput" runat="server" Columns="15" MaxLength="30" ID="txtPhoneNumber" TabIndex="6" onblur="checkLimit(this,'PhoneCounter');" onkeyup="checkLimit(this,'PhoneCounter');"/>
                            <AdvLaser:CharsRemaining ID="PhoneCounter" MaxLength="30" runat="server" />
                            <asp:RequiredFieldValidator EnableClientScript="false" ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPhoneNumber" ErrorMessage="required" Display="None" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow ID="TableRow12"  runat="server">
                        <asp:TableCell ID="TableCell21"  runat="server" cssclass="entrylabel">
                            <asp:Label ID="Label11"  runat="server" Text="Fax Number:" />
                        </asp:TableCell>
                        <asp:TableCell ID="TableCell22"  runat="server" CssClass="entrycell">
                            <AdvLaser:ReqFld ID="ReqFld7" runat="server" Required="false" />
                            <asp:TextBox CssClass="textinput" runat="server" Columns="15" MaxLength="30" ID="txtFaxNumber" TabIndex="7"  onblur="checkLimit(this,'FaxCounter');" onkeyup="checkLimit(this,'FaxCounter');"/>
                            <AdvLaser:CharsRemaining ID="FaxCounter" MaxLength="30" runat="server" />
                        </asp:TableCell>
                    </asp:TableRow>
 </asp:Table>
</div>   
            </td>
        </tr>
    </table>
 
 <asp:Table runat="server" Width="100%">
 <asp:TableRow runat="server">
    <asp:TableCell runat="server">
        <div style="margin-left:0px;border-width:1px;border-color:Black;border-style:solid">
        <div style="margin-left:0px;" class="header1" width="100%">
            Billing Address
            
        </div>
        <asp:Table runat="server" Width="100%">
            <asp:TableRow ID="TableRow1" runat="server">
                        <asp:TableCell ID="TableCell1"  runat="server" cssclass="entrylabel" Width="200px">
                            <asp:Label ID="Label1"  runat="server" Text="Line 1:" />
                        </asp:TableCell>
                        <asp:TableCell ID="TableCell2"  runat="server" CssClass="entrycell">
                            <AdvLaser:ReqFld ID="ReqFld8" runat="server" Required="true" />
                            <asp:TextBox CssClass="textinput" runat="server" ID="txtBillingLine1" Columns="40" TabIndex="8" MaxLength="35" onblur="checkLimit(this,'BillingLine1Counter');" onkeyup="checkLimit(this,'BillingLine1Counter');"/>
                            <AdvLaser:CharsRemaining ID="BillingLine1Counter" MaxLength="35" runat="server" />
                            <asp:RequiredFieldValidator EnableClientScript="false" ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtBillingLine1" ErrorMessage="required" Display="None" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow ID="TableRow2"  runat="server">
                        <asp:TableCell ID="TableCell3"  runat="server" cssclass="entrylabel">
                            <asp:Label ID="Label2"  runat="server" Text=" Line 2:" />
                        </asp:TableCell>
                        <asp:TableCell ID="TableCell4"  runat="server" CssClass="entrycell">
                            <AdvLaser:ReqFld ID="ReqFld10" runat="server" Required="false" />
                            <asp:TextBox CssClass="textinput" runat="server" ID="txtBillingLine2" Columns="40" TabIndex="9" MaxLength="35" onblur="checkLimit(this,'BillingLine2Counter');" onkeyup="checkLimit(this,'BillingLine2Counter');"/>
                            <AdvLaser:CharsRemaining ID="BillingLine2Counter" MaxLength="35" runat="server" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow ID="TableRow10" runat="server" >
                        <asp:TableCell ID="TableCell23" runat="server" cssclass="entrylabel">
                            <asp:Label ID="Label13" runat="server" Text="City:" />
                        </asp:TableCell>
                        <asp:TableCell ID="TableCell24"  runat="server" CssClass="entrycell">
                            <AdvLaser:ReqFld ID="ReqFld12" runat="server" Required="true" />
                            <asp:TextBox CssClass="textinput" runat="server" ID="txtBillingCity" Columns="40" TabIndex="10" MaxLength="35" onblur="checkLimit(this,'BillingLine3Counter');" onkeyup="checkLimit(this,'BillingLine3Counter');"/>
                            <AdvLaser:CharsRemaining ID="BillingLine3Counter" MaxLength="35" runat="server" />
                            <asp:RequiredFieldValidator EnableClientScript="false" ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtBillingCity" ErrorMessage="required" Display="None" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow ID="TableRow3" runat="server">
                        <asp:TableCell ID="TableCell5" runat="server" cssclass="entrylabel">
                            <asp:Label ID="Label3" runat="server" Text="State:" />
                        </asp:TableCell>
                        <asp:TableCell ID="TableCell6" runat="server" CssClass="entrycell">
                            <AdvLaser:ReqFld ID="ReqFld14" runat="server" Required="true" />
                            <asp:DropDownList CssClass="textinput" runat="server" ID="ddlBillingState" TabIndex="11">
                                <asp:ListItem Text="Select" Value="" />
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator EnableClientScript="false" ID="RequiredFieldValidator9" runat="server" ControlToValidate="ddlBillingState" ErrorMessage="required" Display="None" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow ID="TableRow4" runat="server">
                        <asp:TableCell ID="TableCell7" runat="server" cssclass="entrylabel">
                            <asp:Label ID="Label4" runat="server" Text="Zip Code:" />
                        </asp:TableCell>
                        <asp:TableCell ID="TableCell8" runat="server" CssClass="entrycell">
                            <AdvLaser:ReqFld ID="ReqFld16" runat="server" Required="true" />
                            <asp:TextBox CssClass="textinput" runat="server" ID="txtBillingZipCode" Columns="10" MaxLength="10" TabIndex="12" onblur="checkLimit(this,'BillingZipCounter');" onkeyup="checkLimit(this,'BillingZipCounter');"/>
                            <AdvLaser:CharsRemaining ID="BillingZipCounter" MaxLength="10" runat="server" />
                            <asp:RequiredFieldValidator EnableClientScript="false" ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtBillingZipCode" ErrorMessage="required" Display="None" />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" enableclientscript="false" runat="server" ControlToValidate="txtBillingZipCode" Display="None" ErrorMessage="format ######" ValidationExpression="^\d{5}$|^\d{5}\-\d{4}$" />
                        </asp:TableCell>

                    </asp:TableRow>
        </asp:Table>  
        </div>  
    </asp:TableCell>
 </asp:TableRow>                   
                    
                    
                    
                        
                    <asp:TableRow runat="server">
                        <asp:TableCell runat="server" ColumnSpan="2">
                            <asp:Label runat="server" Visible="false"  ID="lblErrorMessage" />
                        </asp:TableCell>
                    </asp:TableRow>                
                </asp:Table>

</div>    
</div>

<b class="b4"></b><b class="b3"></b><b class="b2"></b><b class="b1"></b>
</div>
</td>
</tr>
<tr>
    <td style="text-align:center">
        <asp:ImageButton ImageUrl="../images/Previous.gif" ID="LinkButton1" runat="server"  OnClick="btnPrevious_OnClick" CausesValidation="false" OnClientClick="return confirmCancel()" TabIndex="13" /> 
        <asp:ImageButton ImageUrl="../images/Continue.gif" runat="server" ID="btnContinue" OnClick="btnContinue_OnClick"  TabIndex="14" />
    </td>
</tr>
</table>
    </div>
    </form>
</body>
</html>
