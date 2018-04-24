using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace ASP.NET服务端动态插入HTML标签
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string wenJianList = "<img src=\"/images/ico_clip.gif\" /><a href=\"javascript:DownloadFile('/UploadFile/636571517539985089.doc')\" >中海惠炼SAP RF解决方案.doc</a>&nbsp;<a href='../DsoFramer/ReadFile.aspx?FilePath=636571517539985089.doc' target='_blank'><img border=\"0\" src=\"/images/Button/ReadFile.gif\" /></a>&nbsp;&nbsp;&nbsp;&nbsp;<img src=\"/images/ico_clip.gif\" /><a href=\"javascript:DownloadFile('/UploadFile/636571554814806674.doc')\" >中海惠炼SAP财务模块概述.doc</a>&nbsp;<a href='../DsoFramer/ReadFile.aspx?FilePath=636571554814806674.doc' target='_blank'><img border=\"0\" src=\"/images/Button/ReadFile.gif\" /></a>";
            StaticLabel.Text = wenJianList;

            HtmlImage imgTag = new HtmlImage();
            imgTag.Src = "/images/ico_clip.gif";
            this.DynamicLabel.Controls.Add(imgTag);

            HtmlAnchor aTag = new HtmlAnchor();
            aTag.HRef = "/UploadFile/636571517539985089.doc";
            aTag.InnerText = "中海惠炼SAP RF解决方案.doc";
            this.DynamicLabel.Controls.Add(aTag);

            HtmlElement spacingTag = new HtmlElement();
            spacingTag.InnerHtml = "&nbsp;";
            this.DynamicLabel.Controls.Add(spacingTag);

            ImageButton previewFileBtn = new ImageButton();
            previewFileBtn.CausesValidation = false;
            previewFileBtn.ImageAlign = ImageAlign.AbsMiddle;
            previewFileBtn.ImageUrl = "/images/Button/ReadFile.gif";
            previewFileBtn.CommandArgument = "";
            previewFileBtn.Click += PreviewFileBtn_Click;
            this.DynamicLabel.Controls.Add(previewFileBtn);


            // 分隔符 
            spacingTag = new HtmlElement();
            spacingTag.InnerHtml = "&nbsp;&nbsp;&nbsp;&nbsp;";
            this.DynamicLabel.Controls.Add(spacingTag);

            // 文件2 
            imgTag = new HtmlImage();
            imgTag.Src = "/images/ico_clip.gif";
            this.DynamicLabel.Controls.Add(imgTag);

            aTag = new HtmlAnchor();
            aTag.HRef = "/UploadFile/636571554814806674.doc";
            aTag.InnerText = "中海惠炼SAP财务模块概述.doc";
            this.DynamicLabel.Controls.Add(aTag);

            spacingTag = new HtmlElement();
            spacingTag.InnerHtml = "&nbsp;";
            this.DynamicLabel.Controls.Add(spacingTag);

            previewFileBtn = new ImageButton();
            previewFileBtn.CausesValidation = false;
            previewFileBtn.ImageAlign = ImageAlign.AbsMiddle;
            previewFileBtn.ImageUrl = "/images/Button/ReadFile.gif";
            previewFileBtn.Click += PreviewFileBtn_Click;
            this.DynamicLabel.Controls.Add(previewFileBtn);
        }

        private void PreviewFileBtn_Click(object sender, ImageClickEventArgs e)
        {
            Response.Write("<script>alert('浏览文件');</script>");
        }
    }
}