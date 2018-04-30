<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="根据多个字段内容设置不同数据行的背景色.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>根据多个字段内容设置不同数据行的背景色</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True"
                AutoGenerateColumns="False" BackColor="White"
                BorderColor="#DEDFDE" BorderStyle="None"
                BorderWidth="1px" CellPadding="4" DataKeyNames="产品编号"
                ShowFooter="True" Width="624px"
                OnRowCreated="GridView1_RowCreated" OnRowDataBound="GridView1_RowDataBound"
                OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="5"
                ForeColor="Black" GridLines="Vertical">
                <FooterStyle BackColor="#CCCC99" />
                <Columns>
                    <asp:BoundField DataField="产品编号" HeaderText="产品编号" InsertVisible="False" ReadOnly="True"
                        SortExpression="产品编号" />
                    <asp:BoundField DataField="单价" HeaderText="单价" SortExpression="单价" />
                    <asp:BoundField DataField="库存量" HeaderText="库存量" SortExpression="库存量" />
                    <asp:BoundField DataField="已订购量" HeaderText="已订购量" SortExpression="已订购量" />
                    <asp:TemplateField HeaderText="订货金额" SortExpression="订货金额">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("订货金额", "{0:c}") %>'></asp:Label>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:Label ID="OrderTotalLabel" runat="server" Font-Underline="True" ForeColor="Red"></asp:Label>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("订货金额", "{0:c}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="订单日期">
                        <EditItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("订单日期","{0:d}") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("订单日期","{0:d}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <RowStyle BackColor="#F7F7DE" />
                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <PagerStyle ForeColor="Black" HorizontalAlign="Right" BackColor="#F7F7DE" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
        </div>
    </form>
</body>
</html>
