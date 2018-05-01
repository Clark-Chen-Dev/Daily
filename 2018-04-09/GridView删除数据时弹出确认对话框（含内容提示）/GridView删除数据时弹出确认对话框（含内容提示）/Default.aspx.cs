using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GridView删除数据时弹出确认对话框_含内容提示_
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetData();
            }
        }

        private void GetData()
        {
            GridView1.DataSource = DBHelper.GetData("select * from tb_inf");
            GridView1.DataKeyNames = new string[] { "id" };
            GridView1.DataBind();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (e.Row.Cells[6].Text == "False")
                {

                    e.Row.Cells[6].Text = "<font color=red>已通过</font>";
                }
                else
                {
                    e.Row.Cells[6].Text = "未通过";
                }
                if (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate)
                {
                    //内容提示为GridView第二行数据显示的内容，其索引值为1（注意：.NET中索引值都是从0开始）
                    ((LinkButton)e.Row.Cells[8].Controls[0]).Attributes.Add("onclick", "javascript:return confirm('确认要删除信息主题:\"" + e.Row.Cells[1].Text + "\"吗？')");
                }
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GetData();
        }

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            string id = GridView1.DataKeys[e.NewSelectedIndex].Value.ToString();
            string sqlText = "update tb_inf set [check] = ~[check] where id = " + id;
            if (DBHelper.ExecuteNonQuery(sqlText) == 0)
            {
                Response.Write("<script>alert('数据更新失败');</script>");
            }
            GetData();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int infoId = (int)GridView1.DataKeys[e.RowIndex].Value;//获取要删除的数据行的索引
            string sqlText = "Delete from tb_inf where id=" + infoId;
            if (DBHelper.ExecuteNonQuery(sqlText) > 0)
            {
                Response.Write("<script>alert('删除成功！')</script>");
            } // end if
            else
            {
                Response.Write("<script>alert('删除失败！')</script>");
            }
        }
    }
}