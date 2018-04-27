<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Eval绑定图书图片并实现单击图片进行链接.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="Repeater1" runat="server" AutoGenerateColumns="False"
                AllowPaging="True" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None"
                BorderWidth="1px" CellPadding="3" CellSpacing="2"
                OnPageIndexChanging="Repeater1_PageIndexChanging" PageSize="2">
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                <Columns>
                    <asp:TemplateField HeaderText="图书编号">
                        <ItemTemplate>
                            <asp:Label ID="lbID" runat="server" Text='<%# Eval("PicId") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="图书图片预览">
                        <ItemTemplate>
                            <a href='DisplayDetail.aspx?id=<%# Eval("PicId") %>' title="单击此按钮，来查阅更详细的资料。" />
                            <asp:Image ID="ProductImage" ImageUrl='<%# Eval( "PicPath") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="图书封面图片名">
                        <ItemTemplate>
                            <asp:Label ID="lbBookName" runat="server" Text='<%# Eval("PicName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="类别">
                        <ItemTemplate>
                            <asp:Label ID="lbType" runat="server" Text='<%# Eval("PicType") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
        </div>
    </form>
</body>
</html>
