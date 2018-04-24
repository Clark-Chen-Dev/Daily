<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="格式化订货金额和订单日期并进行绑定.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>格式化订货金额和订单日期并进行绑定</title>
</head>
<body>

    <form id="form1" runat="server">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="产品编号" PageSize="5" ShowFooter="True" Width="624px" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCreated="GridView1_RowCreated" OnRowDataBound="GridView1_RowDataBound">
            <Columns>
                <asp:BoundField DataField="产品编号" HeaderText="产品编号" InsertVisible="False" ReadOnly="True" SortExpression="产品编号" />
                <asp:BoundField DataField="单价" HeaderText="单价" SortExpression="单价" />
                <asp:BoundField DataField="库存量" HeaderText="库存量" SortExpression="库存量" />
                <asp:BoundField DataField="已订购量" HeaderText="已订购量" SortExpression="已订购量" />
                <asp:TemplateField HeaderText="订货金额" SortExpression="订货金额">
                    <ItemTemplate>
                        <asp:Label ID="OrderAmountLabel" runat="server" Text='<%# Eval("订货金额", "{0:c}") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:Label ID="OrderTotalLabel" runat="server" Font-Underline="True" ForeColor="Red"></asp:Label>
                    </FooterTemplate>
                </asp:TemplateField>
                    
                <asp:TemplateField HeaderText="订单日期">
                    <ItemTemplate>
                        <asp:Label ID="OrderDateLabel" runat="server" Text='<%# Eval("订单日期","{0:d}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FFF1D4" />
            <SortedAscendingHeaderStyle BackColor="#B95C30" />
            <SortedDescendingCellStyle BackColor="#F1E5CE" />
            <SortedDescendingHeaderStyle BackColor="#93451F" />
        </asp:GridView>
    </form>

</body>
</html>
