using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GridView数据绑定并实现自带分页功能
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataSource = DBHelper.GetData("select * from mrbccd");
            GridView1.DataKeyNames = new string[] { "BccdID" }; //将数据库表中的主键字段放入GridView控件的DataKeyNames属性中
            GridView1.DataBind();  //绑定数据库表中数据
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }
    }
}