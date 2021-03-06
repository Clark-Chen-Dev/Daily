﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="NestedGridView.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>通用嵌套GridView</title>
    <style type="text/css">
        body {
            font-family: Arial;
            font-size: 10pt;
        }

        .Grid td {
            background-color: #A1DCF2;
            color: black;
            font-size: 10pt;
            line-height: 200%;
        }

        .Grid th {
            background-color: #3AC0F2;
            color: White;
            font-size: 10pt;
            line-height: 200%;
        }

        .ChildGrid td {
            background-color: #eee !important;
            color: black;
            font-size: 10pt;
            line-height: 200%;
        }

        .ChildGrid th {
            background-color: #6C6C6C !important;
            color: White;
            font-size: 10pt;
            line-height: 200%;
        }
    </style>
    <script src="/Scripts/jquery.min.js"></script>
    <script>
        $(function () {
            $("[src*=minus]").each(function () {
                $(this).closest("tr").after("<tr><td></td><td colspan = '999'>" + $(this).next().html() + "</td></tr>");
                $(this).next().remove()
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:GridView ID="gvCustomers" runat="server" AutoGenerateColumns="False" CssClass="Grid" DataKeyNames="CustomerID">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:ImageButton ID="imgShow" runat="server" OnClick="Show_Hide_ChildGrid" ImageUrl="~/images/plus.png"
                            CommandArgument="Show" />
                        <asp:Panel ID="pnlOrders" runat="server" Visible="false" Style="position: relative">
                            <asp:GridView ID="gvOrders" runat="server" AutoGenerateColumns="false" PageSize="5"
                                AllowPaging="true" OnPageIndexChanging="OnChildGrid_PageIndexChanging" CssClass="ChildGrid">
                                <Columns>
                                    <asp:BoundField ItemStyle-Width="150px" DataField="OrderId" HeaderText="Order Id" />
                                    <asp:BoundField ItemStyle-Width="150px" DataField="OrderDate" HeaderText="Date" />
                                </Columns>
                            </asp:GridView>
                        </asp:Panel>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField ItemStyle-Width="150px" DataField="ContactName" HeaderText="Contact Name" />
                <asp:BoundField ItemStyle-Width="150px" DataField="City" HeaderText="City" />
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
