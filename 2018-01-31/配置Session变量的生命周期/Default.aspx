<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Src="UserControl/User_Login.ascx" TagName="User_Login" TagPrefix="uc1" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
    <link href="CSS/css.css" type="text/css" rel="Stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <table width="1003" height="84" border="0" cellspacing="0">
                <tr>
                    <td background="images/首页_01_01.jpg"><span style="width: 394px; height: 44px; padding-top: 40px; padding-left: 610px;"><a href="Default.aspx">首页</a> 　　<a href="#">登录</a>　　　 <a href="#">注册</a>　　 <a href="#">会员日志</a>　　　 <a href="#">随变逛逛</a></span></td>
                </tr>
            </table>

            <table width="1004" border="0" cellspacing="0">
                <tr>

                    <td width="760">
                        <img src="images/首页_03.jpg" width="760" height="240" /></span></td>
                    <td width="245" valign="top">
                        <table height="240" border="0"
                            cellspacing="0" background="images/首页_04.jpg" style="width: 235px">

                            <tr>
                                <td height="66">&nbsp;</td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <label>&nbsp;</label><uc1:User_Login ID="User_Login1" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td height="30" align="center">
                                    <asp:Label ID="Label2" runat="server" Text="欢迎光临："></asp:Label>
                                    <asp:Label ID="Label3" runat="server"></asp:Label>
                                </td>
                            </tr>

                        </table>
                    </td>
                </tr>
            </table>
            <table width="1004" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td>
                        <asp:Image ID="Image2" runat="server" ImageUrl="~/images/首页_14.jpg" />
                    </td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>
