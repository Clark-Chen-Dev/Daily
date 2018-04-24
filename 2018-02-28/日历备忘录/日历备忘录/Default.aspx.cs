using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 日历备忘录
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            string dateValue;
            dateValue = Calendar1.SelectedDate.ToShortDateString();
            Response.Write("<script type='text/javascript'>window.open('Remember.aspx?dateValue=" + dateValue + "','','width=640,height=530')</script>");
        }
    }
}