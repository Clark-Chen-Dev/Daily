<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DisplayDetail.aspx.cs" Inherits="高亮显示数据行并实现双击数据行弹出新窗口.DisplayDetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>显示明细</title>
    <style type="text/css">
        .style1 {
            height: 30px;
            width: 851px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table style="width: 386px; height: 170px; font-size: 9pt; background-image: url('../Image/例图/购物信息查询.jpg');"
                cellpadding="0" cellspacing="0" align="center" border="1"
                bordercolor="#cccc66">
                <tr>
                    <td style="width: 196px; text-align: center;" rowspan="3">
                        <asp:Image ID="iGPhoto" runat="server" Height="160px" Width="136px"
                            ImageUrl="~/ASP.NET编程词典.bmp" /></td>
                    <td style="text-align: center;" class="style1">商 品 ID：</td>
                    <td style="width: 346px; height: 30px;">
                        <asp:TextBox ID="txtGID" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="text-align: center;" class="style1">商品名称：</td>
                    <td style="width: 346px; height: 30px;">
                        <asp:TextBox ID="txtGName" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="text-align: center;" class="style1">商品类别：</td>
                    <td style="width: 346px; height: 30px;">
                        <asp:TextBox ID="txtGType" runat="server"></asp:TextBox></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
