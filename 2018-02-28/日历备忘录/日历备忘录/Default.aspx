<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="日历备忘录.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>日历备忘录</title>
    <style type="text/css">
        .style1 {
            width: 609px;
            height: 420px;
        }

        .style2 {
            width: 100%;
        }

        .style3 {
            height: 157px;
        }

        .style4 {
            height: 157px;
            width: 121px;
        }

        .style5 {
            width: 121px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table align="center" cellpadding="0" cellspacing="0" class="style1"
            style="background-image: url('日历备忘录1.png')">
            <tr>
                <td>
                    <table align="center" cellpadding="0" cellspacing="0" class="style2">
                        <tr>
                            <td class="style4"></td>
                            <td class="style3"></td>
                        </tr>
                        <tr>
                            <td class="style5">&nbsp;</td>
                            <td>
                                <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="White"
                                    BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px"
                                    NextPrevFormat="FullMonth" OnSelectionChanged="Calendar1_SelectionChanged" Width="350px">
                                    <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                                    <TodayDayStyle BackColor="#CCCCCC" />
                                    <OtherMonthDayStyle ForeColor="#999999" />
                                    <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                                    <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                                    <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True"
                                        Font-Size="12pt" ForeColor="#333399" />
                                </asp:Calendar>
                            </td>
                        </tr>
                        <tr>
                            <td class="style5">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
