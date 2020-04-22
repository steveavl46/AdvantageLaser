<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Nudge.aspx.cs" Inherits="CheckProject.Nudge" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Fine Tune</title>
    <script type="text/javascript" language="javascript">
        function nudge() {
            var ctlAccountNumber = document.getElementById("hdnAccountNumber");
            var ctlProductKey = document.getElementById("hdnProductKey");
            var accountNumber = ctlAccountNumber.value;
            var productKey = ctlProductKey.value;
            window.opener.document.location = "PreviewBuilder/CheckPreview.aspx?ProductKey=" + productKey + "&AccountNumber=" + accountNumber;
            return false;
        }
        </script>
</head>
<body onBlur="self.focus()">
    <form id="form1" runat="server">
    <asp:HiddenField runat="server" ID="hdnAccountNumber" />
    <asp:HiddenField runat="server" ID="hdnProductKey" />
    <table width="100%">
        <tr>
            <td align="center">
                <table width="100px" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td><img src="images/nudge/nudgeit_01.gif" height="35" width="35" alt="" /></td>
                <td>
                    <asp:ImageButton runat="server" ID="btnUp" ImageUrl="images/nudge/nudge_up.gif" Height="35" Width="30" OnClick="Adjust_Position" />
                </td>
                <td><img src="images/nudge/nudgeit_03.gif" height="35" width="35" alt="" /></td>
            </tr>
            <tr>
                <td>
                    <asp:ImageButton runat="server" ID="btnLeft" ImageUrl="images/nudge/nudge_left.gif" Height="29" Width="35" OnClick="Adjust_Position" />                    
                </td>
                <td><img src="images/nudge/nudgeit_05.gif" height="29" width="30" alt="" /></td>
                <td>
                    <asp:ImageButton runat="server" ID="btnRight" ImageUrl="images/nudge/nudge_right.gif" Height="29" Width="35" OnClick="Adjust_Position"/>                    
                </td>
            </tr>
            <tr>
                <td><img src="images/nudge/nudgeit_07.gif" width="35" HEIGHT="36" ALT="" /></td>
                <td><asp:ImageButton ID="btnDown" runat="server" ImageUrl="images/nudge/nudge_down.gif" width="30" height="36"  alt="" OnClick="Adjust_Position" /></td>
                <td><img src="images/nudge/nudgeit_09.gif" width="35" height="36" alt=""></td>
            </tr>
        </table>
            </td>
        </tr>
    </table>
        
    </div>
    </form>
</body>
</html>
