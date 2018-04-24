<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="将SQLServer数据查询结果输出到Excel.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>将SQLServer数据查询结果输出到Excel</title>
    <style type="text/css">
        .style1
        {
            border: medium double #E7E7E7;
            font-size: 10pt;
        }
    </style>
</head>
<body style="font-size: 10pt">
    <form id="form1" runat="server">
    <div>
        <table class="style1">
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField DataField="EName" HeaderText="姓名" />
                        <asp:BoundField DataField="ESex" HeaderText="性别" />
                        <asp:BoundField DataField="EAge" HeaderText="年龄" />
                        <asp:BoundField DataField="EPlace" HeaderText="籍贯" />
                        <asp:BoundField DataField="EMoney" HeaderText="工资" />
                    </Columns>
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <asp:Button ID="BtnExport" runat="server" Text="导出" Width="80px" 
                        onclick="BtnExport_Click" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
