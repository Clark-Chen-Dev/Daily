<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="通过日历控件查看指定日期的新闻.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>通过日历控件查看指定日期的新闻</title>
    <style type="text/css">
        .style1 {
            width: 777px;
            height: 601px;
        }

        .style3 {
            width: 100%;
            height: 342px;
        }

        .style4 {
            width: 302px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table align="center" cellpadding="0" cellspacing="0" class="style1"
            style="background-image: url('通过日历控件查看指定日期的新闻1.png')">
            <tr>
                <td>
                    <table align="center" cellpadding="0" cellspacing="0" class="style3">
                        <tr>
                            <td class="style4">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style4">&nbsp;</td>
                            <td>
                                <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="White"
                                    BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px"
                                    NextPrevFormat="FullMonth" Width="350px" OnSelectionChanged="Calendar1_SelectionChanged">
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
                            <td class="style4">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
