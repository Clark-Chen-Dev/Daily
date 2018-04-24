<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="会考考试中的汉字拼音简码.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>会考考试中的汉字拼音简码</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="输入一串汉字："></asp:Label>
            <asp:TextBox ID="InputTextBox" runat="server"></asp:TextBox>
            <asp:Button ID="BtnShow" runat="server" OnClick="BtnShow_Click"  Text="显示拼音简码" />
            <asp:Label ID="LblShow" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>
