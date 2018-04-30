using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 根据多个字段内容设置不同数据行的背景色
{
    public partial class Default : System.Web.UI.Page
    {
        private decimal orderTotal = 0.0m;//创建一个变量来保存订货金额总和
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                DbBind();
        }

        public void DbBind()
        {
            GridView1.DataSource = DBHelper.GetData("SELECT 产品编号, 单价, 库存量, 已订购量, 订单日期,单价 * 已订购量 AS 订货金额 FROM tb_OrderForm");
            GridView1.DataBind();
        }

        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            // 提取当前的数据行。
            GridViewRow row = e.Row;
            // 如果正被创建的数据行是一个脚注，则更新数据列加总。
            if (row.RowType == DataControlRowType.Footer)
            {
                // 取得脚注当中的标签控件 OrderTotalTotal 。
                Label total = (Label)(e.Row.FindControl("OrderTotalLabel"));

                // 以货币格式来显示订货金额加总。
                if (total != null)
                {
                    total.Text = orderTotal.ToString("c");
                }
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            DbBind();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // 确认“库存量”字段的值。
                // 我们通过一个 DataBinder.Eval() 调用从将被绑定到 GridView 数据行的 
                // 数据中取得“库存量”字段的值，传递给 DataBinder.Eval() 的第一个参 
                // 数是将被绑定到 GridView 数据行的数据（也就是 e.Row.DataItem），
                // 传递给 DataBinder.Eval() 的第二个参数则是字段名称。
                decimal stock =
                  Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "库存量"));
                if (stock <= 0)
                {
                    // 如果库存量小于或等于 0，则将该数据行的背景色设置成红色。
                    e.Row.BackColor = Color.Red;
                }
                decimal totalMoney =
                   Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "订货金额"));
                if (totalMoney > 0)
                {
                    // 如果订货金额大于 0，则将该数据行的背景色设置成黄色。
                    e.Row.BackColor = Color.Yellow;
                }
                orderTotal += totalMoney;// 累加订货金额并赋给变量 orderTotal。
            }
        }
    }
}