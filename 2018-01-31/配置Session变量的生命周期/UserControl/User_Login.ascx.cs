using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;


public partial class UserControl_User_Login : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    protected void imgbtnEnter_Click(object sender, ImageClickEventArgs e)
    {
        //如果用户名和密码正确
        if (txtUserID.Text.Trim().Equals("mr") && txtPwd.Text.Trim().Equals("mrsoft"))
        {
            Session["name"] = txtUserID.Text.Trim(); ;			//用户名存储Session中
            Response.Redirect("Admin.aspx");
        }
        else
        {
            lblMessage.Text = "用户名或密码不存在！";
            lblMessage.ForeColor = System.Drawing.Color.Red;
        }
    }    
}
