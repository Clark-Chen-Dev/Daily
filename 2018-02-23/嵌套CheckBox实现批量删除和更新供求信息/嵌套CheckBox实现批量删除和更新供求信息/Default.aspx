<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="嵌套CheckBox实现批量删除和更新供求信息.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>嵌套CheckBox实现批量删除和更新供求信息</title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align: left" align="left">
            <asp:Panel ID="Panel1" runat="server">
                <asp:GridView ID="GridView1" AutoGenerateColumns="False" OnRowDataBound="GridView1_RowDataBound" runat="server" Font-Size="9pt" AllowPaging="True" EmptyDataText="没有相关数据可以显示！" OnPageIndexChanging="GridView1_PageIndexChanging" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Right" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:CheckBox ID="ChkSel" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="id" HeaderText="信息ID" />
                        <asp:BoundField DataField="name" HeaderText="信息主题" />
                        <asp:BoundField DataField="type" HeaderText="信息分类" />
                        <asp:BoundField DataField="content" HeaderText="发布内容" />
                        <asp:BoundField DataField="userName" HeaderText="发布人" />
                        <asp:BoundField DataField="lineMan" HeaderText="联系人" />
                        <asp:BoundField DataField="issueDate" HeaderText="发布时间" DataFormatString="{0:d}" />
                    </Columns>
                </asp:GridView>
            </asp:Panel>
            <asp:CheckBox ID="ChkSelAll" runat="server" AutoPostBack="True"
                Font-Size="9pt" OnCheckedChanged="ChkSelAll_CheckedChanged"
                Text="全选/反选" />
            <asp:Button ID="BtnDel" runat="server" Text="部分删除或全部删除" Font-Size="9pt" OnClick="BtnDel_Click"
                OnLoad="BtnDel_Load" Width="134px" />
            <asp:Button ID="BtnDesel" runat="server" Text="取消部分或全部选择" OnClick="BtnDesel_Click" Font-Size="9pt" Width="126px" />
            <asp:Button ID="BtnUpd" runat="server" Text="更新发布时间" OnClick="BtnUpd_Click" />
        </div>
    </form>
</body>
</html>
