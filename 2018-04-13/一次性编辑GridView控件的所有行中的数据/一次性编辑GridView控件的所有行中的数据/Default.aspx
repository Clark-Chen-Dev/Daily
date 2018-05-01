<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="一次性编辑GridView控件的所有行中的数据.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

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
            &nbsp;
        </div>
        <table  align="center" class="style1">
            <tr>
                <td align="left">
                    <asp:GridView ID="GridView1" runat="server" DataKeyNames="ID"
                        AutoGenerateColumns="False" AllowPaging="True"
                        OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="5" Width="682px"
                        CellPadding="3" GridLines="Horizontal" BackColor="White"
                        BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px">

                        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />

                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="编号" />
                            <asp:TemplateField SortExpression="au_lname" HeaderText="教师姓名">
                                <ItemTemplate>
                                    <asp:TextBox runat="server" Text='<%# Bind("au_lname") %>' ID="txtName"
                                        Height="22px" Width="90px"></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="教师性别">
                                <ItemTemplate>
                                    <asp:TextBox runat="server" Text='<%# Bind("sex") %>' ID="txtSex" Height="22px"
                                        Width="54px"></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="教师学历">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtState" runat="server" Text='<%# Bind("state") %>'
                                        Height="22px" Width="97px"></asp:TextBox>
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

                        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                        <AlternatingRowStyle BackColor="#F7F7F7" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="一次性修改所有行" OnClick="Button1_Click"
                        Width="128px" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
