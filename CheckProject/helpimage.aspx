﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="helpimage.aspx.cs" Inherits="CheckProject.helpimage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Help</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table width="100%">
            <tr>
                <td align="center">
                    <asp:Image ID="imgHelp" runat="server" ImageAlign="Middle" Width="600px" />
                </td>
            </tr>
            <tr>
                <td align="center">
                    <a href="javascript:window.close()">Close</a>
                </td>
            </tr>
        </table>
        
    </div>
    </form>
</body>
</html>
