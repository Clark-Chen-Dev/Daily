using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 嵌套GridView控件实现商品信息明细表
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GetOrderData();
        }

        private void GetOrderData()
        {
            gvOrder.DataSource = DBHelper.GetData("select * from tb_GoodsType");
            gvOrder.DataKeyNames = new string[] { "GoodsTypeID" };
            gvOrder.DataBind();
        }

        protected void gvOrder_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvOrder.PageIndex = e.NewPageIndex;
        }

        protected void gvOrder_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)//判断当前操作的是否是数据行
            {
                GridView gvGoodsDetail = e.Row.FindControl("gvDetail") as GridView;//FindControl查找嵌套的GridView控件
                if (gvGoodsDetail != null)//判断显示商品明细的GridView数据是否为空
                {
                    //根据获取的主表中当前行（e.Row.RowIndex）索引查找该商品订单的明细表（次表）
                    gvGoodsDetail.DataSource = DBHelper.GetData("select * from tb_GoodsInfo1 where GoodsTypeID=" +
                        gvOrder.DataKeys[e.Row.RowIndex].Value.ToString());
                    gvGoodsDetail.DataBind();
                }
            }
        }
    }
}