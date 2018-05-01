<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="嵌套DropDownList控件根据库存量设置商品停售.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>嵌套DropDownList控件根据库存量设置商品停售</title>
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
        <asp:Button ID="btnReturn" runat="server" OnClick="btnReturn_Click" Text="返回" />
        <div>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                AutoGenerateColumns="False" BackColor="#DEBA84"
                BorderColor="#DEBA84" BorderStyle="None"
                BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="产品编号"
                ShowFooter="True" Width="642px"
                OnRowCreated="GridView1_RowCreated" OnRowDataBound="GridView1_RowDataBound"
                OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="5"
                OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating"
                Style="font-size: small">
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <Columns>
                    <asp:TemplateField HeaderText="产品名称">
                        <ItemTemplate>
                            <%# HightLightText((string)Eval("产品"), this.tbSearch.Text.Trim())%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="单价" HeaderText="单价" SortExpression="单价"
                        ReadOnly="True" />
                    <asp:BoundField DataField="库存量" HeaderText="库存量" SortExpression="库存量"
                        ReadOnly="True" />
                    <asp:BoundField DataField="已订购量" HeaderText="已订购量" SortExpression="已订购量"
                        ReadOnly="True" />
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
                    <asp:TemplateField HeaderText="是否停售">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlSellState" runat="server" AutoPostBack="True">
                                <asp:ListItem Value="True">停售</asp:ListItem>
                                <asp:ListItem Value="False">不停售</asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("SellState") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField HeaderText="设置" ShowEditButton="True" />
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
