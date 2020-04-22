<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewOrder.aspx.cs" Inherits="CheckProject.OrderProcessing.ViewOrder" %>
<%@ Register TagPrefix="AdvLaser" TagName="Header" Src="../controls/Header.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <title></title>
    <link rel="stylesheet" href="../styles/checkproject.css" type="text/css">
    <script language="javascript" type="text/javascript">
        function openWindow() {
            var ctl = document.getElementById('<%= btn_open.ClientID %>');
            //ctl.click();
        }
        function testAlert() {
            window.refresh();
        }
        function goToEnvelopes() {
            //var ctl = document.getElementById("btn_close");
            //ctl.click();
            window.location = "../envelopes/orderenvelopes.aspx";
        }
            </script>
    <style type="text/css">
        .modal-backdrop {
            background-color: rgba(0, 0, 0, 0.61);
            position: absolute;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            display: none;
        }

        .modal {
            width: 500px;
            position: absolute;
            top: 25%;
            z-index: 1020;
            background-color: #FFF;
            border-radius: 6px;
            display: none;
        }

        .modalNew {
            width: 400px;
            position: absolute;
            top: 25%;
            z-index: 1020;
            background-color: #FFF;
            border-radius: 6px;
            display: none;
        }

        .modal-header {
            background-color: #333;
            color: #FFF;
            border-top-right-radius: 5px;
            border-top-left-radius: 5px;
        }

            .modal-header h3 {
                margin: 0;
                padding: 0 10px 0 10px;
                line-height: 20px;
            }

                .modal-header h3 .close-modal {
                    float: right;
                    text-decoration: none;
                    color: #FFF;
                }

        .modal-footer {
            background-color: #FFF;
            padding: 0 10px 0 10px;
            line-height: 20px;
            text-align: center;
            border-bottom-right-radius: 5px;
            border-bottom-left-radius: 5px;
        }

        .modal-body {
            padding: 0 10px 0 10px;
        }

        .fieldset {
            border-width: 1px;
            border-color: black;
            width: 250px;
        }
    </style>
    <script src="../js/common.js" type="text/javascript" ></script>
    <script language="javascript" type="text/javascript">
        function checkAddStamp() {
            var ctl = document.getElementById("ddlDepositStampAccount");
            if (ctl.length == 0) {
                alert("There are no accounts available for this item.");
                return false;
            }
            if (ctl.value == "") {
                alert("Please select an account number");
                return false;
            }
            return true;
        }
        function checkAddBook() {
            var ctl = document.getElementById("ddlAccount");
            if (ctl.length == 0) {
                alert("There are no accounts available for this item.");
                return false;
            }
            if (ctl.value == "") {
                alert("Please select an account number");
                return false;
            }
            return true;
        }
    </script>
</head>
<body <asp:Literal runat="server" ID="litOnLoad" />>
    <form id="form1" runat="server" defaultbutton="btnContinue" defaultfocus="ddlAccount">
        
        <script type="text/javascript" language="javascript">
            $(function () {
                modalPosition();
                $(window).resize(function () {
                    modalPosition();
                });
                $('.openModal').click(function (e) {
                    $('.modal, .modal-backdrop').fadeIn('fast');
                    e.preventDefault();
                });
                $('.openModalNew').click(function (e) {
                    $('.modalNew, .modal-backdrop').fadeIn('fast');
                    e.preventDefault();
                });
                $('.close-modal').click(function (e) {
                    $('.modal, .modal-backdrop').fadeOut('fast');
                    clickIFrameButton();
                    location.reload();
                });
                $('.close-modalYes').click(function (e) {
                    $('.modalNew, .modal-backdrop').fadeOut('fast');
                    goToEnvelopes();
                });
                $('.close-modalNo').click(function (e) {
                    $('.modalNew, .modal-backdrop').fadeOut('fast');
                });
            });
            function modalPosition() {
                //var width = $('.modal').width();
                var width = $('.modalNew').width();
                var pageWidth = $(window).width();
                var x = (pageWidth / 2) - (width / 2);
                //$('.modal').css({ left: x + "px" });
                $('.modalNew').css({ left: x + "px" });
            }

            function clickIFrameButton() {
                var ctl = $('#ifrm').contents().find('#btnSubmit');
                ctl.click();
            }
    </script>

        <asp:Button ID="btn_open" runat="server" Text="" style="display:none" CssClass="openModalNew"/>
        <asp:Button ID="Button1" runat="server" Text="Open Widow" CssClass="openModalNew" style="display:none" />
    <div class="modal">
        
    <div class="modal-header">
        <h3> <a class="close-modal" href="#">&times;</a></h3>
    </div>
        
    <div class="modal-body">
        <iframe style=" width:100%; height: 100px; border:none" id="ifrm" src="../envelopes/doublewindow.aspx" runat="server"></iframe>
    </div>
    <div class="modal-footer">
         <asp:Button ID="btn_close" runat="server" Text="OK" CssClass="modalOK close-modal" style="margin-bottom:10px" />
    </div>
</div>

        <div class="modalNew">

            <div class="modal-body">
                <div style="padding-top:30px"><span style="font-size:24px;font-weight:bold">Need Double Window Envelopes?</span></div>
                    <div>These envelopes will fit your checks, Guaranteed!</div>
                    <div style="height:100px; text-align:top;padding-top:20px"><img src="../images/envelope.jpg" /></div>
            </div>
            <div class="modal-footer">
                <asp:Button runat="server" ID="btnCloseNewModal" Text="Yes"  CssClass="modalOK close-modalYes" style="margin-bottom:10px" UseSubmitBehavior="false" />
                <asp:Button runat="server" ID="Button2" Text="No"  CssClass="modalOK close-modalNo" style="margin-bottom:10px" UseSubmitBehavior="false" />
            </div>
        </div>


<div class="modal-backdrop"></div>
    <div>
    <table width="100%">
<tr>
<td align="center">

       
    <AdvLaser:Header ID="Header1" runat="server" StepNumber="4"  />     
    <asp:Label runat="server" ID="lblTestSystem" Text="This is a test system" ForeColor="Red" Visible="false" />
</td>
</tr>
<tr>
<td align="center">
<div class="holderdiv">
  <b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b>    

<div class="contentb1">        
    <div style="height:200px">
        <asp:Table runat="server" ID="tblInvoiceItems" CellPadding="1" CellSpacing="1" width="100%">
            <asp:TableRow>
                <asp:TableCell runat="server" CssClass="header1">Product</asp:TableCell>
                <asp:TableCell runat="server" CssClass="header1">Account</asp:TableCell>
                <asp:TableCell runat="server" CssClass="header1">Description</asp:TableCell>
                <asp:TableCell runat="server" CssClass="header1">Price</asp:TableCell>
                <asp:TableCell runat="server" CssClass="header1">&nbsp;</asp:TableCell>
                <asp:TableCell ID="TableCell1" runat="server" CssClass="header1">&nbsp;</asp:TableCell>
            </asp:TableRow>
        </asp:Table>

    </div> 

    <div>
        <div>
        <table border="0">
            <tr>
                <td>
                    <fieldset class="fieldset">
                        <legend>Double Window Envelopes</legend>
                        <div><img src="../images/envelope.jpg" /></div>
                        <div style="padding-top:10px">
                            <asp:ImageButton runat="server"  ImageUrl="../images/Add-To-Cart.gif" OnClientClick="javascript:goToEnvelopes();return false;" />
                        </div>
                    </fieldset>
                </td>
                <td>
                    <fieldset class="fieldset">
                        <legend>2-part Deposit Slip Book</legend>
                        <div><img src="../images/Deposit-Book-4up.jpg" style="width:170px"/></div>
                        <div style="margin-top:7px">
                        <span style="display:inline-block;background-color:yellow;line-height:25px;vertical-align:middle">
                            <asp:ImageButton runat="server"  ImageUrl="../images/Add-To-Cart.gif" OnClick="btnAddDepositBook_OnClick" OnClientClick="return checkAddBook();" /> 
                        </span>
                        <span style="display:inline-block;background-color:yellow;line-height:25px;vertical-align:middle">
                            <asp:DropDownList runat="server" ID="ddlAccount" OnSelectedIndexChanged="ddlAccount_OnIndexChanged" AutoPostBack="true" style="line-height:25px">
                                <asp:ListItem Text="Select" Value="" />
                            </asp:DropDownList>
                        </span>
                            </div>
                    </fieldset>
                    
                </td>
            </tr>

        </table>
        
        </div>
    </div>
    <div style="margin-top:15px">
        <span style="display:inline-block;line-height:25px;vertical-align:middle">
        Add a Self-Inking Deposit Stamp (<asp:Label runat="server" ID="lblDepositStampPrice" />)
        </span>
        <span style="display:inline-block;background-color:green;line-height:25px;vertical-align:middle">
            <asp:ImageButton runat="server"  ImageUrl="../images/Add-To-Cart.gif" OnClick="btnAddDepositStamp_OnClick" OnClientClick="return checkAddStamp();"/>
        </span>
        <span style="display:inline-block;background-color:yellow;line-height:25px;vertical-align:middle">
            <asp:DropDownList runat="server" ID="ddlDepositStampAccount">
                <asp:ListItem Text="Select" Value="" />
            </asp:DropDownList>
                
            </span>
    </div>  

   <div style="text-align:center"><asp:Label runat="server"  ID="lblErrorMessage" /></div>
</div>

<b class="b4"></b><b class="b3"></b><b class="b2"></b><b class="b1"></b>
</div>
</td>
</tr>

<tr>
    <td style="text-align:center">
        <asp:ImageButton ImageUrl="../images/Add-Another-Item.gif" runat="server" CausesValidation="false" PostBackUrl="../OrderStart/SelectProduct.aspx" /> 
        <asp:ImageButton ImageUrl="../images/Continue.gif" runat="server" ID="btnContinue" Text="Continue" CausesValidation="false" PostBackUrl="AddressEntry.aspx" />       
    </td>
</tr>
</table>
    </div>
    </form>
</body>
</html>
