<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="制作一个简单的加法运算器.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>制作一个简单的加法运算器</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="txtNum1" runat="server" Width="50px"></asp:TextBox>
            <asp:Label ID="Label1" runat="server" Text="+"></asp:Label>
            <asp:TextBox ID="txtNum2" runat="server" Width="50px" AutoPostBack="True"
                OnTextChanged="txtNum2_TextChanged"></asp:TextBox>
            <asp:Label ID="Label2" runat="server" Text="="></asp:Label>
            <asp:TextBox ID="txtSum" runat="server" Width="50px"></asp:TextBox>
        </div>
    </form>
</body>
</html>
