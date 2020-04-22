<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConfirmPreview.aspx.cs" Inherits="CheckProject.PreviewBuilder.ConfirmPreview" %>
<%@ Register TagPrefix="AdvLaser" TagName="Header" Src="../controls/Header.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="../styles/checkproject.css" type="text/css">
    <script src="../js/common.js" type="text/javascript" ></script>
 
</head>
<body>
    <form id="form1" runat="server" defaultbutton="btnContinue" >   

<table width="100%">
<tr>
<td align="center">
       
    <AdvLaser:Header runat="server" StepNumber="3"  />    
    <asp:Label runat="server" ID="lblTestSystem" Text="This is a test system" ForeColor="Red" Visible="false" />
</td>
</tr>
<tr>
<td align="center">
<div class="holderdiv">
  <b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b>    

<div class="contentb1">        

<table>
        <tr>
            <td align="center"><asp:Label runat="server" ID="lblProductDescription" CssClass="header1" Width="100%" /></td>
        </tr>
        <tr>
            <td>
            This image is a proof of your order<br />
            Please verify the information in the preview below and then click 'Continue'.
            </td>
        </tr>
        <tr>
            <td><asp:Image runat="server" id="imgConfirm"/></td>
        </tr>

    </table>

    
</div>

<b class="b4"></b><b class="b3"></b><b class="b2"></b><b class="b1"></b>
</div>
</td>
</tr>
<tr>
<td style="text-align:center">
        <asp:ImageButton ImageUrl="../images/Cancel.gif" ID="LinkButton1" runat="server" OnClick="btnCancel_OnClick" OnClientClick="return confirmCancel()" /> 
        
        <asp:ImageButton ImageUrl="../images/Edit.gif" ID="btnPrevious" runat="server" CausesValidation="false" OnClick="btnPrevious_OnClick"  />
          
         <asp:ImageButton ImageUrl="../images/Continue.gif" ID="btnContinue" runat="server" CausesValidation="false" OnClick="btnContinue_OnClick" OnClientClick="return confirmProof();" />
    </td>
    </tr>
</table>    
 
    </form>
</body>
</html>


