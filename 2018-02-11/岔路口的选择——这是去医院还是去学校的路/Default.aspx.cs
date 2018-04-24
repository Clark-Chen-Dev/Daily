using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {

        if (txtNum.Text.Trim().Length == 0)
        {
            ClientScript.RegisterClientScriptBlock(
                this.GetType(), "", "<script>alert('请输入数据！');</script>");
        }
        else if (!Regex.IsMatch(txtNum.Text.Trim(), @"^\+?[1-9][0-9]*$"))
        {
            ClientScript.RegisterClientScriptBlock(
                this.GetType(), "", "<script>alert('请输入大于0的数字！');</script>");
        }
        else if (Convert.ToInt32(txtNum.Text.Trim()) % 2 == 0)
        {
            ClientScript.RegisterClientScriptBlock(
                this.GetType(), "", "<script>alert('您输入的是偶数！');</script>");
        }
        else if (Convert.ToInt32(txtNum.Text.Trim()) % 2 != 0)
        {
            ClientScript.RegisterClientScriptBlock(
                this.GetType(), "", "<script>alert('您输入的是奇数！');</script>");
        }
    }
}