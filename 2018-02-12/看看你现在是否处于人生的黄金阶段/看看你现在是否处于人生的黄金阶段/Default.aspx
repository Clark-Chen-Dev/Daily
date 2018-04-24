<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="看看你现在是否处于人生的黄金阶段.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>看看你现在是否处于人生的黄金阶段</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            请输入您的年龄：<asp:TextBox ID="txtAge" runat="server"></asp:TextBox>
            <asp:Button ID="tbCheck" runat="server" OnClick="tbCheck_Click"
                Text="看看我现在所处的人生阶段" />
        </div>
    </form>
</body>
</html>
