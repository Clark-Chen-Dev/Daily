using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 格式化订货金额和订单日期并进行绑定
{
    public partial class Default : System.Web.UI.Page
    {
        private decimal orderTotal = 0.0m; // 创建一个变量来保存订货金额总和
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DbBind();
            }
        }

        private void DbBind()
        {
            string connStr = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string sqlText = "SELECT 产品编号, 单价, 库存量, 已订购量, 订单日期,单价 * 已订购量 AS 订货金额 FROM tb_OrderForm";

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlDataAdapter adapter = new SqlDataAdapter(sqlText, conn);
                DataTable tbl = new DataTable();
                adapter.Fill(tbl);
                GridView1.DataSource = tbl;
                GridView1.DataBind();
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            DbBind();
        }

        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            // 如果正被创建的数据行是一个脚注，则更新数据列加总。
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                Label total = (Label)e.Row.FindControl("OrderTotalLabel");

                // 以货币格式来显示订货金额加总。
                if (total != null)
                {
                    total.Text = orderTotal.ToString("c");
                }
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                decimal totalMoney = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "订货金额"));
                //累加订货金额并赋给变量 orderTotal。
                orderTotal += totalMoney;
            }
        }
    }
}