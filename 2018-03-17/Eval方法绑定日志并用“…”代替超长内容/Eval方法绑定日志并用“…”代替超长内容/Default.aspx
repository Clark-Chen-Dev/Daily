<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Eval方法绑定日志并用___代替超长内容.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style type="text/css">
        .style1 {
            width: 57%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <table align="center" class="style1">
                <tr>
                    <td>
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/首页_03.jpg"
                            Width="714px" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Image ID="Image2" runat="server" ImageUrl="~/images/grzy_08.jpg" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:DataList ID="ArtDetailList" runat="server" Height="230px"
                            RepeatColumns="3" Width="438px" Style="font-size: medium">
                            <HeaderTemplate>
                                <table cellpadding="5" cellspacing="5" width="670">
                                </table>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td>&nbsp;<asp:Image ID="Image4" runat="server" ImageUrl="~/images/new.gif" />
                                        <a class="bb"
                                            href='#'>产品名称：[<%#Eval("产品").ToString().Length > 13 ? Eval("产品").ToString().Substring(0, 13) + "..." : Eval("产品")%>]
                                        </a>
                                    </td>
                                    <td>简介：<%#Eval("单位数量")%>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </table>
                            </FooterTemplate>
                        </asp:DataList>


                    </td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>
