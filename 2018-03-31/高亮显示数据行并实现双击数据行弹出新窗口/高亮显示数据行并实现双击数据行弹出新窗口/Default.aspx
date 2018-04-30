<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="高亮显示数据行并实现双击数据行弹出新窗口.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>高亮显示数据行并实现双击数据行弹出新窗口</title>
    <style type="text/css">
        .style1 {
            width: 84px;
            height: 158px;
        }

        .style2 {
            width: 295px;
            height: 158px;
        }

        .style3 {
            width: 100px;
            height: 158px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div align="center">
            <table style="background-image: url(image/物资管理系统.jpg); width: 646px; height: 454px">
                <tr>
                    <td class="style1"></td>
                    <td class="style2"></td>
                    <td class="style3"></td>
                </tr>
                <tr>
                    <td style="width: 84px; height: 10px"></td>
                    <td rowspan="2" style="width: 295px">
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                            CellPadding="4" Font-Size="10pt" GridLines="Horizontal" Height="209px"
                            OnPageIndexChanging="GridView1_PageIndexChanging"
                            OnRowDataBound="GridView1_RowDataBound" PageSize="4" Width="571px"
                            BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px">
                            <FooterStyle BackColor="White" ForeColor="#333333" />
                            <Columns>
                                <asp:BoundField DataField="stor_id" HeaderText="库存编号" />
                                <asp:BoundField DataField="stor_name" HeaderText="订单名称" />
                                <asp:BoundField DataField="stor_address" HeaderText="邮寄地址" />
                                <asp:BoundField DataField="city" HeaderText="所在城市" />
                            </Columns>
                            <RowStyle BackColor="White" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                            <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                        </asp:GridView>
                    </td>
                    <td style="width: 100px; height: 10px"></td>
                </tr>
                <tr>
                    <td style="width: 84px; height: 12px"></td>
                    <td style="width: 100px; height: 12px"></td>
                </tr>
                <tr>
                    <td style="width: 84px"></td>
                    <td style="width: 295px"></td>
                    <td style="width: 100px"></td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>
