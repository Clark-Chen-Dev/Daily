<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="GridView删除数据时弹出确认对话框_含内容提示_.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>供求信息网审核发布信息</title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align: center">
            <asp:Panel ID="Panel2" runat="server">
                <table align="center">
                    <tr>
                        <td style="font-size: 9pt; color: #ff0000; text-align: center">&nbsp;</td>
                    </tr>
                </table>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                    OnRowDataBound="GridView1_RowDataBound"
                    OnSelectedIndexChanging="GridView1_SelectedIndexChanging" Font-Size="9pt"
                    AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging"
                    CellPadding="4" ForeColor="#333333" GridLines="None"
                    OnRowDeleting="GridView1_RowDeleting">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="信息ID" />
                        <asp:BoundField DataField="name" HeaderText="信息主题" />
                        <asp:BoundField DataField="type" HeaderText="信息分类" />
                        <asp:BoundField DataField="userName" HeaderText="发布人" />
                        <asp:BoundField DataField="lineMan" HeaderText="联系人" />
                        <asp:BoundField DataField="term" HeaderText="有效期" DataFormatString="{0:d}" />
                        <asp:BoundField DataField="check" HeaderText="审核" />
                        <asp:CommandField HeaderText="通过/取消" SelectText="通过/取消" ShowSelectButton="True" />
                        <asp:CommandField HeaderText="删除" ShowDeleteButton="True" />
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Right" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
