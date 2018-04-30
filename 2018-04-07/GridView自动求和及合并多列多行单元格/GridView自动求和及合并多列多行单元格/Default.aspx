<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="GridView自动求和及合并多列多行单元格.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>GridView控件中自动求和、合并单元格和排序</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table align="center" border="1" cellpadding="0" cellspacing="0">
                <tr>
                    <td style="font-size: 9pt; color: #ff0000; text-align: center; height: 16px;">学生成绩信息</td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                            CellPadding="4" Font-Size="9pt" ForeColor="#333333" OnSorting="GridView1_Sorting" OnRowDataBound="GridView1_RowDataBound">
                            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <Columns>
                                <asp:BoundField DataField="stuname" HeaderText="学生姓名" SortExpression="stuname">
                                    <ControlStyle Font-Underline="False" />
                                </asp:BoundField>
                                <asp:BoundField DataField="stusex" HeaderText="学生性别" SortExpression="stusex">
                                    <ControlStyle Font-Underline="False" />
                                </asp:BoundField>
                                <asp:BoundField DataField="which_lesson" HeaderText="考试科目" SortExpression="which_lesson">
                                    <ControlStyle Font-Underline="False" />
                                </asp:BoundField>
                                <asp:BoundField DataField="taotiname" HeaderText="套题名称" SortExpression="taotiname">
                                    <ControlStyle Font-Underline="False" />
                                </asp:BoundField>
                                <asp:BoundField DataField="res_total" HeaderText="分数" SortExpression="res_total" />
                            </Columns>
                            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: 9pt; text-align: center">请输入您要查找的学生姓名：<asp:TextBox ID="TextBox1" runat="server" Width="86px">mr</asp:TextBox>
                        <asp:Button ID="Button1" runat="server" Font-Size="9pt" OnClick="Button1_Click" Text="查询" />
                        <asp:Button ID="btnBack" runat="server" OnClick="btnBack_Click" Text="返回" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
