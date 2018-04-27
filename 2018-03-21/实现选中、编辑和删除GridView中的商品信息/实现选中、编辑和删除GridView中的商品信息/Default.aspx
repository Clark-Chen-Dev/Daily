<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="实现选中_编辑和删除GridView中的商品信息.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>实现选中、编辑和删除GridView中的商品信息</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px"
                CellPadding="4" GridLines="Horizontal"
                OnRowCancelingEdit="GridView1_RowCancelingEdit"
                OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing"
                OnRowUpdating="GridView1_RowUpdating" PageSize="4"
                Style="font-size: small" AllowPaging="True"
                OnPageIndexChanging="GridView1_PageIndexChanging">
                <RowStyle BackColor="White" ForeColor="#333333" />

                <Columns>
                    <asp:BoundField DataField="BccdID" HeaderText="编号" ReadOnly="True" />
                    <asp:BoundField DataField="BccdName" HeaderText="版本名称" />
                    <asp:BoundField DataField="BccdPrice" HeaderText="词典价格" />
                    <asp:BoundField DataField="BccdSaleDate" DataFormatString="{0:d}"
                        HeaderText="发行日期" />
                    <asp:BoundField DataField="BccdInStock" HeaderText="现有库存量"/>
                    <asp:CommandField HeaderText="选择" ShowSelectButton="True" />
                    <asp:CommandField ButtonType="Image" CancelImageUrl="~/Images/BtnCancel.gif"
                        EditImageUrl="~/Images/BtnUpdate.gif" HeaderText="编辑" ShowEditButton="True"
                        UpdateImageUrl="~/Images/BtnSave.gif" />
                    <asp:TemplateField HeaderText="删除" ShowHeader="False">
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButton1" runat="server" CommandName="Delete" 
                                ImageUrl="~/Images/BtnDelete.gif"
                                OnClientClick="return confirm('确定删除吗？');" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

                <FooterStyle BackColor="White" ForeColor="#333333" />
                <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
            </asp:GridView>

            <i>
                <asp:Label ID="lblMessage" runat="server"></asp:Label>

                您当前正在查看的页码：<b><font color="#ff0000"><%=GridView1.PageIndex + 1%>
                        /
                        <%=GridView1.PageCount%>
                    </font></b></i>
        </div>
    </form>
</body>
</html>
