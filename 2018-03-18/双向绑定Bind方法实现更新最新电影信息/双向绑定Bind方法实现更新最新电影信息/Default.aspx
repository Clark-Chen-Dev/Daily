<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="双向绑定Bind方法实现更新最新电影信息.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>双向数据Bind方法实现更新最新电影信息</title>
    <style type="text/css">
        .style1 {
            width: 62%;
        }

        .style2 {
            width: 300px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <table align="center" class="style1"
            style="background-image: url('未命名.bmp'); height: 292px;">
            <tr>
                <td class="style2">&nbsp;</td>
                <td>
                    <asp:SqlDataSource runat="server"
                        ID="srcMovies"
                        ConnectionString="<%$ ConnectionStrings:db_Tome1ConnectionString %>"
                        SelectCommand="SELECT Id, Title,Director FROM Movies"
                        UpdateCommand="UPDATE Movies SET Title=@Title,Director=@Director WHERE Id=@Id">
                        <UpdateParameters>
                            <asp:Parameter Name="Title" />
                            <asp:Parameter Name="Director" />
                            <asp:Parameter Name="Id" />
                        </UpdateParameters>
                    </asp:SqlDataSource>

                    <asp:FormView runat="server"
                        ID="FormView1"
                        DataKeyNames="Id"
                        DataSourceID="srcMovies"
                        DefaultMode="Edit"
                        AllowPaging="True">
                        <EditItemTemplate>
                            <asp:Label
                                ID="lblTitle"
                                Text="最新电影名:"
                                AssociatedControlID="txtTitle"
                                runat="server" />
                            <br />
                            Title:<asp:TextBox
                                ID="txtTitle"
                                Text='<%#Bind("Title")%>'
                                runat="server" />
                            <br />
                            Director:<asp:TextBox
                                ID="txtDirector"
                                Text='<%#Bind("Director")%>'
                                runat="server" />
                            <br />
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="更新" />&nbsp;
                            <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            Title:<asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                            <br />
                            Director:<asp:TextBox ID="DirectorTextBox" runat="server"
                                Text='<%# Bind("Director") %>' />
                            <br />
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True"
                                CommandName="Insert" Text="插入" />
                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server"
                                CausesValidation="False" CommandName="Cancel" Text="取消" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            Id:<asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                            <br />
                            Title:<asp:Label ID="TitleLabel" runat="server" Text='<%# Bind("Title") %>' />
                            <br />
                            Director:<asp:Label ID="DirectorLabel" runat="server" Text='<%# Bind("Director") %>' />
                            <br />
                            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="编辑" />
                        </ItemTemplate>
                    </asp:FormView>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
