using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GridView数据源为空时显示表头和提示信息
{
    public partial class Default : System.Web.UI.Page
    {
        private decimal orderTotal = 0.0m;//创建一个变量来保存订货金额总和

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                GetData();
        }

        private void GetData()
        {
            GridView1.DataSource = DBHelper.GetData("SELECT 产品编号, 产品, 单价, 库存量, 已订购量, 订单日期,单价 * 已订购量 AS 订货金额 FROM tb_OrderForm");
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

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (GridView1.Rows.Count > 0)
                {
                    decimal totalMoney =
                       Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "订货金额"));
                    //累加订货金额并赋给变量 orderTotal。
                    orderTotal += totalMoney;
                }
                else
                {
                    orderTotal = 0.0m;
                }
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
            GetData();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string sqlText = "select 产品编号, 产品, 单价, 库存量, 已订购量, 订单日期,单价 * 已订购量 AS 订货金额 from tb_OrderForm where 产品 like '%" + tbSearch.Text + "%'";
            DataTable tbl = DBHelper.GetData(sqlText);
            if (tbl.Rows.Count > 0)//如果有数据
            {
                this.GridView1.DataSource = tbl;//将dt对象作为数据源
                this.GridView1.DataBind();//绑定数据
            }
            else//如果数据源或查询数据为空
            {
                DataTable table = tbl.Clone();
                table.Rows.Add(table.NewRow());
                GridView1.DataSource = table;
                GridView1.DataBind();
                int columnCount = table.Columns.Count;
                GridView1.Rows[0].Cells.Clear();
                GridView1.Rows[0].Cells.Add(new TableCell());
                GridView1.Rows[0].Cells[0].ColumnSpan = columnCount;
                GridView1.Rows[0].Cells[0].Text = "没有相关记录信息！"; 
                GridView1.Rows[0].Cells[0].Style.Add("text-align", "center");
            }

            GridView1.SelectedIndex = -1;
        }

        protected void btnReturn_Click(object sender, EventArgs e)
        {
            GetData();
        }
    }
}