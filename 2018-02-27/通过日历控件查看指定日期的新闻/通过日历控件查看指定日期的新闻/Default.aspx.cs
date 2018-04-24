using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 通过日历控件查看指定日期的新闻
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            DateTime dateValue;
            dateValue = Convert.ToDateTime(Calendar1.SelectedDate);
            Response.Redirect("NewsDeplay.aspx?dateValue=" + dateValue);
        }
    }
}