<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Remember.aspx.cs" Inherits="日历备忘录.Remember" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style type="text/css">
        .style1 {
            height: 57px;
        }

        .style2 {
            width: 407px;
            height: 57px;
        }

        .style3 {
            width: 609px;
            height: 517px;
        }

        .style4 {
            width: 80%;
        }

        .style5 {
            width: 185px;
            text-align: right;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table align="center" cellpadding="0" cellspacing="0" class="style3"
            style="background-image: url('日历备忘录2.png')">
            <tr>
                <td>
                    <table align="center" cellpadding="0" cellspacing="0" class="style4"
                        style="font-size: small; height: 249px;">
                        <tr>
                            <td class="style5">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style5">输入主题内容：</td>
                            <td>
                                <asp:TextBox ID="txtContent" runat="server" Height="187px" TextMode="MultiLine"
                                    Width="96%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style5">&nbsp;</td>
                            <td>
                                <asp:LinkButton ID="BtnInput" runat="server" OnClick="BtnInput_Click">提交</asp:LinkButton>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:LinkButton ID="BtnClose" runat="server" OnClick="BtnClose_Click">关闭</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
