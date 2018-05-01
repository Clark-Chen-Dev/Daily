<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="结合哈希表设置在线考试后台管理权限.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>结合哈希表设置在线考试后台管理权限</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:GridView ID="GV" runat="server" AllowPaging="True"
                AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF"
                BorderStyle="None" BorderWidth="1px" CellPadding="3" Font-Size="13px"
                GridLines="Horizontal" OnPageIndexChanging="GV_PageIndexChanging"
                OnRowDataBound="GV_RowDataBound" PageSize="12" SkinID="gvSkin" Width="45%">
                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                <Columns>
                    <asp:BoundField DataField="RoleId" HeaderText="编号" />
                    <asp:BoundField DataField="RoleName" HeaderText="角色" />
                    <asp:TemplateField HeaderText="教师系别管理">
                        <ItemTemplate>
                            <asp:CheckBox ID="chkDepartmentManage" runat="server" Visible="True" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="用户信息管理">
                        <ItemTemplate>
                            <asp:CheckBox ID="chkUserManage" runat="server" Visible="True" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="考试科目管理">
                        <ItemTemplate>
                            <asp:CheckBox ID="chkCourseManage" runat="server" Visible="True" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="试卷定制维护">
                        <ItemTemplate>
                            <asp:CheckBox ID="chkPaperSetup" runat="server" Visible="True" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="用户试卷管理">
                        <ItemTemplate>
                            <asp:CheckBox ID="chkUserPaperList" runat="server" Visible="True" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="试卷题型管理">
                        <ItemTemplate>
                            <asp:CheckBox ID="chkTypeManage" runat="server" Visible="True" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                <AlternatingRowStyle BackColor="#F7F7F7" />
            </asp:GridView>

        </div>
        <asp:ImageButton ID="ImageButtonGiant" runat="server" ImageUrl="~/授权.gif"
            OnClick="ImageButtonGiant_Click" Style="height: 20px" />
        <asp:Label ID="Label1" runat="server" ForeColor="#FF3300"
            Text="注意：管理员权限请不要随意改动！否则相应的功能将不能进行管理！"></asp:Label>
    </form>
</body>
</html>
