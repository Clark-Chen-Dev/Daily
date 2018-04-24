<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="显示长日期格式时间.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>显示长日期格式时间</title>
    <style type="text/css">
        .style1
        {
            width: 576px;
            height: 436px;
        }
        .style2
        {
            width: 100%;
            height: 332px;
        }
        .style3
        {
            height: 66px;
        }
        .style4
        {
            height: 246px;
            text-align: center;
        }
        .style5
        {
            height: 66px;
            width: 173px;
        }
        .style6
        {
            height: 246px;
            width: 173px;
        }
        .style7
        {
            width: 173px;
        }
        .style8
        {
            width: 100%;
            height: 113px;
        }
        .style9
        {
            width: 113px;
            text-align: right;
        }
        .style10
        {
            width: 70px;
            text-align: right;
        }
        .style11
        {
            width: 49px;
        }
        .style12
        {
            color: #FF3300;
        }
    </style>
</head>
<body>
     <form id="form1" runat="server">
    <div>
    
        <table align="center" cellpadding="0" cellspacing="0" class="style1" 
            style="background-image: url('bg}.bmp')">
            <tr>
                <td>
                    <table align="center" cellpadding="0" cellspacing="0" class="style2">
                        <tr>
                            <td class="style5">
                            </td>
                            <td class="style3">
                            </td>
                        </tr>
                        <tr>
                            <td class="style6">
                            </td>
                            <td class="style4">
                                <asp:DataList ID="DataList1" runat="server">
                                    <ItemTemplate>
                                        <table align="center" cellpadding="0" cellspacing="0" 
    class="style8" style="border: 1px solid #666666; font-size: small">
                                            <tr>
                                                <td class="style12" colspan="4" 
            style="text-align: center; background-color: #E0E0E0;">
                                                    会员信息</td>
                                            </tr>
                                            <tr>
                                                <td class="style9">
                                                    会员ID：</td>
                                                <td class="style11">
                                                    <%# DataBinder.Eval(Container,"DataItem.id") %></td>
                                                <td class="style10">
                                                    会员姓名：</td>
                                                <td>
                                                   <%# DataBinder.Eval(Container,"DataItem.name") %></td>
                                            </tr>
                                            <tr>
                                                <td class="style9">
                                                    会员性别：</td>
                                                <td class="style11">
                                                    <%# DataBinder.Eval(Container,"DataItem.sex") %></td>
                                                <td class="style10">
                                                    会员籍贯：</td>
                                                <td>
                                                    <%# DataBinder.Eval(Container,"DataItem.nPlace") %></td>
                                            </tr>
                                            <tr>
                                                <td class="style9">
                                                    会员注册日期：</td>
                                                <td colspan="3" style="text-align: left">
                                                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:DataList>
                            </td>
                        </tr>
                        <tr>
                            <td class="style7">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
