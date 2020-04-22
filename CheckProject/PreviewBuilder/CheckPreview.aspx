<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckPreview.aspx.cs" Inherits="CheckProject.PreviewBuilder.CheckPreview" %>
<%@ Register TagPrefix="AdvLaser" TagName="Header" Src="../controls/Header.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="../styles/checkproject.css" type="text/css"/>
    <script src="../js/common.js" type="text/javascript" ></script>
    <script type="text/javascript" language="javascript">
        function openLogoUpload() {
            var ctlAccountNumber = document.getElementById("hdnAccountNumber");
            var ctlRoutingNumber = document.getElementById("hdnRoutingNumber");
            var ctlProductKey = document.getElementById("hdnProductKey");
            var accountNumber = ctlAccountNumber.value;
            var routingNumber = ctlRoutingNumber.value;
            var productKey = ctlProductKey.value;
            var url = "LogoFinder.aspx?AccountNumber=" + accountNumber + "&RoutingNumber=" + routingNumber + "&ProductKey=" + productKey ;
            window.open(url,'','toolbar=no,menubar=no,height=400px');
        }

        function openNudge() {
            var ctlAccountNumber = document.getElementById("hdnAccountNumber");
            var ctlProductKey = document.getElementById("hdnProductKey");
            var accountNumber = ctlAccountNumber.value;
            var productKey = ctlProductKey.value;
            var url = "../nudge.aspx?AccountNumber=" + accountNumber + "&ProductKey=" + productKey;
            window.open(url, '', 'toolbar=no,menubar=no,height=150px,width=50px');
        }

        function openFullCheckPreview(bDone) {
            var ctlAccountNumber = document.getElementById("hdnAccountNumber");
            var ctlRoutingNumber = document.getElementById("hdnRoutingNumber");
            var ctlProductKey = document.getElementById("hdnProductKey");
            var accountNumber = ctlAccountNumber.value;
            var routingNumber = ctlRoutingNumber.value;
            var productKey = ctlProductKey.value;
            var url = "FullCheckPreview.aspx?Done=" + bDone + "&AccountNumber=" + accountNumber + "&RoutingNumber=" + routingNumber + "&ProductKey=" + productKey;
            var popUp = window.open(url, '', 'toolbar=no,menubar=no,scrollbars=yes,height=1200px,width=800px');
            if (popUp == null || typeof (popUp) == 'undefined') {
                alert('Your popup blocker blocked the Approval/Preview page, Click the Preview Check link to approve your check.');
            }
            else {
                popUp.focus();
            }
        }

        function isApproved() {
            var ctl = document.getElementById("lblApproved");
            if (!ctl.innerText) {
                return (ctl.textContent== 'Yes');
            }
            return ctl.innerText == 'Yes';
        }

        function verifyApproved() {
            if (!isApproved()) {
                alert("Please approve the check before continuing.");
                openFullCheckPreview(true);
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server" defaultbutton="btnContinue" >   
    <asp:HiddenField runat="server" ID="hdnAccountNumber" />
    <asp:HiddenField runat="server" ID="hdnRoutingNumber" />
    <asp:HiddenField runat="server" ID="hdnProductKey" />

<table width="100%">
<tr>
<td align="center">
       
    <AdvLaser:Header ID="Header1" runat="server" StepNumber="3"  />    
    <asp:Label runat="server" ID="lblTestSystem" Text="This is a test system" ForeColor="Red" Visible="false" />
</td>
</tr>
<tr>
<td align="center">
<div class="holderdiv">
  <b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b>    

<div class="contentb1b" style="<%=ExtraHeight%>">        

<table>
        <tr>
            <td align="center"><asp:Label runat="server" ID="lblProductDescription" CssClass="header1" Width="100%" /></td>
        </tr>
        <tr>
            <td>
            
            Please approve the check by viewing the full preview and then click 'Continue'.
            </td>
        </tr>
        <tr>
            <td><asp:Image runat="server" id="imgConfirm"/></td>
        </tr>
        <tr>
            <td>
                <table border="0" width="100%">
                    <tr>
                        <td valign="top">
                            <table>
                                <tr>
                                    <td colspan="2" align="center" style="font-weight:bold">Address Block</td>
                                </tr>
                                <tr>
                                    <td class="entrylabel_small_left">Align:</td>
                                    <td align="left"><asp:DropDownList runat="server" ID="ddlAlignment" AutoPostBack="true" OnSelectedIndexChanged="Set_To_Unapproved" /></td>
                                </tr>
                                <asp:PlaceHolder runat="server" ID="holderTypeFace">
                                    <tr>
                                        <td class="entrylabel_small_left">Typeface:</td>
                                        <td align="left"><asp:DropDownList style="font-size:small" runat="server" ID="ddlTypeFace" AutoPostBack="true" OnSelectedIndexChanged="Set_To_Unapproved" /></td>
                                    </tr>
                                </asp:PlaceHolder>
                                <asp:PlaceHolder runat="server" ID="holderLineBold">
                                    <tr>
                                        <td class="entrylabel_small_left">Line 1 Bold:</td>
                                        <td align="left"><asp:Checkbox CssClass="entrylabel_small" runat="server" ID="chkLine1Bold" AutoPostBack="true" TextAlign="Right" Checked="true" OnCheckedChanged="Set_To_Unapproved" /></td>
                                    </tr>                                
                                    <tr>
                                        <td class="entrylabel_small_left">Line 2 Bold:</td>
                                        <td align="left"><asp:CheckBox CssClass="entrylabel_small" runat="server" ID="chkLine2Bold" AutoPostBack="true" TextAlign="Right" OnCheckedChanged="Set_To_Unapproved" /></td>
                                    </tr>
                                </asp:PlaceHolder>
                                <asp:PlaceHolder runat="server" ID="holderSuppressLine1">
                                    <tr>
                                        <td class="entrylabel_small_left">Suppress Line 1:</td>
                                        <td align="left">
                                            <asp:CheckBox CssClass="entrylabel_small" runat="server" ID="chkSuppressLine1" AutoPostBack="true" OnCheckChanged="Set_To_Unapproved" />
                                        </td>
                                    </tr>
                                </asp:PlaceHolder>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr>
                                    <td class="entrylabel_small_left"><asp:Label runat="server" Text="Check Color:" CssClass="spaced_label" /></td>
                                    <td align="left"><asp:DropDownList runat="server" ID="ddlColor" AutoPostBack="true" OnSelectedIndexChanged="Set_To_Unapproved" /></td>
                                </tr>
                                <asp:PlaceHolder runat="server" ID="holderPrintLines">
                                <tr>
                                    <td class="entrylabel_small_left"><asp:Label runat="server" Text="Print Lines:" CssClass="spaced_label" /></td>
                                    <td align="left">                                        
                                        <asp:CheckBox  runat="server" ID="chkPrintLines" Checked="true" AutoPostBack="true" OnCheckedChanged="Set_To_Unapproved"  />
                                    </td>
                                </tr>
                                </asp:PlaceHolder>
                                <tr>
                                    <td class="entrylabel_small_left"><asp:Label runat="server" Text="# of Sig. Lines:" CssClass="spaced_label" /></td>
                                    <td align="left">
                                        <asp:DropDownList runat="server" ID="ddlSignatureLineCount" AutoPostBack="true" OnSelectedIndexChanged="Set_To_Unapproved">
                                            <asp:ListItem Value="1" Text="1" />
                                            <asp:ListItem Value="2" Text="2" />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="entrylabel_small_left"><asp:Label runat="server" Text="Msg Above Sig:" CssClass="spaced_label" /></td>
                                    <td align="left">
                                        <asp:TextBox runat="server" ID="txtMessageAboutSignature" Text="VOID AFTER 90 DAYS" AutoPostBack="true" MaxLength="30" Columns="20" OnTextChanged="Set_To_Unapproved" />
                                    </td>
                                </tr>
                                <asp:PlaceHolder runat="server" ID="holderPrintPaymentRecordOnStub">
                                <tr>
                                    <td colspan="2" class="entrylabel_small_left">
                                        <span style="padding-left:3px">
                                        <asp:CheckBox TextAlign="Right" runat="server" ID="chkPrintPmtRecord" Text="Print Payment Record on Stub" AutoPostBack="true" OnCheckedChanged="Set_To_Unapproved" />
                                        </span>
                                    </td>
                                </tr>
                                </asp:PlaceHolder>
                                <asp:PlaceHolder runat="server" ID="holderStubOptions">
                                <tr>
                                    <td colspan="2" class="entrylabel_small_left">
                                        <asp:RadioButtonList runat="server" ID="radStub" TextAlign="Right" RepeatLayout="Table" RepeatDirection="Vertical" RepeatColumns="1" AutoPostBack="true" OnSelectedIndexChanged="Set_To_Unapproved" >
                                            <asp:ListItem Text="Print Line 1 on Stub" Value="1" Selected="True"/>
                                            <asp:ListItem Text="Print Line 1 & 2 on Stub" Value="2" />
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                </asp:PlaceHolder>
                                <asp:PlaceHolder runat="server" ID ="holderCheckNo">
                                    <tr>
                                        <td colspan="2" class="entrylabel_small_left">
                                            <asp:CheckBox runat="server" ID="chkShowCheckNo" Text="Print 'Check No' heading on check" AutoPostBack="true" Checked="false" OnCheckedChanged="Set_To_Unapproved" />
                                        </td>
                                    </tr>
                                </asp:PlaceHolder>
                            </table>
                        </td>
                        <td valign="top">
                        <asp:PlaceHolder runat="server" ID="holderLogo">
                            <div>
                                <asp:CheckBox Visible="false" runat="server" ID="chkUseLogo" AutoPostBack="true" OnCheckedChanged="Set_To_Unapproved" /> 
                                <asp:Button runat="server" ID="btnManageLogo" Text="Add Logo" CausesValidation="false" OnClientClick="javascript:openLogoUpload();return false;" />
                            </div>
                        </asp:PlaceHolder>
                            <div style="padding-top:10px">
                                <asp:LinkButton runat="server" CssClass="navlink_off" ID="btnPreview1" Text="Preview Full Check" OnClientClick="javascript:openFullCheckPreview(false);return false;" />
                                <div style="text-align:center">
                                <asp:ImageButton runat="server" ID="btnPreview" ImageUrl="../images/checks/QBVoucher/qbvoucher_preview.jpg" ImageAlign="Middle" CausesValidation="false" OnClientClick="javascript:openFullCheckPreview();return false;" />
                                </div>
                                <div style="padding-top:3px">
                                Approved: <asp:Label runat="server" ID="lblApproved" /> 
                                </div>
                            </div>
                            
                        </td>
                    </tr>
                </table>
                
                
            </td>
        </tr>
        <asp:PlaceHolder runat="server" ID="holderMicroPosition" Visible="false">
        <tr>
            <td>
                <table width="100%" border="0">
                    <tr>
                        <td valign="top">
                            <!--<span style="display:inline;">Logo Location:</span>-->
                            <asp:DropDownList runat="server" ID="ddlLogoLocation" AutoPostBack="true" OnSelectedIndexChanged="Set_To_Unapproved" Visible="false" />
                            <table>
                                <tr>
                                    <td>Logo / Address Block Positioning</td>
                                </tr>
                                <tr>
                                    <td class="entrylabel_small_left">
                                        <asp:RadioButtonList runat="server" ID="radLogoPosition" RepeatLayout="Table" RepeatColumns="1" TextAlign="Right" RepeatDirection="Vertical" AutoPostBack="true" OnSelectedIndexChanged="Set_To_Unapproved">
                                            <asp:ListItem  Text="Position Logo to Right of Address" Value="2"/>
                                            <asp:ListItem Selected="True" Text="Position Logo to Left of Address" Value="1" />
                                            <asp:ListItem  Text="Position Logo Above Address"  Value="3"/>
                                            <asp:ListItem  Text="Position Logo Below Address"  Value="4"/>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td valign="top">
                                <table width="100%" border="0">
                                    <tr>
                                        <td colspan="2" align="left">Logo / Address Micro Positioning</td>
                                    </tr>
                                    <tr>
                                        <td class="entrylabel_small_left" style="width:80px">
                                            <asp:RadioButtonList runat="server" ID="radMircoAdjust" RepeatDirection="Vertical" RepeatLayout="Table" TextAlign="Right" RepeatColumns="1">
                                                <asp:ListItem Selected="True" Text="Logo" />
                                                <asp:ListItem Text="Address" />
                                            </asp:RadioButtonList>
                                        </td>
                                        <td align="left">
                                            <table width="70px" border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td>&nbsp;</td>
                                                    <td align="center">
                                                        <asp:ImageButton runat="server" ID="btnUp" ImageUrl="../images/nudge/up.jpg" Height="17" Width="23" OnClick="Adjust_Position" />
                                                    </td>
                                                    <td>&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td align="right">
                                                        <asp:ImageButton runat="server" ID="btnLeft" ImageUrl="../images/nudge/left.jpg" Height="23" Width="17"  OnClick="Adjust_Position" />                    
                                                    </td>
                                                    <td align="center" valign="middle" style="width:20px">
                                                    <!--    <img src="../images/nudge/nudgeit_05.gif" height="15" width="15" alt="" />-->
                                                    <asp:DropDownList runat="server" ID="ddlNudgeSize" style="font-size:x-small" >
                                                        <asp:ListItem Text="1" Value="1" />
                                                        <asp:ListItem Text="2" Value="2" />
                                                        <asp:ListItem Text="3" Value="3" />
                                                        <asp:ListItem Selected Text="4" Value="4" />
                                                        <asp:ListItem Text="5" Value="5" />
                                                        <asp:ListItem Text="6" Value="6" />
                                                        <asp:ListItem Text="7" Value="7" />
                                                        <asp:ListItem Text="8" Value="8" />
                                                        <asp:ListItem Text="9" Value="9" />
                                                    </asp:DropDownList>
                                                    </td>
                                                    <td>
                                                        <asp:ImageButton runat="server" ID="btnRight" ImageUrl="../images/nudge/right.jpg" Height="23" Width="17" OnClick="Adjust_Position"/>                    
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>&nbsp;</td>
                                                    <td align="center"><asp:ImageButton ID="btnDown" runat="server" ImageUrl="../images/nudge/down.jpg" Height="17" Width="23"  alt="" OnClick="Adjust_Position" /></td>
                                                    <td>&nbsp;</td>
                                                </tr>
                                            </table>
                                       </td>
                                    </tr>
                                </table>
                        </td>
                        <td valign="top">
                            <table>
                                <tr>
                                    <td>Logo Color</td>
                                </tr>
                                <tr>
                                    <td class="entrylabel_small_left">
                                        <asp:RadioButtonList runat="server" ID="radLogoColor" RepeatLayout="Table" RepeatColumns="1" TextAlign="Right" RepeatDirection="Vertical" AutoPostBack="true" OnSelectedIndexChanged="Set_To_Unapproved">
                                            <asp:ListItem Text="Black and White (standard)" Value="1" />
                                            <asp:ListItem Text="Color (.15/check extra)" Value="2" />
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        </asp:PlaceHolder>
    </table>

    
</div>

<b class="b4"></b><b class="b3"></b><b class="b2"></b><b class="b1"></b>
</div>
</td>
</tr>
<tr>
<td style="text-align:center">
        <asp:ImageButton ImageUrl="../images/Cancel.gif" ID="LinkButton1" runat="server" OnClick="btnCancel_OnClick" OnClientClick="return confirmCancel()" /> 
        
        <asp:ImageButton ImageUrl="../images/Edit.gif" ID="btnPrevious" runat="server" CausesValidation="false" OnClick="btnPrevious_OnClick" />
          
         <asp:ImageButton ImageUrl="../images/Continue.gif" ID="btnContinue" runat="server" CausesValidation="false" OnClick="btnContinue_OnClick" OnClientClick="return verifyApproved();" />         
    </td>
    </tr>
</table>    
 
    </form>
</body>
</html>
