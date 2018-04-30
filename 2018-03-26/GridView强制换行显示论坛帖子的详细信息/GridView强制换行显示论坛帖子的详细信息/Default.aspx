<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="GridView强制换行显示论坛帖子的详细信息.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div align="center">
            <table>
                <tr>
                    <td style="font-weight: bold; font-size: 12pt">控制GridView控件中内容的换行</td>
                </tr>
                <tr>
                    <td>
                        <asp:GridView ID="GridView1" runat="server" BorderColor="Black"
                            AutoGenerateColumns="False" PageSize="5" Font-Size="10pt" Width="706px">
                            <HeaderStyle BackColor="#EEEEFF" HorizontalAlign="Center"></HeaderStyle>
                            <Columns>
                                <asp:BoundField HeaderText="帖子ID" DataField="CardID" />
                                <asp:BoundField HeaderText="帖子名称" DataField="CardName">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="帖子内容" DataField="CardContent">
                                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                </asp:BoundField>
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
