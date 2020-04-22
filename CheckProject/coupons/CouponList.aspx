<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CouponList.aspx.cs" Inherits="CheckProject.coupons.CouponList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="../styles/checkproject.css" type="text/css">
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table width="100%">
                <tr>
                    <td align="center">

                        <div class="holderdiv">
                            <img src="../images/chkprint-header-2.jpg" />

                            <b class="b4"></b><b class="b3"></b><b class="b2"></b><b class="b1"></b>

                        </div>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <div class="holderdiv" style="height:auto;">
                            <b class="b1" ></b><b class="b2"></b><b class="b3"></b><b class="b4"></b>

                            <div class="contentb1" style="height:auto">
                                <div>
                                    <div>
                                        <asp:GridView runat="server" ID="grdData" AutoGenerateColumns="false" CellPadding="4" PageSize="10" AllowPaging="true" Width="400"
                                            OnPageIndexChanging="grdData_PageIndexChanging">
                                            <Columns>
                                                <asp:BoundField DataField="CouponCode" HeaderText="Coupon Code" />
                                                <asp:BoundField DataField="Description" HeaderText="Description" />
                                                <asp:TemplateField HeaderText="Category">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lblCategory" Text='<%#Eval("CouponCategoryDescription") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Type">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lblType" Text='<%#Eval("CouponTypeDescription") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Value">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lblValue" Text='<%#Eval("CouponValue") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Min Order">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lblMinOrder" Text='<%#Eval("MinimumOrder") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Start Date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblStartDate" runat="server"
                                                            Text='<%#Eval("StartDate", "{0:MM/dd/yyyy}") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="End Date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblEndDate" runat="server"
                                                            Text='<%#Eval("EndDate", "{0:MM/dd/yyyy}") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="" ShowHeader="false">
                                                    <ItemTemplate>
                                                        <asp:LinkButton runat="server" ID="lnkEdit" CommandArgument='<%#Eval("CouponKey") %>' OnClick="lnkEdit_Click">Edit</asp:LinkButton>
                                                    </ItemTemplate>

                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                    <div style="margin-top:5px">
                                        <asp:Button runat="server" ID="btnAdd" OnClick="btnAdd_Click" Text="Add New" />
                                    </div>
                                </div>
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
