<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="限制文本框中输入的字符长度.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>限制文本框中输入的字符长度</title>
    <style type="text/css">
        .style1 {
            width: 500px;
            height: 400px;
        }

        .style2 {
            width: 77%;
            height: 204px;
        }

        .style3 {
            width: 94px;
            text-align: right;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <table align="center" cellpadding="0" cellspacing="0" class="style1"
                style="background-image: url('注册页面.jpg')">
                <tr>
                    <td>
                        <table align="center" cellpadding="0" cellspacing="0" class="style2">
                            <tr>
                                <td class="style3">用户名：</td>
                                <td>
                                    <asp:TextBox ID="txtName" runat="server" MaxLength="12" Width="150px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style3">密&nbsp;&nbsp;&nbsp; 码：</td>
                                <td>
                                    <asp:TextBox ID="txtPwd" runat="server" TextMode="Password" Width="150px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style3">性&nbsp;&nbsp;&nbsp; 别：</td>
                                <td>
                                    <asp:RadioButtonList ID="rblsex" runat="server" RepeatDirection="Horizontal">
                                        <asp:ListItem Selected="True">男</asp:ListItem>
                                        <asp:ListItem>女</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                            <tr>
                                <td class="style3">&nbsp;</td>
                                <td>
                                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="注册" />
                                    &nbsp;&nbsp;
                                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="重置" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>
