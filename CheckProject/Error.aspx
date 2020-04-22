<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="CheckProject.Error" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align:center">
    Oops, we've had an error....
    <br /><br />
    We're sorry for the inconvenience this has caused you.
    <br /><br />
    Our technical department has been emailed with details and will work to correct this problem.
    <br /><br />
    Start over <a href="<%=ErrorPageURL %>">here</a>
    
    </div>
    </form>
</body>
</html>
