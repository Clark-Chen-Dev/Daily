using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 嵌套DropDownList控件根据库存量设置商品停售
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
            GridView1.DataSource = DBHelper.GetData("SELECT 产品编号, 产品, 单价, 库存量, 已订购量, 订单日期,单价 * 已订购量 AS 订货金额,CASE 是否停售 WHEN 'False' THEN '不停售' ELSE '停售' END AS SellState FROM tb_OrderForm");
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
            GetData();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            GridView1.DataSource = DBHelper.GetData("select 产品编号, 产品, 单价, 库存量, 已订购量, 订单日期,单价 * 已订购量 AS 订货金额,CASE 是否停售 WHEN 'False' THEN '不停售' ELSE '停售' END AS SellState from tb_OrderForm where 产品 like '%" + tbSearch.Text + "%'");
            GridView1.DataBind();
        }

        protected string HightLightText(string strKey, string keyworld)
        {
            if (keyworld == "")//如果查询关键字为空返回原内容
            {
                return strKey;
            }
            string strReturn = strKey.Replace(keyworld, "<span class='highlightTxtSearch'>" + keyworld + "</span>");
            return strReturn;
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GetData();
        }

        protected void btnReturn_Click(object sender, EventArgs e)
        {
            GetData();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = int.Parse(GridView1.DataKeys[e.RowIndex].Value.ToString());
            bool PaperState = bool.Parse(((DropDownList)GridView1.Rows[e.RowIndex].FindControl("ddlSellState")).SelectedValue);

            string sqlText = "UPDATE tb_OrderForm SET 是否停售 = "+ PaperState + " WHERE 产品编号= "+ id;

            if (DBHelper.ExecuteNonQuery(sqlText) > 0)
            {
                Response.Write("<script language=javascript>alert('设置成功!');location='Default.aspx'</script>");
            }
            else
            {
                Response.Write("<script language=javascript>alert('设置失败!');location='Default.aspx'</script>");
            }
            //取消编辑操作
            GridView1.EditIndex = -1;
            //调用自定义方法DbBind()重新绑定GridView控件中信息
            GetData();
        }
    }
}