<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DisplayDetail.aspx.cs" Inherits="Eval绑定图书图片并实现单击图片进行链接.DisplayDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table style="width: 513px; height: 170px; font-size: 9pt; background-image: url('../Image/例图/购物信息查询.jpg');"
                cellpadding="0" cellspacing="0" align="center" border="1" bordercolor="#cccc66">
                <tr>
                    <td style="width: 196px; text-align: center;" rowspan="3">
                        <asp:Image ID="iGPhoto" runat="server" Height="160px" Width="136px"
                            ImageUrl="~/images/ASP.NET编程词典.bmp" /></td>
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
            </table>
        </div>
    </form>
</body>
</html>
