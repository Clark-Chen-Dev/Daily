<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="使用主题来设置GridView控件的外观.Default" Theme="GridView" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>使用主题来设置GridView控件的外观</title>
    <style>
        .Table {
            width: 100%;
            font-size: 9pt;
            border-right: #73acf5 thin solid;
            border-top: #73acf5 thin solid;
            border-left: #73acf5 thin solid;
            border-bottom: #73acf5 thin solid;
            font-family: Tahoma;
            border-collapse: collapse;
        }

        .LeftTD {
            border-width: 1;
            height: 30;
            border-collapse: collapse;
            font-family: Tahoma;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <table border="1" bordercolor="#daeeee" cellpadding="2" cellspacing="0"
                class="Table">
                <tr>
                    <td bgcolor="#D8E7FA">
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/论坛.png" />
                        论坛帖子查询--&gt;&gt;</td>
                </tr>
                <tr>
                    <td valign="middle">查询条件：<asp:DropDownList ID="ddlBoard" runat="server" SkinID="ddlSkin">
                        <asp:ListItem>新闻论坛</asp:ListItem>
                    </asp:DropDownList>
                        输入关键字：<asp:TextBox ID="TextBox1" runat="server" SkinID="tbSkin"></asp:TextBox>
                        <asp:Button ID="Button1" runat="server" Text="查 询" />
                    </td>
                </tr>
                <tr>
                    <td valign="middle">&nbsp;</td>
                </tr>
                <tr>
                    <td valign="middle">
                        <asp:GridView ID="gvTitle" runat="server" AllowPaging="True"
                            AutoGenerateColumns="False" DataKeyNames="emp_id" Font-Names="Tahoma"
                            PageSize="9" SkinID="gvSkin" Width="41%"
                            OnPageIndexChanging="gvTitle_PageIndexChanging">
                            <HeaderStyle Font-Names="Tahoma" HorizontalAlign="Center" />
                            <EmptyDataTemplate>
                                帖子列表为空。
                            </EmptyDataTemplate>
                            <EmptyDataRowStyle ForeColor="Blue" />
                            <RowStyle BorderColor="#DAEEEE" BorderStyle="Ridge" BorderWidth="1px"
                                HorizontalAlign="Center" />
                            <Columns>
                                <asp:TemplateField HeaderText="帖子标题">
                                    <ItemTemplate>
                                        <a><%# Eval("fname")%></a>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="15%" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="帖子内容">
                                    <ItemTemplate>
                                        <%# Eval("lname").ToString().Length > 60 ? Eval("lname").ToString().Substring(0, 60) + "..." : Eval("lname")%>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" Width="37%" />
                                    <HeaderStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="访问次数">
                                    <ItemTemplate>
                                        <%# Eval("job_lvl")%>次
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="8%" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="回复次数">
                                    <ItemTemplate>
                                        <%#Eval("job_id")%>次
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="8%" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="hire_date" DataFormatString="{0:d}"
                                    HeaderText="创建时间" HtmlEncode="False">
                                    <ItemStyle Width="18%" />
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
