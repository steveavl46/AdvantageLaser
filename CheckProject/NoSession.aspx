<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NoSession.aspx.cs" Inherits="CheckProject.NoSession" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    Your session has expired.
    <br />
    Click <a href="<%=AppBasePath %>/OrderStart/SelectProduct.aspx">here</a> to select products.
    </div>
    </form>
</body>
</html>
