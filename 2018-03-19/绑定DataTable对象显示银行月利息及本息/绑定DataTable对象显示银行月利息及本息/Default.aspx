<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="绑定DataTable对象显示银行月利息及本息.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>绑定DataTable对象</title>
    <style type="text/css">
        .style1 {
            width: 35%;
        }

        .style2 {
            width: 35%;
        }

        .style3 {
            width: 1053px;
        }

        .style4 {
            height: 118px;
        }

        .style5 {
            width: 1053px;
            height: 118px;
        }

        .style6 {
            height: 118px;
            width: 382px;
        }

        .style7 {
            width: 382px;

        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <table align="center" class="style1">
            <tr>
                <td>&nbsp;</td>
            </tr>
        </table>

        <div>
        </div>

        <table align="center" class="style2"
            style="background-image: url('银行.bmp'); height: 597px;">
            <tr>
                <td class="style4"></td>
                <td class="style5"></td>
                <td class="style6"></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="style3">&nbsp;</td>
                <td class="style7">
                    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333"
                        GridLines="None" Width="230px" Style="font-size: small">
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <RowStyle BackColor="#E3EAEB" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#7C6F57" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="style3">&nbsp;</td>
                <td class="style7">&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
