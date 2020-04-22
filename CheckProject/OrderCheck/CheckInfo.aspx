<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckInfo.aspx.cs" Inherits="CheckProject.OrderCheck.CheckInfo" %>
<%@ Register TagPrefix="AdvLaser" TagName="ReqFld" Src="../controls/RequiredFieldIndicator.ascx" %>
<%@ Register TagPrefix="AdvLaser" TagName="CharsRemaining" Src="../controls/CharactersRemaining.ascx" %>
<%@ Register TagPrefix="AdvLaser" TagName="Header" Src="../controls/Header.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
        <link rel="stylesheet" href="../styles/checkproject.css" type="text/css">
        <script src="../js/jquery-1.3.2.min.js" type="text/javascript"></script>
        <script src="../js/common.js" type="text/javascript"></script>
        <script src="../js/jquery.maskedinput-1.2.2.js" type="text/javascript"></script>
        <script type="text/javascript" language="javascript">
            

        jQuery(function($){
           $("#txtRoutingNumber").mask("999999999");
        });


        </script>   
</head>
<body>
    <form id="form1" runat="server" defaultbutton="btnContinue" defaultfocus="ddlProductList">
    <asp:HiddenField ID="txtProductKey" runat="server" />
    <div>
        <table width="100%">
<tr>
<td align="center">
       
    <AdvLaser:Header ID="Header1" runat="server" StepNumber="2"  />   
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
            <td colspan="2" align="center"><asp:Label runat="server" ID="lblProductDescription" CssClass="header1" Width="100%" /></td>
        </tr>
        <tr>
            <td class="entrylabel" style="width:200px">Quantity:</td>
            <td class="entrycell">
                <AdvLaser:ReqFld ID="ReqFld1" runat="server" Required="false" />
                <asp:DropDownList CssClass="textinput" runat="server" ID="ddlProductList" />
            </td>
        </tr>
        <tr>
            <td class="entrylabel" >Starting Number:</td>
            <td class="entrycell">
                <AdvLaser:ReqFld ID="ReqFld11" runat="server" Required="true" />
                <asp:TextBox runat="server" ID="txtStartingNumber" CssClass="textinput" Columns="15" MaxLength="8" onblur="checkLimit(this,'StartingNumberCounter');" onkeyup="checkLimit(this,'StartingNumberCounter');"  OnTextChanged="Set_To_Unapproved"/>
                <AdvLaser:CharsRemaining ID="StartingNumberCounter" MaxLength="8" runat="server" />
                <asp:RequiredFieldValidator runat="server" Display="None" EnableClientScript="false" ControlToValidate="txtStartingNumber" ErrorMessage="Starting number is required" />
                <asp:RegularExpressionValidator ID="reStartingNumber" enableclientscript="false"  runat="server" Display="None" ControlToValidate="txtStartingNumber" ErrorMessage="Starting number must be numeric" ValidationExpression="^[0-9X-]+$" />
            </td>
        </tr>
        <tr>
            <td class="entrylabel">Check Order:</td>
            <td class="entrycell">
                <AdvLaser:ReqFld ID="ReqFld12" runat="server" Required="true" />
                <asp:DropDownList runat="server" CssClass="textinput" ID="ddlCheckOrder" />
            </td>
        </tr>
        <asp:PlaceHolder runat="server" ID="hldrLineInfo">
            <tr>
                <td class="entrylabel">
                    <asp:Label ID="Label1"  runat="server" Text="Line 1:" />
                </td>
                <td class="entrycell">
                    <AdvLaser:ReqFld ID="ReqFld2"  runat="server" Required="true" />
                    <asp:RequiredFieldValidator EnableClientScript="false" ID="reqLine1"  runat="server" ControlToValidate="txtLine1" ErrorMessage="Line 1 is required" Display="None" />
                    <asp:TextBox cssclass="textinput" runat="server" ID="txtLine1" Columns="40" MaxLength="35" onblur="checkLimit(this,'Line1Counter');" onkeyup="checkLimit(this,'Line1Counter');"  OnTextChanged="Set_To_Unapproved"/>
                    <AdvLaser:CharsRemaining ID="Line1Counter" MaxLength="35" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="entrylabel">
                    <asp:Label ID="Label2"   runat="server" Text="Line 2:" />
                </td>
                <td class="entrycell">
                    <AdvLaser:ReqFld ID="ReqFld3"  runat="server" Required="false" />
                    <asp:TextBox CssClass="textinput" runat="server" ID="txtLine2" Columns="40" MaxLength="35" onblur="checkLimit(this,'Line2Counter');" onkeyup="checkLimit(this,'Line2Counter');"  OnTextChanged="Set_To_Unapproved"/>
                    <AdvLaser:CharsRemaining ID="Line2Counter" MaxLength="35" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="entrylabel" >
                    <asp:Label ID="Label3"  runat="server" Text="Line 3:" />
                </td>
                <td class="entrycell">
                    <AdvLaser:ReqFld ID="ReqFld4"  runat="server" Required="false" />
                    <asp:TextBox CssClass="textinput" runat="server" ID="txtLine3" Columns="40" MaxLength="35" onblur="checkLimit(this,'Line3Counter');" onkeyup="checkLimit(this,'Line3Counter');"  OnTextChanged="Set_To_Unapproved"/>
                    <AdvLaser:CharsRemaining ID="Line3Counter" MaxLength="35" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="entrylabel">
                    <asp:Label ID="Label4"  runat="server" Text="Line 4:" />
                </td>
                <td class="entrycell">
                    <AdvLaser:ReqFld ID="ReqFld5"  runat="server" Required="false" />
                    <asp:TextBox CssClass="textinput" runat="server" ID="txtLine4" Columns="40" MaxLength="35" onblur="checkLimit(this,'Line4Counter');" onkeyup="checkLimit(this,'Line4Counter');"  OnTextChanged="Set_To_Unapproved"/>
                    <AdvLaser:CharsRemaining ID="Line4Counter" MaxLength="35" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="entrylabel">
                    <asp:Label ID="Label5"  runat="server" Text="Line 5:" />
                </td>
                <td class="entrycell">
                    <AdvLaser:ReqFld ID="ReqFld6"  runat="server" Required="false" />
                    <asp:TextBox CssClass="textinput" runat="server" ID="txtLine5" Columns="40" MaxLength="35" onblur="checkLimit(this,'Line5Counter');" onkeyup="checkLimit(this,'Line5Counter');"  OnTextChanged="Set_To_Unapproved"/>
                    <AdvLaser:CharsRemaining ID="Line5Counter" MaxLength="35" runat="server" />
                </td>
            </tr>
        </asp:PlaceHolder>
        <tr>
            <td class="entrylabel">
                <asp:Label ID="Label6" runat="server" Text="Bank Account #:" />
            </td>
            <td class="entrycell">
                <AdvLaser:ReqFld ID="ReqFld7" runat="server" Required="true" />
                <asp:TextBox CssClass="textinput" runat="server" ID="txtBankAccountNumber" Columns="20" MaxLength="18" onblur="checkLimit(this,'AccountCounter');" onkeyup="checkLimit(this,'AccountCounter');"  OnTextChanged="Set_To_Unapproved"/> 
                <img border="0" title="Explain..." alt="help" style="vertical-align:middle" src="../images/help/question_mark.jpg" onclick="javascript:showHelpImage(2)" />
                <AdvLaser:CharsRemaining ID="AccountCounter" MaxLength="18" runat="server" />
                <asp:RequiredFieldValidator ID="reqBankAccountNumber" enableclientscript="false"  runat="server" Display="None" ControlToValidate="txtBankAccountNumber" ErrorMessage="Bank account number is required" />
                <asp:RegularExpressionValidator ID="reBankAccountNumber" enableclientscript="false"  runat="server" Display="None" ControlToValidate="txtBankAccountNumber" ErrorMessage="Bank account number must contain 0 through 9, '-', or 'A', 'B', 'C', 'D'" ValidationExpression="^[A-D 0-9X-]+$" />
            </td>
        </tr>
        <tr>
            <td class="entrylabel">
                <asp:Label ID="Label7"  runat="server" Text="Routing #:" />
            </td>
            <td class="entrycell">
                <AdvLaser:ReqFld ID="ReqFld8"  runat="server" Required="true" />
                <asp:TextBox CssClass="textinput" runat="server" ID="txtRoutingNumber" Columns="9" MaxLength="9"  OnTextChanged="Set_To_Unapproved" />
                <img title="Explain..." onclick="javascript:showHelpImage(1)" border="0" alt="help" style="vertical-align:middle" src="../images/help/question_mark.jpg" />
                <asp:RequiredFieldValidator ID="reqRoutingNumber" enableclientscript="false"  runat="server" ControlToValidate="txtRoutingNumber" ErrorMessage="Routing number is required" Display="None" />
                <asp:RegularExpressionValidator ID="reRoutingNumber" enableclientscript="false" runat="server" ControlToValidate="txtRoutingNumber" ErrorMessage="Routing number must be 9 digits" ValidationExpression="\d{9}" Display="None" />
                <asp:CustomValidator ID="valRoutingNumber" EnableClientScript="false" runat="server" ControlToValidate="txtRoutingNumber" ErrorMessage="Routing number is not valid" Display="None" />
            </td>
        </tr>
        <tr>
            <td class="entrylabel">
                <asp:Label ID="Label8"  runat="server" Text="Bank Fraction" />
            </td>
            <td class="entrycell">
                <AdvLaser:ReqFld ID="ReqFld9"  runat="server" Required="false" />
                <asp:TextBox CssClass="textinput" runat="server" ID="txtBankFraction" Columns="20" MaxLength="20"  OnTextChanged="Set_To_Unapproved"/>
                <img title="Explain..." onclick="javascript:showHelpImage(3)" border="0" alt="help" style="vertical-align:middle" src="../images/help/question_mark.jpg" />
            </td>
        </tr>
        <tr>
            <td class="entrylabel">
                <asp:Label ID="Label9" runat="server" Text="Bank Line 1:" />
            </td>
            <td class="entrycell">
                <AdvLaser:ReqFld ID="ReqFld10"   runat="server" Required="true" />
                <asp:TextBox CssClass="textinput" runat="server" ID="txtBankInfoLine1" Columns="40" MaxLength="35" onblur="checkLimit(this,'BankInfoLine1Counter');" onkeyup="checkLimit(this,'BankInfoLine1Counter');"  OnTextChanged="Set_To_Unapproved"/>
                <AdvLaser:CharsRemaining ID="BankInfoLine1Counter" MaxLength="35" runat="server" />
                <asp:RequiredFieldValidator ID="reqBankInfoLine1" enableclientscript="false"  runat="server" ControlToValidate="txtBankInfoLine1" Display="None" ErrorMessage="Bank Line 1 is required" />
            </td>
        </tr>
        <tr>
            <td class="entrylabel">
                <asp:Label ID="Label12" runat="server" Text="Bank Line 2:" />
            </td>
            <td class="entrycell">
                <AdvLaser:ReqFld ID="ReqFld13" runat="server" Required="false" />
                <asp:TextBox runat="server" CssClass="textinput" ID="txtBankInfoLine2" Columns="40" MaxLength="35" onblur="checkLimit(this, 'BankInfoLine2Counter');" onkeyup="checkLimit(this,'BankInfoLine2Counter');"  OnTextChanged="Set_To_Unapproved" />
                <AdvLaser:CharsRemaining ID="BankInfoLine2Counter" MaxLength="35" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="entrylabel">
                <asp:Label ID="Label13" runat="server" Text="Bank Line 3:" />
            </td>
            <td class="entrycell">
                <AdvLaser:ReqFld ID="ReqFld14" runat="server" Required="false" />
                <asp:TextBox runat="server" CssClass="textinput" ID="txtBankInfoLine3" Columns="40" MaxLength="35" onblur="checkLimit(this, 'BankInfoLine3Counter');" onkeyup="checkLimit(this,'BankInfoLine3Counter');"  OnTextChanged="Set_To_Unapproved"/>
                <AdvLaser:CharsRemaining ID="BankInfoLine3Counter" MaxLength="35" runat="server" />
            </td>
        </tr>

        <tr>
            <td>&nbsp;</td>
            <td align="left">                
                <asp:Label runat="server" Visible="false"  ID="lblErrorMessage"  />
            </td>
        </tr>
        </table>

</div>    
</div>

<b class="b4"></b><b class="b3"></b><b class="b2"></b><b class="b1"></b>
</div>
</td>
</tr>
<tr>
    <td style="text-align:center">
        <asp:ImageButton ID="ImageButton1" ImageUrl="../images/Cancel.gif" runat="server"  OnClick="btnCancel_OnClick" OnClientClick="return confirmCancel(); return false;" CssClass="nav_button" CausesValidation="false" /> 
        <asp:ImageButton ImageUrl="../images/Continue-To-Preview.gif" runat="server" ID="btnContinue" OnClick="btnContinue_OnClick"  />
    </td>
</tr>
</table>
    </div>
    </form>
</body>
</html>
