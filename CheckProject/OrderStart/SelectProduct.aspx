<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelectProduct.aspx.cs" Inherits="CheckProject.OrderStart.SelectProduct" %>
<%@ Register TagPrefix="AdvLaser" TagName="Header" Src="../controls/Header.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="../styles/checkproject.css" type="text/css"/>
    <script src="../js/common.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table width="100%">
            <tr>
                <td align="center">                
                    <AdvLaser:Header runat="server" StepNumber="1"  />   
                    <asp:Label runat="server" ID="lblTestSystem" Text="This is a test system" ForeColor="Red" Visible="false" />
                </td>
            </tr>
            <tr>
                <td align="center">
                <div class="holderdiv">
                  <b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b>    

                <div class="contentb1">        


                    <table width="100%" cellpadding="5" cellspacing="0">
                        <tr>
                            <td align="center">
                                <div style="width:400px">
                                <b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b> 
                                <div class="contentb2">
                                <table border="0" width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td align="center">
                                            <asp:Table runat="server" ID="tblDepositSlips">
                                            <asp:TableHeaderRow runat="server">
                                            <asp:TableHeaderCell runat="server">Deposit Slips</asp:TableHeaderCell>
                                            </asp:TableHeaderRow>
                                            </asp:Table>
                                            
                                        </td>
                                    </tr>
                                </table>
                                </div>
                                <b class="b4"></b><b class="b3"></b><b class="b2"></b><b class="b1"></b>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <div style="width:400px">
                                <b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b> 
                                <div class="contentb2">
                                <table border="0" width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td align="center">
                                            <asp:Table runat="server" ID="Table2">
                                            <asp:TableHeaderRow runat="server">
                                            <asp:TableHeaderCell runat="server">Deposit Slip Books</asp:TableHeaderCell>
                                            </asp:TableHeaderRow>
                                                <asp:TableRow runat="server">
                                                    <asp:TableCell runat="server">
                                                        <asp:LinkButton runat="server" Text="2-Part Deposit Slip Books" PostBackUrl="../orderdepositslip/depositbookinfo.aspx?ProductTypeKey=12" />
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                            </asp:Table>
                                            
                                        </td>
                                    </tr>
                                </table>
                                </div>
                                <b class="b4"></b><b class="b3"></b><b class="b2"></b><b class="b1"></b>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <div style="width:400px">
                                <b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b> 
                                <div class="contentb2">
                                <table border="0" width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td align="center">
                                            <asp:Table runat="server" ID="Table1">
                                            <asp:TableHeaderRow ID="TableHeaderRow2" runat="server">
                                            <asp:TableHeaderCell ID="TableHeaderCell2" runat="server">Envelopes</asp:TableHeaderCell>
                                            </asp:TableHeaderRow>
                                                <asp:TableRow runat="server">
                                                    <asp:TableCell runat="server">
                                                        <asp:LinkButton runat="server" Text="Double Window Envelopes" PostBackUrl="../envelopes/orderenvelopes.aspx" />
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                            </asp:Table>
                                            
                                        </td>
                                    </tr>
                                </table>
                                </div>
                                <b class="b4"></b><b class="b3"></b><b class="b2"></b><b class="b1"></b>
                                </div>
                            </td>
                        </tr>
                        <asp:PlaceHolder runat="server" ID="holderPrePrintedChecks">
                            <tr>
                                <td align="center">
                                    <div style="width:400px">
                                    <b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b> 
                                    <div class="contentb2">
                                    <table border="0" width="100%" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="center">
                                                <asp:Table runat="server" ID="tblPrePrintedChecks">
                                                <asp:TableHeaderRow ID="TableHeaderRow1" runat="server">
                                                <asp:TableHeaderCell ID="TableHeaderCell1" runat="server">PrePrinted Checks</asp:TableHeaderCell>
                                                </asp:TableHeaderRow>
                                                </asp:Table>
                                                
                                            </td>
                                        </tr>
                                    </table>
                                    </div>
                                    <b class="b4"></b><b class="b3"></b><b class="b2"></b><b class="b1"></b>
                                    </div>
                                </td>
                            </tr>
                        </asp:PlaceHolder>
                    </table>

                </div>    


                <b class="b4"></b><b class="b3"></b><b class="b2"></b><b class="b1"></b>
                </div>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
