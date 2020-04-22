<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogoFinder.aspx.cs" Inherits="CheckProject.PreviewBuilder.LogoFinder" %>
<%@ OutputCache Location="None" VaryByParam="None" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <link rel="stylesheet" href="../styles/checkproject.css" type="text/css">
    <title>Please upload your logo</title>
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
        window.opener.document.location = "CheckPreview.aspx?ProductKey=" + productKey + "&AccountNumber=" + accountNumber;
        window.close();
        </script>
     </asp:PlaceHolder>
    <table width="100%">
        <tr>
            <td align="center">
                <div style="width:500px;text-align:center">
                    <div style="margin-top:20px">Please use this form to upload your logo.</div>
                    <div style="margin-top:10px">
                        
                        The logo will be sized and made transparent for display on your check.<br />
                        <span style="display:block;padding-top:5px">Supported file types: .jpg, .bmp, .gif, .tif</span>
                    </div>
                    <div style="padding-top:30px">
                    <asp:FileUpLoad id="FileUpLoad1" runat="server"  />
                    
                    <asp:Button id="btnUpload" Text="Upload File" OnClick="btnUpload_OnClick" runat="server" Width="105px" />
                    <asp:Button ID="btnDelete" Text="Delete" OnClick="btnDelete_OnClick" runat="server" Width="100px" />
                    </div>
                    <asp:RegularExpressionValidator ID="regexValidator" runat="server"
                         ControlToValidate="FileUpLoad1"
                         ErrorMessage="File type not supported" 
                         ValidationExpression="(.*\.([Jj][Pp][Gg])|.*\.([Jj][Pp][Ee][Gg])|(.*\.[Gg][Ii][Ff])|(.*\.[Bb][Mm][Pp])|(.*\.[Tt][Ii][Ff])$)" Display="None">
                    </asp:RegularExpressionValidator>
                    <asp:ValidationSummary runat="server" DisplayMode="List" />
                    <div style="text-align:center;margin-top:30px;height:100px;border-color:Black;border-width:1px;border-style:solid">
                    <span style="display:block"><asp:Label runat="server" Text="Current Logo" CssClass="header1"  Width="100%" /></span>
                    <asp:Image runat="server" ID="imgLogo" style="margin-top:3px; border:dotted 1px black"  />
                    </div>
                    <asp:Label runat="server" ID="Label1" />
                    
                </div>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Button runat="server" ID="btnDone" Text="Done" Width="100px" OnClick="btnDone_OnClick" />
            </td>
        </tr>
    </table>
    
    </form>
</body>
</html>
