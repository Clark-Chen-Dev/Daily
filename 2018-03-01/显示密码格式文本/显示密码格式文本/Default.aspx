<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="显示密码格式文本.Default" %>

<!DOCTYPE html">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>显示密码格式文本</title>
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
        }

        td {
            font-family: Arial, Helvetica, sans-serif;
        }

        th {
            font-family: Arial, Helvetica, sans-serif;
        }

        .green {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 12px;
            font-weight: bold;
            color: #4b8c1b;
        }

        .bg {
            color: #339900;
            font-family: "宋体";
            font-size: 12px;
            line-height: 18px;
            border: 1px solid #a4ba8d;
            background-color: #defd7b;
        }
    </style>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
    <form id="form1" runat="server">
        <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <table width="486" height="291" border="0" align="center" cellpadding="0" cellspacing="0" id="__01">
                        <tr>
                            <td>
                                <img src="images/login_01.gif" width="486" height="171" alt=""></td>
                        </tr>
                        <tr>
                            <td height="120" background="images/login_02.gif">
                                <table width="303" height="87" border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="28" rowspan="3">&nbsp;</td>
                                        <td width="58" class="green">用户名：              </td>
                                        <td width="217" class="green">
                                            <asp:TextBox ID="TextBox1" runat="server" class="bg" Width="150px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="green">密&nbsp;&nbsp;&nbsp;码：              </td>
                                        <td class="green">
                                            <asp:TextBox ID="TextBox2" runat="server" class="bg" TextMode="Password"
                                                Width="150px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="40" colspan="2"><a href="#">
                                            <img src="images/qr.gif" width="68" height="22" border="0"></a>&nbsp;<a href="#"><img src="images/qx.gif" width="68" height="22" border="0"></a></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
