using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 使用绑定表达式高亮显示搜索关键字
{
    public partial class Default : System.Web.UI.Page
    {
        private decimal orderTotal = 0.0m;//创建一个变量来保存订货金额总和

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                DBBind();
        }

        public void DBBind()
        {
            string sqlText = "SELECT 产品编号, 产品, 单价, 库存量, 已订购量, 订单日期,单价 * 已订购量 AS 订货金额 FROM tb_OrderForm";
            GridView1.DataSource = DBHelper.GetData(sqlText);
            GridView1.DataBind();
        }

        protected string HightLightText(string strKey, string keyword)
        {
            if (keyword == "")
            {
                return strKey;
            } // end if

            string strReturn = strKey.Replace(keyword, "<span class='highlightTxtSearch'>" + keyword + "</span>");
            return strReturn;
        }

        protected void btnReturn_Click(object sender, EventArgs e)
        {
            DBBind();
        }

        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            // 如果正被创建的数据行是一个脚注，则更新数据列加总。
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                Label total = (Label)(e.Row.FindControl("OrderTotalLabel"));
                if (total != null)
                {
                    total.Text = orderTotal.ToString("c");
                } // end if

            } // end if
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            DBBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string sqlText = "select 产品编号, 产品, 单价, 库存量, 已订购量, 订单日期,单价 * 已订购量 AS 订货金额 from tb_OrderForm where 产品 like '%" + tbSearch.Text + "%'";
            GridView1.DataSource = DBHelper.GetData(sqlText);
            GridView1.DataBind();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                decimal totalMoney = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "订货金额"));
                orderTotal += totalMoney;
            } // end if
        }
    }
}