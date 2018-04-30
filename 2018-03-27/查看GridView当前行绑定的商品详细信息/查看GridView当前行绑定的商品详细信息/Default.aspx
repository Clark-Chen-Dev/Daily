<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="查看GridView当前行绑定的商品详细信息.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>GridView控件中查看当前页详细信息</title>
</head>
<body style="vertical-align: middle; text-align: center">
    <form id="form1" runat="server">
        <div>
            <table style="width: 529px; height: 355px; font-size: 9pt;" cellpadding="0" cellspacing="0" align="center" border="1" bordercolor="#cccc66">
                <tr>
                    <td style="width: 97px; text-align: left;">
                        <asp:TreeView ID="tvGType" runat="server" NodeIndent="10" ShowExpandCollapse="False" ShowLines="True" Height="368px" Width="100px">
                            <ParentNodeStyle Font-Bold="False" />
                            <HoverNodeStyle Font-Underline="True" ForeColor="#5555DD" />
                            <SelectedNodeStyle Font-Underline="True" ForeColor="#5555DD" HorizontalPadding="0px"
                                VerticalPadding="0px" />
                            <Nodes>
                                <asp:TreeNode Text="编程词典" Value="服装">
                                    <asp:TreeNode Text="ASP.NET" Value="衣服"></asp:TreeNode>
                                    <asp:TreeNode Text="c#" Value="裤子"></asp:TreeNode>
                                    <asp:TreeNode Text="JAVA" Value="鞋"></asp:TreeNode>
                                </asp:TreeNode>
                                <asp:TreeNode Text="明日图书" Value="电器">
                                    <asp:TreeNode Text="ASP.NET" Value="电视机"></asp:TreeNode>
                                    <asp:TreeNode Text="VB" Value="空调"></asp:TreeNode>
                                    <asp:TreeNode Text="VC" Value="冰箱"></asp:TreeNode>
                                </asp:TreeNode>
                                <asp:TreeNode Text="家用商品" Value="家用商品">
                                    <asp:TreeNode Text="毛巾" Value="毛巾"></asp:TreeNode>
                                    <asp:TreeNode Text="牙膏" Value="牙膏"></asp:TreeNode>
                                    <asp:TreeNode Text="牙刷" Value="牙刷"></asp:TreeNode>
                                </asp:TreeNode>
                                <asp:TreeNode Text="文具" Value="文具">
                                    <asp:TreeNode Text="文具盒" Value="文具盒"></asp:TreeNode>
                                    <asp:TreeNode Text="钢笔" Value="钢笔"></asp:TreeNode>
                                    <asp:TreeNode Text="圆珠笔" Value="圆珠笔"></asp:TreeNode>
                                </asp:TreeNode>
                            </Nodes>
                            <NodeStyle Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" HorizontalPadding="0px"
                                NodeSpacing="0px" VerticalPadding="0px" />
                        </asp:TreeView>
                    </td>
                    <td colspan="2" style="vertical-align: top; width: 470px; text-align: center;" align="left">&nbsp;<br />
                        <br />
                        <br />
                        <asp:Label ID="Label2" runat="server" Text="查询条件："></asp:Label>
                        <asp:DropDownList ID="ddlCondition" runat="server">
                            <asp:ListItem Value="GoodsID">商品ID</asp:ListItem>
                            <asp:ListItem Value="GoodsTypeName">商品类别</asp:ListItem>
                            <asp:ListItem Value="GoodsName">商品名称</asp:ListItem>
                            <asp:ListItem Value="StoreName">仓库</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp; &nbsp; &nbsp;
            <asp:Label ID="Label1" runat="server" Text="关键字："></asp:Label>
                        <asp:TextBox ID="txtKey" runat="server" Width="90px"></asp:TextBox>
                        <asp:Button ID="btnSel" runat="server" Height="20px" Text="查询"
                            Width="43px"/><br />
                        <br />
                        <asp:GridView ID="gvGoodsInfo" runat="server" CellPadding="4"
                            ForeColor="#333333" GridLines="None" Font-Size="9pt"
                            AutoGenerateColumns="False" AllowPaging="True" PageSize="8"
                            OnPageIndexChanging="gvGoodsInfo_PageIndexChanging" Width="450px">
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <EditRowStyle BackColor="#999999" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <PagerStyle BackColor="#CBCF7A" ForeColor="Black" HorizontalAlign="Right" />
                            <HeaderStyle BackColor="#CBCF7A" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:BoundField DataField="PicId" HeaderText="商品ID" />
                                <asp:BoundField DataField="PicType" HeaderText="所属类别" />
                                <asp:BoundField DataField="GoodsStock" HeaderText="库存量" />
                                <asp:BoundField DataField="PicName" HeaderText="商品名称" />
                                <asp:HyperLinkField HeaderText="详细信息" Text="详细信息" DataNavigateUrlFields="PicId"
                                    DataNavigateUrlFormatString="EditGInfo.aspx?GoodsID={0}" Target="mainframe"
                                    NavigateUrl="~/MemberManage/EditGInfo.aspx">
                                    <ControlStyle Font-Underline="False" ForeColor="Black" />
                                    <ItemStyle Font-Underline="False" ForeColor="Black" />
                                    <HeaderStyle Font-Underline="False" ForeColor="Black" />
                                </asp:HyperLinkField>
                            </Columns>
                        </asp:GridView>
                        <br />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
GridView强制换行显示论坛帖子的详细信息 - Microsoft Visual Studio (管理员)	2018/4/30 11:12:48 +08:00	2018/4/30 11:12:56 +08:00	
