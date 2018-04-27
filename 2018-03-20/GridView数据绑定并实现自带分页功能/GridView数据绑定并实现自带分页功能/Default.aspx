<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="GridView数据绑定并实现自带分页功能.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:GridView ID="GridView1" runat="server" AllowPaging="True"
                AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84"
                BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2"
                OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="5">
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                <Columns>
                    <asp:BoundField DataField="BccdID" HeaderText="词典编号" />
                    <asp:BoundField DataField="BccdName" HeaderText="版本名称" />
                    <asp:BoundField DataField="BccdPrice" HeaderText="词典价格" />
                    <asp:BoundField DataField="BccdSaleDate" DataFormatString="{0:d}"
                        HeaderText="发行日期" />
                    <asp:BoundField DataField="BccdInStock" HeaderText="现有库存量" />
                </Columns>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
            <i>您当前正在查看的页码：<b><font color="#ff0000"><%=GridView1.PageIndex + 1%>
                        /
                        <%=GridView1.PageCount%>
                    </font></b></i>
        </div>
    </form>
</body>
</html>
