<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="创建Excel文件并保存.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>创建Excel文件并保存</title>
    <style type="text/css">
        .style1 {
            border: medium double #E7E7E7;
            font-size: 10pt;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="style1">
                <tr>
                    <td>保存Excel文件的路径</td>
                    <td>
                        <asp:TextBox ID="TxtSavePath" runat="server" Width="300px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <asp:Button ID="BtnCreate" runat="server" Text="创建" OnClick="BtnCreate_Click" Width="80px"/>
                    </td>
                </tr>
            </table>
        </div>

    </form>
</body>
</html>
