<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InvalidCharacter.aspx.cs" Inherits="CheckProject.InvalidCharacter" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align:center; margin-top:100px;">
            <div> 
            Our system detected an invalid request that indicates a hacking attempt.
            </div>
            <div style="margin-top:20px">
                <asp:Label runat="server" ID="lblTimeOut" Text="Your computer will be locked out for 60 minutes" ForeColor="Red" Visible="false" />
            </div>
            <div style="margin-top:20px">
                <asp:Label runat="server" ID="lblLockedOut" Text="Your computer is permanently blocked" ForeColor="Red" Visible="false" />
            </div>
            <div style="margin-top:20px">
                Please contact our office if you have questions. 
            </div>
        </div>
    </form>
</body>
</html>
