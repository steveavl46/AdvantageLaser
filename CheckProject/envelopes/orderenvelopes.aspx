<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="orderenvelopes.aspx.cs" Inherits="CheckProject.envelopes.orderenvelopes" %>
<%@ Register TagPrefix="AdvLaser" TagName="Header" Src="../controls/Header.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="../styles/checkproject.css" type="text/css">
    <script src="../js/common.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">
        function goToSelectProduct() {
            window.location = "../orderstart/selectproduct.aspx";
        }
    </script>
    <style type="text/css">
        .indent2{
            padding-left:20px;

        }
        .partNumber {
            margin-left:10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table width="100%">
            <tr>
                <td align="center">
       
                    <AdvLaser:Header ID="Header1" runat="server" StepNumber="2"  />   
                    <asp:Label runat="server" ID="lblTestSystem" Text="This is a test system" ForeColor="Red" Visible="false" />
                </td>
            </tr>
            <tr>

                            <td align="center">
                                <div class="holderdiv">
                                    <b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b> 
                                    <div class="contentb1">    
                                        <div>
                                            <div>
                                                <asp:Label runat="server" ID="lblProductDescription" CssClass="header1" Width="100%" Text="Double Window Envelopes" style="margin-top:3px" />
                                            </div>
                                            <asp:Table runat="server" ID="tblEnvelopes" style="margin-top:20px" />
                                            
                                        </div>    
                                    </div>
                                    <b class="b4"></b><b class="b3"></b><b class="b2"></b><b class="b1"></b>
                                    
                                </div>
                               
                            </td>
                        </tr>
            <tr>
                <td align="center">
                <div>
                                                <asp:Button runat="server" ID="btnSubmit" Text="Submit" OnClick="btnSubmit_OnClick" />
                                                <asp:Button runat="server" ID="btnCancel" Text="Cancel" UseSubmitBehavior="false" OnClientClick="goToSelectProduct();return false;" />
                                            </div>
                    </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
