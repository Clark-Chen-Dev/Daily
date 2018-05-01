<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="结合CheckBox实现密码重置_MD5加密_.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>结合CheckBox实现密码重置（MD5加密）</title>
</head>
<body>
       <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" 
            BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" 
            DataKeyNames="UserID" Font-Size="13px" 
            OnPageIndexChanging="GridView1_PageIndexChanging" 
            OnRowDataBound="GridView1_RowDataBound" PageSize="6" SkinID="gvSkin" 
            Width="33%">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:CheckBox ID="chkSelected" runat="server" Checked="False" Visible="True" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ID">
                    <ItemTemplate>
                                <%# Container.DataItemIndex+1 %>
                            </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="编号（或用户名）">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("UserID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="真实姓名">
                    <EditItemTemplate>
                        <asp:TextBox ID="tbxName" runat="server" Text='<%# Eval("UserName") %>' 
                            Width="70px"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server"><%# Eval("UserName") %></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="系别">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlDepartment" runat="server" Width="80px" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server"><%# Eval("DepartmentName") %></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="角色">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlRole" runat="server" Width="80px" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server"><%# Eval("RoleName") %></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
        <asp:CheckBox ID="chkSelectAll" runat="server" AutoPostBack="true" 
            OnCheckedChanged="chkSelectAll_CheckedChanged" Text="全选" Width="54px" />
        <asp:ImageButton ID="ImageButtonResetPassword" runat="server" 
            ImageUrl="~/重置密码.gif" OnClick="ImageButtonResetPassword_Click" />
        <asp:Label ID="LabelPageInfo" runat="server"></asp:Label>
        <br />
    </div>
    </form>
</body>
</html>
