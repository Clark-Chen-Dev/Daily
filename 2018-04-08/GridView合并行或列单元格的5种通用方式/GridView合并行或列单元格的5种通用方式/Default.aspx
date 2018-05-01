<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="GridView合并行或列单元格的5种通用方式.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>GridView控件中自动求和、合并单元格和排序</title>
    <style type="text/css">
        .style1 {
            width: 100%;
        }

        .style2 {
            width: 96px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table align="center" border="1" cellpadding="0" cellspacing="0" style="width: 463px">
                <tr>
                    <td style="font-size: 9pt; color: #ff0000; text-align: center; height: 16px;">学生成绩信息</td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                            CellPadding="4" Font-Size="9pt" ForeColor="#333333"
                            OnSorting="GridView1_Sorting" OnRowDataBound="GridView1_RowDataBound"
                            Width="453px">
                            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />

                            <Columns>
                                <asp:BoundField HeaderText="数据行数" />
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
                    <td style="font-size: 9pt; text-align: center">
                        <table class="style1">
                             <tr>
                                <td align="right" colspan="2">合并的第<asp:TextBox ID="TextBox1" runat="server" Width="56px" Height="23px"></asp:TextBox>
                                    行中相同信息：</td>
                                <td align="left">
                                    <asp:Button ID="btnMergeAdjacentColsRow" runat="server" OnClick="btnMergeAdjacentColsRow_Click"
                                        Text="合并GridView中某行相同信息" Height="26px" Width="185px" />
                                </td>
                            </tr>
                            <tr>
                                <td align="right" colspan="2">合并第<asp:TextBox ID="tbRows" runat="server" Height="20px" Width="34px"></asp:TextBox>
                                    行中从<asp:TextBox ID="tbstartCol" runat="server" Height="20px" Width="38px"></asp:TextBox>
                                    到<asp:TextBox ID="tbendCol" runat="server" Height="20px" Width="38px"></asp:TextBox>
                                    列：</td>
                                <td align="left">
                                    <asp:Button ID="btnMergeColsRow" runat="server" OnClick="btnMergeColsRow_Click"
                                        Text="合并一行中的几列" />
                                </td>
                            </tr>
                            <tr>
                                <td align="right" colspan="2">合并第<asp:TextBox ID="tbCol" runat="server" Height="22px" Width="41px"></asp:TextBox>
                                    列：</td>
                                <td align="left">
                                    <asp:Button ID="btnColumn" runat="server" Height="27px" OnClick="btnColumn_Click"
                                        Text="合并GridView中某列相同信息" Width="184px" />
                                </td>
                            </tr>
                            <tr>
                                <td align="right" colspan="2">合并第<asp:TextBox ID="tbColumns" runat="server" Height="22px" Width="26px"></asp:TextBox>
                                    列中从<asp:TextBox ID="tbstartRow" runat="server" Height="22px" Width="26px"></asp:TextBox>
                                    到<asp:TextBox ID="tbendRow" runat="server" Height="22px" Width="26px"></asp:TextBox>
                                    行</td>
                                <td align="left">
                                    <asp:Button ID="btnColAndRows" runat="server" Height="26px"
                                        OnClick="btnColAndRows_Click" Text="合并某一列中的几行" Width="154px" />
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td class="style2">
                                    <asp:Button ID="btnAutoGroup" runat="server" OnClick="btnAutoGroup_Click"
                                        Text="自动合并多行多列中相同信息" />
                                </td>
                                <td align="left">
                                    <asp:Button ID="btnOrginal" runat="server" OnClick="btnOrginal_Click"
                                        Text="原始状态数据" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
