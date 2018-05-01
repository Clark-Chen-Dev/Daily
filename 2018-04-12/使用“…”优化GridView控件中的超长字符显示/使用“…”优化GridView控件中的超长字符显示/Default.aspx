<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="使用___优化GridView控件中的超长字符显示.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>供求信息网审核发布信息</title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align: center"><asp:Panel ID="Panel2" runat="server">
        <table align="center">
            <tr>
                <td style="font-size: 9pt; color: #ff0000; text-align: center">&nbsp;</td>
            </tr>
        </table>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDataBound="GridView1_RowDataBound" OnSelectedIndexChanging="GridView1_SelectedIndexChanging" Font-Size="9pt" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" CellPadding="4" ForeColor="#333333" GridLines="None">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="信息ID" />
                    <asp:BoundField DataField="name" HeaderText="信息主题" />
                    <asp:BoundField DataField="type" HeaderText="信息分类" />
                    <asp:BoundField DataField="content" HeaderText="发布内容" />
                    <asp:BoundField DataField="userName" HeaderText="发布人" />
                    <asp:BoundField DataField="lineMan" HeaderText="联系人" />
                    <asp:BoundField DataField="issueDate" HeaderText="有效期" 
                        DataFormatString="{0:d}" />
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
