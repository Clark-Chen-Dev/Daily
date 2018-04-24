using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 制作一个简单的加法运算器
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void txtNum2_TextChanged(object sender, EventArgs e)
        {
            txtSum.Text = (Convert.ToInt32(txtNum1.Text) + Convert.ToInt32(txtNum2.Text)).ToString();
        }
    }
}