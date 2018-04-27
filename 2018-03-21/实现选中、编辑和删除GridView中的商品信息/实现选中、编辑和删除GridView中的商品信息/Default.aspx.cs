using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 实现选中_编辑和删除GridView中的商品信息
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();//调用自定义方法绑定数据到控件
            }
        }

        public void BindData()
        {
            GridView1.DataSource = DBHelper.GetData("select * from mrbccd");//设置GridView控件的数据源为创建的数据集ds

            //将数据库表中的主键字段放入GridView控件的DataKeyNames属性中
            GridView1.DataKeyNames = new string[] { "BccdID" };
            GridView1.DataBind();//绑定数据库表中数据
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //定义一个整型变量count存储根据当前行索引获取到的指定单元格中的字段值
            int count = int.Parse(GridView1.Rows[e.RowIndex].Cells[4].Text.Trim());
            if (count > 0)
            {
                e.Cancel = true; // 取消删除动作
                lblMessage.Text = "警告：库存量大于0的商品不得删除！";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string delete_sql = "delete from mrbccd where BccdID='" + GridView1.DataKeys[e.RowIndex].Value.ToString() + "'";
            int rowAffected = DBHelper.ExecuteNonQuery(delete_sql);
            if (rowAffected > 0)
            {
                Response.Write("<script>alert('删除成功！')</script>");
                BindData();//调用自定义方法重新绑定控件中数据
            }
            else
            {
                Response.Write("<script>alert('删除失败！')</script>");
            }
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //取得编辑行的关键字段的值
            string bccdID = GridView1.DataKeys[e.RowIndex].Value.ToString();

            //取得文本框中输入的内容
            string bccdName = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[1].Controls[0])).Text.ToString().Trim();
            string bccdPrice = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[2].Controls[0])).Text.ToString().Trim();
            string bccdSaleDate = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[3].Controls[0])).Text.ToString().Trim();
            string bccdInStock = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[4].Controls[0])).Text.ToString().Trim();

            //定义更新操作的SQL语句
            string update_sql = "update mrbccd set BccdName='" + bccdName + "',BccdPrice='" + bccdPrice + 
                "',bccdSaleDate='" + Convert.ToDateTime(bccdSaleDate) + 
                "',BccdInStock='" + bccdInStock + "' where BccdID='" + bccdID + "'";

            int rowAffected = DBHelper.ExecuteNonQuery(update_sql);
            if (rowAffected > 0)
            {
                Response.Write("<script>alert('修改成功！')</script>");
                //设置GridView控件的编辑项的索引为－1，即取消编辑
                GridView1.EditIndex = -1;
                BindData();
            } // end if
            else
            {
                Response.Write("<script>alert('修改失败！');</script>");
            } // end else
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            //设置GridView控件的编辑项的索引为－1，即取消编辑
            GridView1.EditIndex = -1;
            BindData();//数据绑定
        }
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            BindData();//数据绑定
        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            BindData();//数据绑定
        }
    }
}