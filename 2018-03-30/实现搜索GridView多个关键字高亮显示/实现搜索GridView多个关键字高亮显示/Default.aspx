<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="实现搜索GridView多个关键字高亮显示.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>实现搜索GridView多个关键字高亮显示</title>
    <style type="text/css">
        .highlightTxtSearch {
            background-color: Red;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <br />
        查找产品的关键字：<asp:TextBox ID="tbSearch" runat="server"></asp:TextBox>
        <asp:Button ID="btnSearch" runat="server" Text="搜索" Width="44px"
            OnClick="btnSearch_Click" />
        <asp:Label ID="Label4" runat="server" Style="color: #FF0000; font-size: small"
            Text="注意：多个关键字查找请用“，”分隔开！"></asp:Label>
        <div>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                AutoGenerateColumns="False" BackColor="#DEBA84"
                BorderColor="#DEBA84" BorderStyle="None"
                BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="产品编号"
                ShowFooter="True" Width="624px"
                OnRowCreated="GridView1_RowCreated" OnRowDataBound="GridView1_RowDataBound"
                OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="5">
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <Columns>
                    <asp:TemplateField HeaderText="产品名称">
                        <ItemTemplate>
                            <%# Highlightkeywords((string)Eval("产品"),this.tbSearch.Text.Trim()) %>
                        </ItemTemplate>
                    </asp:TemplateField>
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
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                <SelectedRowStyle BackColor="#C0FFC0" Font-Bold="True" ForeColor="Black" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
        </div>
    </form>
</body>
</html>
