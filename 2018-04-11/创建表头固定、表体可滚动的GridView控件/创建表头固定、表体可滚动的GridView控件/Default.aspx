<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="创建表头固定_表体可滚动的GridView控件.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>创建表头固定，表体可滚动的GridView</title>

    <script>
        function s() {
            var t = document.getElementById("<%=GridView1.ClientID%>");
            var t2 = t.cloneNode(true)
            for (i = t2.rows.length - 1; i > 0; i--)
                t2.deleteRow(i)
            t.deleteRow(0)
            a.appendChild(t2)
        }
        window.onload = s
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <table>
            <tr>
                <td>
                    <div id="a">
                    </div>
                    <div style="overflow-y: scroll; height: 200px">
                        <asp:GridView ID="GridView1" runat="server" Font-Size="12px"
                            GridLines="None" CellPadding="4" Width="560px" ForeColor="#333333">
                            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <RowStyle BackColor="#E3EAEB" />
                            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="#EDEDED" Height="26px" />
                            <EditRowStyle BackColor="#7C6F57" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:GridView>
                    </div>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
