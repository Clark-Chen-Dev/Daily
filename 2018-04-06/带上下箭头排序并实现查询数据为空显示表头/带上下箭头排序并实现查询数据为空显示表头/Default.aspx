<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="带上下箭头排序并实现查询数据为空显示表头.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>带上下箭头排序并实现查询数据为空显示表头</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            输入产品关键字：<asp:TextBox ID="tbSearch" runat="server"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click"
                Text="查 询" />

            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="返回" />

            <asp:GridView AllowSorting="True" ID="GVpositionrecods" runat="server"
                PageSize="8" EmptyDataText="没有相关数据可以显示！" Width="39%" AutoGenerateColumns="False"
                OnRowCreated="GVpositionrecods_RowCreated"
                OnSorting="GVpositionrecods_Sorting" AllowPaging="True"
                OnPageIndexChanging="GVpositionrecods_PageIndexChanging">
                <Columns>
                    <asp:TemplateField HeaderText="编程词典版本" SortExpression="产品">
                        <ItemTemplate>
                            <%#Eval("产品")%>
                                </a>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="单位数量" SortExpression="单位数量">
                        <ItemTemplate>
                            <%#Eval("单位数量")%>
                                </a>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="单价" HeaderText="单价" SortExpression="单价" />
                    <asp:BoundField DataField="库存量" HeaderText="库存量" SortExpression="库存量" />
                    <asp:BoundField DataField="订单日期" SortExpression="订单日期" HeaderText="发布时间"
                        DataFormatString="{0:yyyy-MM-dd}" HtmlEncode="False">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>


                </Columns>
                <AlternatingRowStyle BackColor="#E2F8FF"></AlternatingRowStyle>
                <HeaderStyle HorizontalAlign="Center" BackColor="#99CCFF"></HeaderStyle>
                <PagerStyle CssClass="cssPager" />
            </asp:GridView>
        </div>
    </form>
</body>
</html>
