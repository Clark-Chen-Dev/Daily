<%@ Control Language="C#" AutoEventWireup="true" CodeFile="User_Login.ascx.cs" Inherits="UserControl_User_Login" %>
<style type="text/css">
<!--
body {
	font-family:"宋体";
	font-size:12px;
	color:#666666;

}

a{
color:#FFFFFF;
font-size:14px ;
font-weight:bold;
text-decoration:none;

}
a:link{
color:#FFFFFF;
text-decoration:none;
}

a:visited{

color:#FFFFFF;

text-decoration:none;
}
-->
</style>
<table>
    <tr>
        <td align="left">
    <div align="center">
    
        <table align="left">
            <tr>
                <td align="right">
                    <asp:Label ID="Label4" runat="server" Text="用户帐号："></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtUserID" runat="server" Width="113px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right">
                    用户密码：</td>
                <td>
                    <asp:TextBox ID="txtPwd" runat="server" Width="114px" TextMode="Password" 
                        Height="16px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right">
                    <asp:ImageButton ID="imgbtnEnter" runat="server" ImageUrl="~/images/dl.gif" 
                        onclick="imgbtnEnter_Click" CausesValidation="False" />
                </td>
                <td>
                    <asp:Label ID="lblMessage" runat="server" ForeColor="red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <asp:HyperLink ID="HyperLink2" runat="server" ImageUrl="~/images/zc.gif">HyperLink</asp:HyperLink>
                </td>
            </tr>
        </table>
    
    </div>
            </td>
        </tr>
    </table>
