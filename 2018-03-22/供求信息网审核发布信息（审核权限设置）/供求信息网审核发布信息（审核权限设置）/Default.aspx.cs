using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 供求信息网审核发布信息_审核权限设置_
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetData();
            } // end if
        }

        public void GetData()
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
                } // end if
                else
                {
                    e.Row.Cells[6].Text = "未通过";
                } // end else
            } // end if
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

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GetData();
        }
    }
}