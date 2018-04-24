<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="后台管理登录窗口中用户名及密码的重置.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1 {
            width: 399px;
            height: 205px;
            float: left;
        }

        .style2 {
            width: 72%;
        }

        .style3 {
            text-align: center;
        }

        .style4 {
            width: 88px;
            font-size: small;
            text-align: right;
        }

        .style5 {
            width: 88px;
            font-size: small;
            text-align: right;
        }

        #form1 {
            height: 212px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table align="left" cellpadding="0" cellspacing="0" class="style1">
            <tr>
                <td style="background-image: url('进销存后台登录.jpg')">
                    <table align="center" cellpadding="0" cellspacing="0" class="style2">
                        <tr>
                            <td class="style4">用户名：</td>
                            <td>

                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style5">密&nbsp;&nbsp;&nbsp; 码：</td>
                            <td>
                                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style3" colspan="2">
                                <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/后台按钮_03.gif"
                                    OnClick="ImageButton2_Click" />
                                <asp:ImageButton ID="ImageButton3" runat="server"
                                    OnClick="ImageButton3_Click" ImageUrl="~/后台按钮_05.gif" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
