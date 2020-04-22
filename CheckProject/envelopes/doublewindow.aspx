<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="doublewindow.aspx.cs" Inherits="CheckProject.envelopes.doublewindow" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="../styles/checkproject.css" type="text/css">
    <style type="text/css">
        .indent2{
            padding-left:20px;
        }
        .shippingLine {
            font-size:10pt;
        }
        .partNumber {
            margin-left:10px;
        }
    </style>
    <script type="text/javascript">
        function testFunction() {
            var w = window.parent;
            var ctl = w.document.getElementById("btn_close");
            ctl.click();
        }

    </script>
</head>
<body style="background-color:white">
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td>
                    <div><span style="font-size:24px;font-weight:bold">Need Double Window Envelopes?</span></div>
                    <div>These envelopes will fit your checks, Guaranteed!</div>
                </td>
                <td>
                    <div><img src="../images/envelope.jpg" /></div>
                </td>
            </tr>
        </table>
            
    </div>
        
    <div style="padding-top:20px">
        <asp:Table runat="server" ID="tblEnvelopes" />
    </div>
        <div class="shippingLine">Note: Ground shipping will be added.</div>
    <div>
        <asp:Button runat="server" ID="btnSubmit" Text="Submit" OnClick="btnSubmit_OnClick" style="display:none" />
        <asp:Button runat="server" ID="btnCancel" Text="Cancel" UseSubmitBehavior="false" OnClientClick="window.close();"  style="display:none"/>
    </div>
    </form>
</body>
</html>
