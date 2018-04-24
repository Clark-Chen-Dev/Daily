<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewsDeplay.aspx.cs" Inherits="通过日历控件查看指定日期的新闻.NewsDeplay" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style type="text/css">
        .style1 {
            width: 814px;
            height: 468px;
        }

        .style2 {
            width: 100%;
            height: 310px;
        }

        .style3 {
            height: 168px;
        }

        .style4 {
            width: 239px;
        }

        .style5 {
            height: 168px;
            width: 239px;
        }
    </style>
</head>
<body bgcolor="Cornsilk">
    <form id="form1" runat="server">
        <div>
            &nbsp;<table align="center">
                <tr>
                    <td colspan="3" rowspan="2">&nbsp;</td>
                </tr>

            </table>
        </div>
        <table align="center" cellpadding="0" cellspacing="0" class="style1"
            style="background-image: url('通过日历控件查看指定日期的新闻2.png')">
            <tr>
                <td>
                    <table align="center" cellpadding="0" cellspacing="0" class="style2">
                        <tr>
                            <td class="style4">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style5"></td>
                            <td class="style3"></td>
                        </tr>
                        <tr>
                            <td class="style4">&nbsp;</td>
                            <td>
                                <asp:GridView ID="MyDataView" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                    BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px"
                                    CellPadding="3" CellSpacing="2" DataKeyNames="ID" Height="81%" OnPageIndexChanging="MyDataView_PageIndexChanging"
                                    Width="95%">
                                    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                                    <Columns>
                                        <asp:HyperLinkField DataNavigateUrlFields="ID" DataNavigateUrlFormatString="~/NewsText.aspx?UId={0}"
                                            DataTextField="Title" HeaderText="标题" />
                                        <asp:BoundField DataField="style" HeaderText="类别" />
                                        <asp:BoundField DataField="Type" HeaderText="类型" />
                                        <asp:BoundField DataField="IssueDate" DataFormatString="{0:D}" HeaderText="发布日期" />
                                    </Columns>
                                    <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                                    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
