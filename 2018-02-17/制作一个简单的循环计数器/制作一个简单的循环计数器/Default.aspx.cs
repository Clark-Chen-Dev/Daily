using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 制作一个简单的循环计数器
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int total = 0;
            int i = 0;
            while (total <= 1000)
            {
                i++;
                total += i;
                Response.Write("1加到" + i + "等于" + total + "<br />");
            }
        }
    }
}