<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FullCheckPreview.aspx.cs" Inherits="CheckProject.PreviewBuilder.FullCheckPreview" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    
        <asp:HiddenField runat="server" ID="hdnAccountNumber" />
        <asp:HiddenField runat="server" ID="hdnRoutingNumber" />
        <asp:HiddenField runat="server" ID="hdnProductKey" />
        
        <asp:PlaceHolder runat="server" ID="holderClose" Visible="false">
            <script type="text/javascript" language="javascript">
            var ctlAccountNumber = document.getElementById("hdnAccountNumber");
            var ctlProductKey = document.getElementById("hdnProductKey");
            var accountNumber = ctlAccountNumber.value;
            var productKey = ctlProductKey.value;
            //window.opener.document.location = "CheckPreview.aspx?ProductKey=" + productKey + "&AccountNumber=" + accountNumber;
            window.opener.document.location = "../orderprocessing/vieworder.aspx";
            window.close();
            </script>
        </asp:PlaceHolder>
        <asp:PlaceHolder runat="server" ID="holderNotApproved" Visible="false">
            <script type="text/javascript" language="javascript">
                var ctlAccountNumber = document.getElementById("hdnAccountNumber");
                var ctlProductKey = document.getElementById("hdnProductKey");
                var accountNumber = ctlAccountNumber.value;
                var productKey = ctlProductKey.value;
                window.opener.document.location = "CheckPreview.aspx?ProductKey=" + productKey + "&AccountNumber=" + accountNumber;
                //window.opener.document.location = "../orderprocessing/vieworder.aspx";
                window.close();
            </script>
        </asp:PlaceHolder>
    <div>
    </div>
    <div style="text-align:center">
    I approve this check<asp:CheckBox runat="server" ID="chkApprove" />
    <asp:Button runat="server" ID="btnApprove" Text="Done" OnClick="btnApprove_OnClick" />
    <asp:Button runat="server" ID="btnCancel" CausesValidation="false" Text="Cancel" OnClientClick="window.close();return false;" />
    </div>
    <div style="text-align:center">
        <asp:Image runat="server" id="imgConfirm"/>
    </div>
    
    </form>
</body>
</html>
