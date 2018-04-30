<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="结合分页模板PagerTemplate实现自定义分页.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>结合分页模板PagerTemplate实现自定义分页</title>
    <style type="text/css">
        body {
            font-size: 9pt;
        }

        #main {
            background-color: #EDF7E7;
            line-height: 30px;
            width: 100%;
            text-align: left;
        }

        #info {
            width: 40%;
            font-family: Verdana;
            float: left;
            text-align: left;
        }

        #page {
            width: 60%;
            float: left;
            overflow: auto;
            text-align: right;
        }

        .txtInfo {
            color: #e78a29;
        }

        .link {
            text-decoration: none;
            color: #474747;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server"
                AllowPaging="True" PageSize="5"
                OnDataBound="GridView1_DataBound" CellPadding="2" CellSpacing="0"
                Width="771px">
                <PagerTemplate>
                    <div id="main">
                        <div id="info">
                            &nbsp;&nbsp;页次：<asp:Label ID="lblPageCurrent" runat="server" Text="1" CssClass="txtInfo"></asp:Label>
                            /<asp:Label ID="lblPageCount" runat="server" Text="1"></asp:Label>&nbsp;&nbsp;
                  共&nbsp;<asp:Label ID="lblPageRow" runat="server" Text="1" CssClass="txtInfo"></asp:Label>&nbsp;条记录
                        </div>
                        <div id="page">
                            <asp:LinkButton ID="btnFirst" runat="server" CssClass="link" CommandName="Pager" CommandArgument="First" OnCommand="NavigateToPage">[首页]</asp:LinkButton>&nbsp;
                      <asp:LinkButton ID="btnPrev" runat="server" CssClass="link" CommandName="Pager" CommandArgument="Prev" OnCommand="NavigateToPage">[前一页]</asp:LinkButton>&nbsp;
                      <asp:LinkButton ID="btnNext" runat="server" CssClass="link" CommandName="Pager" CommandArgument="Next" OnCommand="NavigateToPage">[下一页]</asp:LinkButton>&nbsp;
                      <asp:LinkButton ID="btnLast" runat="server" CssClass="link" CommandName="Pager" CommandArgument="Last" OnCommand="NavigateToPage">[尾页]</asp:LinkButton>&nbsp;&nbsp;
                        </div>
                    </div>
                </PagerTemplate>
                <RowStyle BackColor="#F9F9F9" />
                <HeaderStyle BackColor="#EDF7E7" Font-Bold="true" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
        </div>
    </form>
</body>
</html>
