using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
    }

    protected void ibtnLogin_Click(object sender, ImageClickEventArgs e)
    {
        if (txtUserName.Text == "mr" && txtPassword.Text == "mrsoft")
        {
            FormsAuthentication.SetAuthCookie(txtUserName.Text.Trim(), false);
            Response.Write("<script>alert('登录成功！');location.href='Default.aspx';</script>");
        }
        else
        {
            Response.Write("<script>alert('登录失败！');</script>");
        }
    }
}