<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ASP.NET服务端动态插入HTML标签.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                  <tr>
                    <td style="width: 170px; height: 25px; background-color: #f9f9f7" align="right">合同以及附件：
                    </td>
                    <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                        <asp:Label ID="lblHeTongAndFuJian" runat="server">


                           <img src="/images/ico_clip.gif" /><a href="javascript:DownloadFile('/UploadFile/636571517539985089.doc')" >中海惠炼SAP RF解决方案.doc</a>&nbsp;<a href='../DsoFramer/ReadFile.aspx?FilePath=636571517539985089.doc' target='_blank'><img border=0 src="/images/Button/ReadFile.gif" /></a>&nbsp;&nbsp;&nbsp;&nbsp;<img src="/images/ico_clip.gif" /><a href="javascript:DownloadFile('/UploadFile/636571554814806674.doc')" >中海惠炼SAP财务模块概述.doc</a>&nbsp;<a href='../DsoFramer/ReadFile.aspx?FilePath=636571554814806674.doc' target='_blank'><img border=0 src="/images/Button/ReadFile.gif" /></a>

                        </asp:Label>
                    </td>
                </tr>

                <tr>
                    <td style="width: 170px; height: 25px; background-color: #f9f9f7" align="right">合同以及附件：
                    </td>
                    <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                        <asp:Label ID="StaticLabel" runat="server">


                       

                        </asp:Label>
                    </td>
                </tr>

                <tr>
                    <td style="width: 170px; height: 25px; background-color: #f9f9f7" align="right">合同以及附件：
                    </td>
                    <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                        <asp:Label ID="DynamicLabel" runat="server">


                       

                        </asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
