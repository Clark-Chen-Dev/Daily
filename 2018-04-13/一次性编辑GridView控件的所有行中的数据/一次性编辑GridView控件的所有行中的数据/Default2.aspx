<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default2.aspx.cs" Inherits="一次性编辑GridView控件的所有行中的数据.Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>一次性编辑GridView控件的所有行中的数据</title>

    <style>
        .style1 {
            width: 73%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table align="center" class="style1">
                <tr>
                    <td align="left">
                        <asp:GridView ID="GridView1" runat="server" DataKeyNames="ID"
                            AutoGenerateColumns="False" AllowPaging="True" PageSize="5" Width="854px"
                            CellPadding="4" ForeColor="#333333" GridLines="None"
                            DataSourceID="SqlDataSource1">
                            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                            <Columns>
                                <asp:BoundField DataField="ID" HeaderText="编号" />

                                <asp:TemplateField SortExpression="au_lname" HeaderText="员工姓名">
                                    <ItemTemplate>
                                        <asp:TextBox runat="server" Text='<%# Bind("au_lname") %>' ID="txtName"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="员工性别">
                                    <ItemTemplate>
                                        <asp:TextBox runat="server" Text='<%# Bind("sex") %>' ID="txtSex"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="员工学历">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtState" runat="server" Text='<%# Bind("state") %>'></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="电话号码">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtPhone" runat="server" Text='<%# Bind("phone") %>'></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="家庭地址">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtAddress" runat="server" Text='<%# Bind("address") %>'></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>

                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="一次性修改所有行" OnClick="Button1_Click"
                            Width="128px" />
                        <br />
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                            ConnectionString="<%$ ConnectionStrings:ConnStr %>"
                            SelectCommand="SELECT ID, au_lname, sex, state, phone, address FROM tb_mrEmp"
                            UpdateCommand="update tb_mrEmp set au_lname=@name,sex=@sex,state=@state,phone=@phone,address=@address where ID=@ID">
                            <UpdateParameters>
                                <asp:Parameter Name="name" Type="String" />
                                <asp:Parameter Name="sex" Type="String" />
                                <asp:Parameter Name="state" Type="String" />
                                <asp:Parameter Name="phone" Type="String" />
                                <asp:Parameter Name="address" Type="String" />
                                <asp:Parameter Name="ID" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
