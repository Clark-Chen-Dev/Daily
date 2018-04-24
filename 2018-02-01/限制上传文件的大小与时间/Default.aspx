<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>电子邮件发送系统</title>
<link href="css/css.css" rel="stylesheet" type="text/css">
    <style type="text/css">
        .style1
        {
            height: 40px;
            width: 1117px;
        }
        .style2
        {
            height: 36px;
            width: 1117px;
        }
        .style3
        {
            height: 25px;
            width: 1117px;
        }
        .style4
        {
            height: 28px;
            width: 1117px;
        }
        .style5
        {
            height: 29px;
            width: 1117px;
        }
        .style6
        {
            height: 34px;
            width: 1117px;
        }
        .style7
        {
            height: 24px;
            width: 1117px;
        }
        .style8
        {
            height: 272px;
            width: 1117px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table id="__01" align="center" border="0" cellpadding="0" cellspacing="0" style="border-right: #cc9966 thin solid; border-top: #cc9966 thin solid; border-left: #cc9966 thin solid; border-bottom: #cc9966 thin solid; width: 190px; height: 578px;">
            <tr>
                <td rowspan="3">
                    <img alt="" height="700" src="images/send_01.jpg" width="1" /></td>
                <td style="height: 150px; background-image: url(images/head.jpg); text-align: center;" valign="bottom">
                    <asp:Label ID="Lbltishi" runat="server" Font-Size="9pt" ForeColor="Red" Width="261px"></asp:Label></td>
            </tr>
            <tr>
                <td background="images/11_r3_c1.gif" height="423" valign="top">
               
                    <table cellpadding="0" cellspacing="0" style="width: 883px; height: 373px;">
                        <tr>
                            <td style="height: 285px; width: 264px;" valign="top">
                               <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                                            <tr>
                                                <td style="width: 92px">
                                                    <asp:Image ID="Image4" runat="server" ImageUrl="~/images/111.bmp" /></td>
                                                <td style="width: 100px">
                                                    <asp:Image ID="Image2" runat="server" ImageUrl="~/images/333.bmp" /></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="height: 11px; text-align: center">
                                                    <asp:Image ID="Image7" runat="server" ImageUrl="~/images/001.bmp" /></td>
                                            </tr>
                                    <tr>
                                        <td colspan="2" style="height: 56px; text-align: center">
                                                <asp:ImageButton ID="ImgBtnReceive" runat="server" ImageUrl="~/images/3.bmp" 
                                                    CausesValidation="False" /></td>
                                    </tr>
                                            <tr>
                                                <td colspan="2" style="text-align: center">
                                                <asp:ImageButton ID="ImgBtnSendOut" runat="server" ImageUrl="~/images/2.bmp" 
                                                        CausesValidation="False" /></td>
                                            </tr>
                                            <tr>
                                                <td style="height: 30px; text-align: center;" colspan="2">
                                                </td>
                                            </tr>
                                   <tr>
                                       <td colspan="2" style="height: 52px; text-align: center">
                                           <asp:Image ID="Image5" runat="server" ImageUrl="~/images/goodfriendt.JPG" /></td>
                                   </tr>
                                   <tr>
                                       <td colspan="2" style="height: 52px; text-align: center">
                                                <asp:ImageButton ID="ImgBtnAdd" runat="server" 
                                                    ImageUrl="~/images/addgoodfriend.JPG" CausesValidation="False" /></td>
                                   </tr>
                                   <tr>
                                       <td colspan="2" style="height: 52px; text-align: center">
                                           <asp:ImageButton ID="Imgguanli" runat="server" 
                                               ImageUrl="~/images/guanligoodfriend.JPG" CausesValidation="False" /></td>
                                   </tr>
                                   <tr>
                                       <td colspan="2" style="height: 31px; text-align: center">
                                           </td>
                                   </tr>
                                   <tr>
                                       <td colspan="2" style="height: 52px; text-align: center">
                                           <asp:Image ID="Image6" runat="server" ImageUrl="~/images/yqlj.JPG" /></td>
                                   </tr>
                                   <tr>
                                       <td colspan="2" style="height: 56px; text-align: center">
                                           <asp:HyperLink ID="HLinFriend" runat="server" ImageUrl="~/images/image1.jpg" NavigateUrl="http://www.mrbccd.com"></asp:HyperLink></td>
                                   </tr>
                                   <tr>
                                       <td colspan="2" style="height: 52px; text-align: center">
                                           <asp:HyperLink ID="HLinFriend1" runat="server" ImageUrl="~/images/image3.jpg" NavigateUrl="http://www.mrbccd.com"></asp:HyperLink></td>
                                   </tr>
                                        </table>
                            </td>
                            <td align="center" valign="middle" style="height: 285px; width: 64px;">
                                <span class="STYLE1">
                                    <table border="0" cellpadding="0" cellspacing="0" 
                                    style="width: 603px; height: 230px">
                                        <tr style="font-size: 12pt; color: #000000;">
                                            <td style="width: 655px; height: 25px" colspan="2">
                                                <span style="color: #000000;">
                                                    <asp:Image ID="Image1" runat="server" ImageUrl="~/images/send.bmp" /></span></td>
                                        </tr>
                                        <tr style="font-size: 12pt">
                                            <td background="images/background.JPG" colspan="2" style="height: 545px; width: 655px; text-align: right;" valign="top">
                                                <div style="text-align: center">
                                                    <table border="0" cellpadding="0" cellspacing="0" style="width: 117%">
                                                        <tr>
                                                            <td class="style1">
                                                            </td>
                                                            <td style="width: 132px; height: 40px">
                                                            </td>
                                                            <td style="width: 230px; height: 40px">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="style2">
                                                            </td>
                                                            <td style="width: 132px; height: 36px">
                                                            </td>
                                                            <td style="width: 230px; height: 36px">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="style3">
                                                            </td>
                                                            <td style="width: 132px; height: 25px; text-align: left;">
                                                <asp:TextBox ID="TxtReceive" runat="server" Width="462px"  
                                                                    style="border-bottom-width: 0px;border-top-width: 0px;border-left-width: 0px;border-right-width: 0px; text-indent:8pt;" ></asp:TextBox><span
                                                    style="color: #ff0000; font-size: 9pt;">*</span></td>
                                                            <td style="width: 230px; height: 25px; text-align: left">
                                                                <span style="font-size: 10pt; color: #ff6633"></span></td>
                                                        </tr>
                                                        <tr>
                                                            <td class="style4">
                                                            </td>
                                                            <td style="width: 132px; height: 28px; color: #ff0066; text-align: left;">
                                                <asp:TextBox ID="TextSender" runat="server" Width="462px" 
                                                                    style="border-bottom-width: 0px;border-top-width: 0px;border-left-width: 0px;border-right-width: 0px; text-indent:8pt;"></asp:TextBox><span style="color: #ff0000; font-size: 9pt;">*</span></td>
                                                            <td style="width: 230px; color: #ff0066; height: 28px; text-align: left">
                                                                    &nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="style5">
                                                            </td>
                                                            <td style="width: 132px; height: 29px; text-align: left;">
                                                <asp:TextBox ID="TextSubject" runat="server" Width="462px" 
                                                                    style="border-bottom-width: 0px;border-top-width: 0px;border-left-width: 0px;border-right-width: 0px; text-indent:8pt;" ></asp:TextBox><span style="color: #ff0000; font-size: 9pt;">*</span></td>
                                                            <td style="width: 230px; height: 29px; text-align: left">
                                                                    &nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="style6">
                                                            </td>
                                                            <td style="width: 132px; height: 34px; text-align: left;"><asp:FileUpload ID="FileUp" runat="server"  Width="456px" style="border-bottom-width: 0px;border-top-width: 0px;border-left-width: 0px;border-right-width: 0px; text-indent:8pt;" Height="21px"/></td>
                                                            <td style="width: 230px; height: 34px; text-align: left">
                                                                &nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="style7">
                                                            </td>
                                                            <td style="width: 132px; height: 24px; text-align: left;" valign="middle"><asp:TextBox ID="TxtServer" runat="server" Width="462px" style="border-bottom-width: 0px;border-top-width: 0px;border-left-width: 0px;border-right-width: 0px; text-indent:8pt;" Height="15px"/></td>
                                                            <td style="width: 230px; height: 24px; text-align: left" valign="middle">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="style8">
                                                            </td>
                                                            <td align="left" style="width: 132px; height: 272px" valign="bottom">
                                                <asp:TextBox ID="TextContent" runat="server" Height="238px" TextMode="MultiLine" Width="446px" style="border-bottom-width: 0px;border-top-width: 0px;border-left-width: 0px;border-right-width: 0px; text-indent:8pt;" ></asp:TextBox></td>
                                                            <td align="left" style="width: 230px; height: 272px" valign="bottom">
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                    &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                                                    <asp:ImageButton ID="ImgBtnSend" runat="server" ImageUrl="~/images/fasong.bmp" OnClick="ImgBtnSend_Click" />&nbsp;<asp:ImageButton
                                                        ID="ImgBtnchongzhi" runat="server" ImageUrl="~/images/chongzhi.bmp" 
                                                        CausesValidation="False" />
                                <span class="STYLE1">
                                                                <asp:Label ID="LblMessage" runat="server" Font-Size="9pt" ForeColor="Red" Width="88px" />
                                </span>
                                                </div>
                                                </td>
                                        </tr>
                                        <tr style="font-size: 12pt">
                                            <td align="center" colspan="2" style="height: 2px" valign="top">
                                                &nbsp; &nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </span>
                            </td>
                        </tr>
                    </table>
                    <br />
                    </td>
            </tr>
            <tr style="font-size: 12pt">
                <td style="text-align: center">
                    <asp:Image ID="Image3" runat="server" ImageUrl="~/images/footer.JPG" /></td>
            </tr>
        </table>
        <br />
    
    </div>
    </form>
</body>
</html>
