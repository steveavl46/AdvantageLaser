<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ThankYou.aspx.cs" Inherits="CheckProject.ThankYou" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="../styles/checkproject.css" type="text/css">
</head>
<form id="form1" runat="server">
<body>
<table width="100%">
    <tr>
        <td align="center">
            <div class="holderdiv">
<!--
<b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b>    
-->
<img src="../images/chkprint-header-2.jpg" style="vertical-align:bottom" />
<div class="contentb1a">


    <div class="thank_header">Thanks for Ordering With Advantage Laser Products!</div>
    <div class="thank_header1">We Appreciate Your Business</div>
    <div class="thank_body">Please allow 24 hours to process your order!</div>
    <div  class="thank_body">If you have any questions or to check on the status of your order call 1-800-722-2804</div>
    <div class="thank_body">Return to our website: 
    <asp:LinkButton runat="server" ID="btnReturnToSite" OnClick="btnReturnToSite_OnClick" Text="www.advlaser.com" />
    </div>
    <div><hr /></div>
    <div>
    <table width="100%">
        <tr>
            <td align="left">
                <asp:Label runat="server" ID="lblDisplay" />
            </td>
        </tr>
    </table>
    
    </div>
    <div>
        <asp:Button runat="server" Text="Start new order" OnClick="btn_StartOrder_OnClick" />
    </div>

</div>

<b class="b4"></b><b class="b3"></b><b class="b2"></b><b class="b1"></b>

</div>
        </td>
    </tr>
</table>


    
</body>
</form>
</html>
