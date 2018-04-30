<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditGInfo.aspx.cs" Inherits="查看GridView当前行绑定的商品详细信息.EditGInfo" %>

<!DOCTYPE html  PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table style="width: 513px; height: 355px; font-size: 9pt; background-image: url(../Image/例图/购物信息查询.jpg);" cellpadding="0" cellspacing="0" align="center" border="1" bordercolor="#cccc66">
                <tr>
                    <td colspan="3" style="text-align: center">=== 商品详细信息 ===</td>
                </tr>
                <tr>
                    <td style="width: 196px; text-align: center;" rowspan="5">
                        <asp:Image ID="iGPhoto" runat="server" Height="160px" Width="136px" /></td>
                    <td style="width: 100px; text-align: center; height: 30px;">商 品 ID：</td>
                    <td style="width: 346px; height: 30px;">
                        <asp:TextBox ID="txtGID" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 100px; text-align: center; height: 30px;">商品名称：</td>
                    <td style="width: 346px; height: 30px;">
                        <asp:TextBox ID="txtGName" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 100px; text-align: center; height: 30px;">商品类别：</td>
                    <td style="width: 346px; height: 30px;">
                        <asp:TextBox ID="txtGType" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 100px; text-align: center; height: 30px;">现库存量：</td>
                    <td style="width: 346px; height: 30px;">
                        <asp:TextBox ID="txtGStore" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 100px; text-align: center; height: 30px;">已销售量：</td>
                    <td style="width: 346px; text-indent: 8pt; height: 30px;">
                        <asp:TextBox ID="txtGPrice" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="3">&nbsp;商品介绍：</td>
                </tr>
                <tr>
                    <td style="height: 134px; vertical-align: top; text-indent: 8pt; text-align: center;" colspan="3">
                        <asp:TextBox ID="txtGIntro" runat="server" Height="150px" TextMode="MultiLine" Width="510px" ReadOnly="True"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="text-align: right; height: 24px;" colspan="3">
                        <asp:Button ID="btnShop" runat="server" Text="购买" Height="23px" Width="60px" />&nbsp;&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
