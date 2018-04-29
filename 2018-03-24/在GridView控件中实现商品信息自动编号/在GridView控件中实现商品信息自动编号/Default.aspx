<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="在GridView控件中实现商品信息自动编号.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>在GridView控件中实现自动编号</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table align="center" border="1" style="font-size: 9pt">
            <tr>
                <td style="font-size: 9pt; color: #ff0000; text-align: center">
                    商品信息</td>
            </tr>
            <tr>
                <td style="text-align: center">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                        CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanging="GridView1_PageIndexChanging"
                        OnRowDataBound="GridView1_RowDataBound" PageSize="4">
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <Columns>
                            <asp:BoundField HeaderText="自动编号" />
                            <asp:BoundField DataField="BccdID" HeaderText="商品ID" />
                            <asp:BoundField DataField="BccdName" HeaderText="商品名称" />
                            <asp:BoundField DataField="BccdInStock" HeaderText="库存量" />
                            <asp:BoundField DataField="Introduce" HeaderText="商品介绍" />
                            <asp:BoundField DataField="BccdPrice" HeaderText="商品价格" />
                            <asp:BoundField DataField="Discontinued" HeaderText="是否推荐" />
                        </Columns>
                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Right" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                    <i>您当前正在查看的页码：<b><font color="#ff0000"><%=GridView1.PageIndex + 1%>
                        /
                        <%=GridView1.PageCount%>
                    </font></b></i>
                </td>
            </tr>
        </table>
        </div>
    </form>
</body>
</html>
