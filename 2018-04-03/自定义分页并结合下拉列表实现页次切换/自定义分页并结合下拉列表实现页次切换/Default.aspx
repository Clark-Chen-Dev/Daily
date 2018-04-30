<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="自定义分页并结合下拉列表实现页次切换.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>自定义分页并结合下拉列表实现页次切换</title>
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
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True"
                AutoGenerateColumns="False" BackColor="#DEBA84"
                BorderColor="#DEBA84" BorderStyle="None"
                BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="产品编号"
                ShowFooter="True" Width="624px"
                OnRowCreated="GridView1_RowCreated"
                OnRowDataBound="GridView1_RowDataBound" PageSize="2">
                <PagerSettings Visible="False" />
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <Columns>
                    <asp:TemplateField HeaderText="产品名称">
                        <ItemTemplate>
                            <%#HightLightText((string)Eval("产品"), this.tbSearch.Text.Trim())%>
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
                <PagerTemplate>
                </PagerTemplate>
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
        </div>
        <asp:Button ID="Button_First" runat="server" OnClick="Button_First_Click"
            Text="第一页" />
        <asp:Button ID="Button_Last" runat="server" OnClick="Button_Last_Click"
            Text="上一页" />
        <asp:Button ID="Button_Next" runat="server" OnClick="Button_Next_Click"
            Text="下一页" />
        <asp:Button ID="Button_End" runat="server" OnClick="Button_End_Click"
            Text="最后一页" />
        跳转至：<asp:DropDownList ID="DropDown_PageList" runat="server" AutoPostBack="True"
            OnSelectedIndexChanged="DropDown_PageList_SelectedIndexChanged"
            Height="20px" Width="46px">
        </asp:DropDownList>
        <asp:Label ID="l_djy" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="l_gjy" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="l_jls" runat="server" Text="Label"></asp:Label>
        <br />
    </form>
</body>
</html>
