using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 使用主题来设置GridView控件的外观
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetData();
            }
        }

        private void GetData()
        {
            gvTitle.DataSource = DBHelper.GetData("select * from employee");
            gvTitle.DataBind();
        }

        protected void gvTitle_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvTitle.PageIndex = e.NewPageIndex;
            GetData();
        }
    }
}