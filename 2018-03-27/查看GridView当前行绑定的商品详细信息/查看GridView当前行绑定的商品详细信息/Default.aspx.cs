using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 查看GridView当前行绑定的商品详细信息
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            gvGoodsInfo.DataSource = DBHelper.GetData("select * from tbPicture");                          //设定数据源
            gvGoodsInfo.DataBind();
        }

        protected void gvGoodsInfo_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvGoodsInfo.PageIndex = e.NewPageIndex;
            gvGoodsInfo.DataBind();
        }
    }
}