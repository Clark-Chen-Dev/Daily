<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="当前所处月份是地球上的春夏秋冬哪个季节.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 400px;
            height: 146px;
        }
        .style2
        {
            width: 100%;
            float: left;
            height: 127px;
        }
        .style3
        {
            height: 99px;
        }
        .style4
        {
            width: 62%;
            height: 54px;
        }
        .style6
        {
            width: 99px;
            text-align: right;
            font-size: small;
        }
        .style7
        {
            width: 100%;
        }
        .style8
        {
            width: 69px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table align="left" cellpadding="0" cellspacing="0" class="style1"
            style="background-image: url('季节.jpg')">
            <tr>
                <td>
                    <table align="left" cellpadding="0" cellspacing="0" class="style2">
                        <tr>
                            <td class="style3">
                                <table align="left" cellpadding="0" cellspacing="0" class="style4">
                                    <tr>
                                        <td class="style6">输入月份：</td>
                                        <td>
                                            <asp:TextBox ID="txtmonth" runat="server" Height="15px" Width="87px"></asp:TextBox>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style6">地球季节：</td>
                                        <td>
                                            <asp:TextBox ID="txtShow" runat="server" Width="87px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: center">
                                <table align="left" cellpadding="0" cellspacing="0" class="style7">
                                    <tr>
                                        <td class="style8">&nbsp;</td>
                                        <td style="text-align: left">

                                            <asp:ImageButton ID="ImageButton1" runat="server"
                                                OnClick="ImageButton1_Click" ImageUrl="~/季节_03.gif" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <p>
            &nbsp;
        </p>
    </form>
</body>
</html>
