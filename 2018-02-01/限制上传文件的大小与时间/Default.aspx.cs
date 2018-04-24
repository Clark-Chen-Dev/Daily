using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ImgBtnSend_Click(object sender, ImageClickEventArgs e)
    {
        string filePath = FileUp.PostedFile.FileName;
        string fileName = Path.GetFileName(filePath);

        if (FileUp.PostedFile.ContentLength > 40960)
        {
            LblMessage.Text = "文件大小不能超过网站配置文件中默认的40KB！";
        }
        else
        {
            string serverPath = Server.MapPath("AttachFiles/") + fileName;
            FileUp.PostedFile.SaveAs(serverPath);
            LblMessage.Text = "恭喜您！邮件附件上传成功！";
        }
    }
}