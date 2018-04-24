using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 限制文本框中输入的字符长度
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (txtName.Text != "" && txtPwd.Text != "")
            {
                string name = txtName.Text;
                string pwd = txtPwd.Text;
                string sex = rblsex.SelectedItem.Text;
                ClientScript.RegisterStartupScript(this.GetType(), "", "alert('注册信息：用户名" + name + ",密码" + pwd + ",性别" + sex + "');", true);
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            txtName.Text = "";
            txtPwd.Text = "";
        }
    }
}