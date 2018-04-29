<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="获取GridView控件中隐藏的列值.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                Font-Size="9pt" AllowPaging="True"
                OnPageIndexChanging="GridView1_PageIndexChanging" CellPadding="4"
                ForeColor="#333333" GridLines="None" DataKeyNames="id">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="信息ID" Visible="false" />
                    <asp:BoundField DataField="name" HeaderText="信息主题" />
                    <asp:BoundField DataField="type" HeaderText="信息分类" />
                    <asp:BoundField DataField="userName" HeaderText="发布人" />
                    <asp:BoundField DataField="lineMan" HeaderText="联系人" />
                    <asp:BoundField DataField="term" HeaderText="有效期" DataFormatString="{0:d}" />
                    <asp:TemplateField HeaderText="是否查看其编号">
                        <ItemTemplate>
                            <asp:CheckBox ID="cbChecked" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Right" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>

            <asp:Button ID="btnCheck" runat="server" OnClick="btnCheck_Click"
                Text="查看该信息在数据库中的编号" />
            <br />
        </div>
    </form>
</body>
</html>
