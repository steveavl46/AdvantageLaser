<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShippingRates.aspx.cs" Inherits="CheckProject.OrderProcessing.ShippingRates" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="../styles/checkproject.css" type="text/css">
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table width="800px">
        <tr>
            <td align="center">
                <div style="border: solid thin black;width:100%;text-align:left">
                <asp:Table runat="server" ID="tblZones" Width="100%">
                    <asp:TableRow ID="TableRow1" runat="server">
                        
                        <asp:TableCell CssClass="header1" ID="TableCell1" runat="server" ColumnSpan="2" HorizontalAlign="Center">Shipping Zones</asp:TableCell>
                        
                    </asp:TableRow>
                </asp:Table>
                </div>
            </td>
        </tr>
        <tr>
            <td align="center">
                <div style="border: solid thin black;width:100%;">
                <asp:Table runat="server" ID="tblRates" Width="100%">
                    <asp:TableRow ID="TableRow2" runat="server">
                        <asp:TableCell CssClass="header1" ID="TableCell2" runat="server" ColumnSpan="2" HorizontalAlign="Center">Zone-Based Shipping</asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
                </div>
            </td>
        </tr>
        <tr>
            <td align="center">
                <div style="border: solid thin black;width:100%;">
                <asp:Table runat="server" ID="tblFixedRate" Width="100%">
                    <asp:TableRow ID="TableRow3" runat="server">
                        <asp:TableCell CssClass="header1" ID="TableCell3" runat="server" ColumnSpan="2" HorizontalAlign="Center">Fixed-Rate Shipping</asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow runat="server">
                        <asp:TableCell runat="server" CssClass="subhead" Width="300px">Products</asp:TableCell>
                        <asp:TableCell runat="server" CssClass="subhead" HorizontalAlign="Left">Rate</asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <a href="javascript:window.close()">Close</a>
            </td>
        </tr>
    </table>
        
        
    </div>
    </form>
</body>
</html>
