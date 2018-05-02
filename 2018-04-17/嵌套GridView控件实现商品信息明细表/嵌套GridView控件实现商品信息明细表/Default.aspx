<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="嵌套GridView控件实现商品信息明细表.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>嵌套GridView控件实现商品信息明细表</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table align="center" border="1" style="font-size: 9pt">
                <tr>
                    <td style="font-size: 9pt; color: #ff0000; text-align: center;">商品明细信息</td>
                </tr>
                <tr>
                    <td style="text-align: center;">
                        <asp:GridView ID="gvOrder" runat="server" AutoGenerateColumns="False"
                            AllowPaging="True" PageSize="1" CellPadding="3" OnPageIndexChanging="gvOrder_PageIndexChanging"
                            OnRowDataBound="gvOrder_RowDataBound" BackColor="#DEBA84"
                            BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellSpacing="2">
                            <PagerStyle HorizontalAlign="Center" ForeColor="#8C4510" />
                            <Columns>
                                <asp:BoundField DataField="GoodsTypeName" HeaderText="商品类别" />
                                <asp:BoundField DataField="StoreID" HeaderText="库存编号" />
                                <asp:BoundField DataField="OrderTime"
                                    HeaderText="订单日期" DataFormatString="{0:d}" />
                                <asp:TemplateField HeaderText="商品明细">
                                    <ItemTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:GridView ID="gvDetail" runat="server" AutoGenerateColumns="False"
                                                        DataMember="GoodsTypeID" EmptyDataText="暂无商品明细！">
                                                        <Columns>
                                                            <asp:BoundField DataField="GoodsName" HeaderText="商品名称" />
                                                            <asp:BoundField DataField="GoodsIntroduce" HeaderText="商品介绍" />
                                                            <asp:BoundField DataField="GoodsPrice" HeaderText="商品价格" />
                                                            <asp:BoundField DataField="GoodsIsNew" HeaderText="是否推荐" />
                                                            <asp:TemplateField HeaderText="商品图像">
                                                                <ItemTemplate>
                                                                    <asp:Image ID="ProductImage" ImageUrl='<%# Eval( "GoodsPhoto") %>' runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
