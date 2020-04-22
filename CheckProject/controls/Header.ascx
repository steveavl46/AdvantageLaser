<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="CheckProject.controls.Header" %>


<div class="holderdiv">
<!--
<b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b>    
-->
<asp:Image runat="server" ID="imgHeader" style="vertical-align:bottom" />
<div class="contentb">
<asp:Table runat="server" width="100%" CellPadding="0" CellSpacing="0" >
	   <asp:TableRow runat="server">
	        <asp:TableCell runat="server" Width="710px" >
	            <div style="border-style:solid;border-color:Black;border-width:1px;margin-top:5px">
	                <asp:Table runat="server" Width="100%" CellPadding="0" CellSpacing="0">
	                    <asp:TableRow ID="TableRow1" runat="server">
                       <asp:TableCell ID="tdStep1" runat="server" class="progresscell1_on">
                        <asp:LinkButton runat="server" ID="lnkSelectProduct" Text="Select Product" CausesValidation="false" OnClientClick="return checkSave()" CssClass="navlink"/></asp:TableCell >
	                   <asp:TableCell ID="TableCell1" runat="server" CssClass="navspacer">|</asp:TableCell >
	                   <asp:TableCell ID="tdStep2" runat="server" class="progresscell2_off">Configure</asp:TableCell >
	                   <asp:TableCell ID="TableCell2" runat="server" CssClass="navspacer">|</asp:TableCell >
	                   <asp:TableCell ID="tdStep3" runat="server" class="progresscell3_off">Preview</asp:TableCell >
	                   <asp:TableCell ID="TableCell3" runat="server" CssClass="navspacer">|</asp:TableCell >
	                   <asp:TableCell ID="tdStep4" runat="server" class="progresscell3_off">
	                    <asp:LinkButton runat="server" ID="lnkViewOrder" Text="View Order" CausesValidation="false" OnClientClick="return checkSave()" CssClass="navlink" />
	                   </asp:TableCell >
	                   <asp:TableCell ID="TableCell4" runat="server" CssClass="navspacer">|</asp:TableCell >
	                   <asp:TableCell ID="tdStep5" runat="server" class="progresscell4_off">
	                    <asp:LinkButton runat="server" ID="lnkCustomerInfo" Text="Customer Info" CausesValidation="false" OnClientClick="return checkSave()" CssClass="navlink"/></asp:TableCell >
	                   <asp:TableCell ID="TableCell5" runat="server" CssClass="navspacer">|</asp:TableCell >
	                   <asp:TableCell ID="tdStep6" runat="server" class="progresscell5_off">
	                    <asp:LinkButton runat="server" ID="lnkShippingInfo" Text="Shipping Info" CausesValidation="false" OnClientClick="return checkSave()" CssClass="navlink"/>
	                   </asp:TableCell >
	                   <asp:TableCell ID="TableCell6" runat="server" CssClass="navspacer">|</asp:TableCell >
	                   <asp:TableCell ID="tdStep7" runat="server" class="progresscell6_off">
	                    <asp:LinkButton runat="server" ID="lnkPlaceOrder" Text="Place Order" CausesValidation="false" OnClientClick="return checkSave()" CssClass="navlink"/>
	                   </asp:TableCell >
	                   </asp:TableRow>
	                </asp:Table>
	            </div>
	        </asp:TableCell>
	   </asp:TableRow>
	   
</asp:Table>
</div>

<b class="b4"></b><b class="b3"></b><b class="b2"></b><b class="b1"></b>

</div>

