<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="将GridView控件的数据导出到Excel并进行格式化.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>将GridView中数据导出到Excel并进行格式化处理</title>
</head>
<body>
     <form id="form1" runat="server">
    <div style="text-align: center">
        <table border="1" bordercolor="#bed0cd" cellpadding="0" cellspacing="0">
            <tr>
                <td style="font-weight: bold; font-size: 11pt; text-align: center">
                   将GridView中数据导出到Excel并进行格式化处理</td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#DEDFDE"
                        BorderStyle="None" BorderWidth="1px" CellPadding="4" Font-Size="11pt" ForeColor="Black"
                        GridLines="Vertical" AutoGenerateColumns="False" OnRowDataBound="GridView1_RowDataBound">
                        <FooterStyle BackColor="#CCCC99" />
                        <RowStyle BackColor="#F7F7DE" />
                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="商品ID" HeaderText="商品ID" />
                            <asp:BoundField DataField="商品名称" HeaderText="商品名称" />
                            <asp:BoundField DataField="商品介绍" HeaderText="商品介绍" />
                            <asp:BoundField DataField="商品价格" HeaderText="商品价格" />
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td style="text-align: center">
                    <asp:Button ID="Button1" runat="server" Font-Size="9pt" OnClick="Button1_Click" Text="导出Excel并格式化" style="border-left-color: #3333ff; border-bottom-color: #3333ff; border-top-style: inset; border-top-color: #3333ff; border-right-style: inset; border-left-style: inset; border-right-color: #3333ff; border-bottom-style: inset"/></td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
