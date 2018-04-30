<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="学生成绩不及格设置单元格突出显示为红色.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>根据学生成绩合格与不合格显示不同颜色</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table align="center" border="1" style="font-size: 9pt;" cellpadding="0" cellspacing="0">
                <tr>
                    <td style="font-size: 9pt; color: #ff0000; text-align: center">学生成绩信息</td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                            Font-Size="9pt" ForeColor="#333333">
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <Columns>
                                <asp:BoundField DataField="res_id" HeaderText="学生编号" />
                                <asp:BoundField DataField="stuname" HeaderText="学生姓名" />
                                <asp:BoundField DataField="stusex" HeaderText="学生性别" />
                                <asp:BoundField DataField="which_lesson" HeaderText="考试科目" />
                                <asp:BoundField DataField="taotiname" HeaderText="考试套题" />
                                <asp:BoundField DataField="res_total" HeaderText="考试成绩" />
                                <asp:BoundField DataField="res_subdate" HeaderText="考试时间" />
                            </Columns>
                            <RowStyle BackColor="#EFF3FB" />
                            <EditRowStyle BackColor="#2461BF" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:GridView>
                    </td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>
