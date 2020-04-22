<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DepositStamp.aspx.cs" Inherits="CheckProject.OrderDepositSlip.DepositStamp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table>
        <tr>
            <td>Add a Self-Inking Deposit Stamp</td>
        </tr>
        <tr>
            <td>Account:
                <asp:DropDownList ID="ddlAcount" runat="server" />
            </td>
            <td>
                <asp:Image runat="server" id="imgStamp"/>
                <asp:LinkButton runat="server" ID="lnkAdd" Text="add to order" />
            </td>
        </tr>
    </table>
    
    </div>
    </form>
</body>
</html>
