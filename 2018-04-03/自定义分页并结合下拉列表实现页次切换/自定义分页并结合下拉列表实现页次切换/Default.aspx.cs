using Microsoft.VisualBasic;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 自定义分页并结合下拉列表实现页次切换
{
    public partial class Default : System.Web.UI.Page
    {
        private decimal orderTotal = 0.0m;//创建一个变量来保存订货金额总和

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DbBind();
            }
        }

        public void DbBind()
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

            if (GridView1.PageIndex == 0)//首页绑定页码按钮设置
            {
                Button_First.Enabled = false;//首页
                Button_Last.Enabled = false;//上页
            }
            else
            {
                Button_First.Enabled = true;
                Button_Last.Enabled = true;
            }

            if (GridView1.PageIndex == GridView1.PageCount - 1)//末页绑定页码按钮设置
            {
                Button_End.Enabled = false;//末页
                Button_Next.Enabled = false;//尾页
            }
            else
            {
                Button_End.Enabled = true;
                Button_Next.Enabled = true;
            }

            if (GridView1.PageCount <= 0)//页数为0的特殊设置
            {
                Button_First.Enabled = false;
                Button_Last.Enabled = false;
                Button_End.Enabled = false;
                Button_Next.Enabled = false;
            }

            //页码下拉类表设置
            if (DropDown_PageList != null)
            {
                DropDown_PageList.ClearSelection();
                DropDown_PageList.Items.Clear();

                for (int i = 0; i < GridView1.PageCount; i++)
                {
                    int pageNumber = i + 1;//创建一个ListItem对象来存储分页数列表
                    ListItem item = new ListItem(pageNumber.ToString());

                    // 每 3笔设置一种背景颜色。
                    switch (Conversion.Fix(pageNumber / 3))
                    {
                        case 0:
                        case 2:
                            item.Attributes.Add("style", "background: yellow;");
                            break;
                        case 1:
                        case 3:
                            item.Attributes.Add("style", "background: cyan;");
                            break;
                    }

                    //如果ListItem对象的分页数与当前所选择的分页数相同，
                    //将该ListItem对象的分页数标记成被选择（selected）状态
                    if (i == GridView1.PageIndex)
                    {
                        item.Selected = true;
                    }
                    DropDown_PageList.Items.Add(item);//将ListItem对象的计算的分页数添加到下拉列表的元素集合中
                }
            }

            //页码标签获取：当前页N/N
            int currentPage = GridView1.PageIndex + 1;
            l_djy.Text = "第" + currentPage + "页";
            l_gjy.Text = "共" + GridView1.PageCount.ToString() + "条";
            l_jls.Text = "当前页共" + GridView1.Rows.Count.ToString() + "条记录";
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string sqlstr = "select 产品编号, 产品, 单价, 库存量, 已订购量, 订单日期,单价 * 已订购量 AS 订货金额 from tb_OrderForm where 产品 like '%" + tbSearch.Text + "%'";
            DbBind();
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

        protected void btnReturn_Click(object sender, EventArgs e)
        {
            DbBind();
        }
        protected void Button_First_Click(object sender, EventArgs e)
        {
            GridView1.PageIndex = 0;//首页
            DbBind();
        }
        protected void Button_Last_Click(object sender, EventArgs e)
        {
            GridView1.PageIndex -= 1;//上一页
            DbBind();
        }
        protected void Button_End_Click(object sender, EventArgs e)
        {
            GridView1.PageIndex += GridView1.PageCount - 1;//最后一页
            DbBind();

        }
        protected void Button_Next_Click(object sender, EventArgs e)
        {
            GridView1.PageIndex += 1;//下一页
            DbBind();
        }
        protected void DropDown_PageList_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView1.PageIndex = DropDown_PageList.SelectedIndex;  //将GridView控件移到用户选择的笔数
            DbBind();                                                //重新绑定下GridView控件
        }
    }
}