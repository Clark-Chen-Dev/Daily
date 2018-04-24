using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 后台管理登录窗口中用户名及密码的重置
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {
            // 版本1
            //for (int i = 0; i < Page.Controls.Count; i++)
            //{
            //    foreach (Control ctrl in Page.Controls[i].Controls)
            //    {
            //        if (ctrl is TextBox)
            //        {
            //            TextBox textBox = (TextBox)ctrl;
            //            textBox.Text = "";
            //        }
            //    }
            //}

            // 版本2
            foreach (Control ctrl in Controls)
            {
                ResetTextBox(ctrl);
            }

        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {

        }

        private void ResetTextBox(Control ctrl)
        {
            if (ctrl is TextBox)
            {
                TextBox textBox = (TextBox)ctrl;
                textBox.Text = "";
            }
            if (ctrl.HasControls())
            {
                foreach (Control subCtrl in ctrl.Controls)
                {
                    ResetTextBox(subCtrl);
                }
            }
        }
    }
}