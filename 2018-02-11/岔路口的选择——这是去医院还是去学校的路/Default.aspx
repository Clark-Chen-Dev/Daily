<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>岔路口的选择——这是去医院还是去学校的路</title>
    <style>
         .style1
        {
            width: 400px;
            height: 200px;
            float: left;
        }
        .style2
        {
            width: 77%;
        }
        #form1
        {
            height: 205px;
        }
        .style3
        {
            font-size: small;
        }
    </style>
</head>
<body>
   <form id="form1" runat="server">
    <table align="left" cellpadding="0" cellspacing="0" class="style1">
        <tr>
            <td style="background-image: url('bg.jpg')">
                <table align="center" cellpadding="0" cellspacing="0" class="style2">
                    <tr>
                        <td style="text-align: right" class="style3">
                            输入数字：</td>
                        <td>
                            <asp:TextBox ID="txtNum" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Button.gif" 
                                onclick="ImageButton1_Click" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
