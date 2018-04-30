using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 实现搜索GridView多个关键字高亮显示
{
    public partial class Default : System.Web.UI.Page
    {
        private decimal orderTotal = 0.0m;//创建一个变量来保存订货金额总和
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                DbBind();
        }

        private void DbBind()
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
                decimal totalMoney =
                   Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "订货金额"));
                //累加订货金额并赋给变量 orderTotal。
                orderTotal += totalMoney;
            }
        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
            DbBind();
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string sqlstr = "select 产品编号, 产品, 单价, 库存量, 已订购量, 订单日期,单价 * 已订购量 AS 订货金额 from tb_OrderForm where 产品 like '%" + tbSearch.Text + "%'";
            Highlightkeywords(sqlstr, this.tbSearch.Text.Trim());
            DbBind();
        }
        /// <summary>
        /// 替换关键字为红色
        /// </summary>
        /// <param name="keycontent">原始内容</param>
        /// <param name="k">关键字，支持多关键字</param>
        /// <returns>String</returns>
        /// <author>haver Guo</author>
        public string Highlightkeywords(string keycontent, string k)
        {
            string resultstr = keycontent;
            if (k == "")
            {
                return keycontent;
            }
            if (k.Trim().IndexOf('，') > 0)
            {
                string[] myArray = k.Split('，');
                for (int i = 0; i < myArray.Length; i++)
                {
                    resultstr = resultstr.Replace(myArray[i].ToString(), "<span class='highlightTxtSearch'>" + myArray[i].ToString() + "</span>");
                }
                return resultstr;
            }
            else
            {
                return resultstr.Replace(k, "<span class='highlightTxtSearch'>" + k + "</span>");
            }
        }
    }
}