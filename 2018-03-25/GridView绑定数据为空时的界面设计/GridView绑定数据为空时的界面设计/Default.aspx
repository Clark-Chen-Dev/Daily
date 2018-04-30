<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="GridView绑定数据为空时的界面设计.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="font-size: 13px;">
            <asp:GridView ID="GridViewEmptyDataShow" runat="server" AutoGenerateColumns="False"
                EmptyDataText="无相关记录信息！" BackColor="White" BorderColor="LightGray"
                BorderStyle="Double" BorderWidth="3px"
                CellPadding="4" GridLines="Horizontal" Width="500px">

                <Columns>
                    <asp:BoundField DataField="name" HeaderText="编程词典版本">
                        <ItemStyle BorderColor="LightGray" BorderStyle="Double" BorderWidth="1px"
                            Width="100px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="location" HeaderText="内容简介">
                        <ItemStyle BorderColor="LightGray" BorderStyle="Double" BorderWidth="1px" Width="300px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="date" HeaderText="发布日期">
                        <ItemStyle BorderColor="LightGray" BorderStyle="Double" BorderWidth="1px" Width="100px" />
                    </asp:BoundField>
                </Columns>

                <FooterStyle BackColor="White" ForeColor="#333333" />
                <RowStyle BackColor="White" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="CornflowerBlue" Font-Bold="True" ForeColor="White" />
            </asp:GridView>

            <br />

            <asp:Button ID="ButtonHasDataBind" runat="server" Text="数据源为空" Width="109px"
                OnClick="ButtonHasDataBind_Click" />
            <asp:Button ID="ButtonQueryEmptyBind" runat="server" Text="查询结果为空绑定" Width="142px" OnClick="ButtonQueryEmptyBind_Click" />
            <asp:Button ID="ButtonConstructTableBind" runat="server" Text="构造空的DataTable绑定" Width="164px" OnClick="ButtonConstructTableBind_Click" />
            <asp:Button ID="ButtonNormalBind" runat="server" Text="普通空数据绑定" Width="127px" OnClick="ButtonNormalBind_Click" />
        </div>
    </form>
</body>
</html>
