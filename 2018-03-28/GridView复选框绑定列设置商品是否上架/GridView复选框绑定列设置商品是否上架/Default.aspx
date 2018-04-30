<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="GridView复选框绑定列设置商品是否上架.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="gvBccdInfo" runat="server" AutoGenerateColumns="False"
                DataSourceID="SqlDataSource1" DataKeyNames="BccdID" AllowPaging="True"
                AllowSorting="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None"
                BorderWidth="1px" CellPadding="3">
                <RowStyle ForeColor="#000066" />
                <Columns>
                    <asp:CommandField ShowEditButton="True" />
                    <asp:BoundField DataField="BccdID" HeaderText="词典编号" ReadOnly="true" />
                    <asp:BoundField DataField="BccdName" HeaderText="词典版本名称" />
                    <asp:BoundField DataField="BccdPrice" HeaderText="词典价格" />
                    <asp:BoundField DataField="BccdInStock" HeaderText="现有库存量" />
                    <asp:CheckBoxField DataField="Discontinued" HeaderText="是否上架"
                        SortExpression="Discontinued" />

                </Columns>
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:ConnStr %>"
                SelectCommand="SELECT [BccdID], [BccdName], [BccdPrice], [BccdInStock], [Discontinued] FROM [mrbccd]"
                ConflictDetection="CompareAllValues"
                DeleteCommand="DELETE FROM [mrbccd] WHERE [BccdID] = @original_BccdID AND (([BccdName] = @original_BccdName) OR ([BccdName] IS NULL AND @original_BccdName IS NULL)) AND (([BccdPrice] = @original_BccdPrice) OR ([BccdPrice] IS NULL AND @original_BccdPrice IS NULL)) AND (([BccdInStock] = @original_BccdInStock) OR ([BccdInStock] IS NULL AND @original_BccdInStock IS NULL)) AND (([Discontinued] = @original_Discontinued) OR ([Discontinued] IS NULL AND @original_Discontinued IS NULL))"
                InsertCommand="INSERT INTO [mrbccd] ([BccdName], [BccdPrice], [BccdInStock], [Discontinued]) VALUES (@BccdName, @BccdPrice, @BccdInStock, @Discontinued)"
                OldValuesParameterFormatString="original_{0}"
                UpdateCommand="UPDATE [mrbccd] SET [BccdName] = @BccdName, [BccdPrice] = @BccdPrice, [BccdInStock] = @BccdInStock, [Discontinued] = @Discontinued WHERE [BccdID] = @original_BccdID AND (([BccdName] = @original_BccdName) OR ([BccdName] IS NULL AND @original_BccdName IS NULL)) AND (([BccdPrice] = @original_BccdPrice) OR ([BccdPrice] IS NULL AND @original_BccdPrice IS NULL)) AND (([BccdInStock] = @original_BccdInStock) OR ([BccdInStock] IS NULL AND @original_BccdInStock IS NULL)) AND (([Discontinued] = @original_Discontinued) OR ([Discontinued] IS NULL AND @original_Discontinued IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_BccdID" Type="Int32" />
                    <asp:Parameter Name="original_BccdName" Type="String" />
                    <asp:Parameter Name="original_BccdPrice" Type="String" />
                    <asp:Parameter Name="original_BccdInStock" Type="Int32" />
                    <asp:Parameter Name="original_Discontinued" Type="Boolean" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="BccdName" Type="String" />
                    <asp:Parameter Name="BccdPrice" Type="String" />
                    <asp:Parameter Name="BccdInStock" Type="Int32" />
                    <asp:Parameter Name="Discontinued" Type="Boolean" />
                    <asp:Parameter Name="original_BccdID" Type="Int32" />
                    <asp:Parameter Name="original_BccdName" Type="String" />
                    <asp:Parameter Name="original_BccdPrice" Type="String" />
                    <asp:Parameter Name="original_BccdInStock" Type="Int32" />
                    <asp:Parameter Name="original_Discontinued" Type="Boolean" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="BccdName" Type="String" />
                    <asp:Parameter Name="BccdPrice" Type="String" />
                    <asp:Parameter Name="BccdInStock" Type="Int32" />
                    <asp:Parameter Name="Discontinued" Type="Boolean" />
                </InsertParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
