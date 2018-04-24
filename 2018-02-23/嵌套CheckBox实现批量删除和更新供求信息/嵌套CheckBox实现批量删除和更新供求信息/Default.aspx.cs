using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 嵌套CheckBox实现批量删除和更新供求信息
{
    public partial class Default : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DisplayData();
            }
        }

        private void DisplayData()
        {
            GridView1.DataSource = GetData();
            GridView1.DataBind();
            if (!(GridView1.Rows.Count > 0))
            {
                StrHelper.GridViewHeader(GridView1);
            }
        } // end method DisplayData

        private DataTable GetData()
        {
            DataTable tbl;
            string sqlText = "select * from tb_inf";
            string connStr = WebConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlDataAdapter adapter = new SqlDataAdapter(sqlText, connStr);
            tbl = new DataTable();
            adapter.Fill(tbl);
            return tbl;
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            DisplayData();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string content = e.Row.Cells[4].Text;
                e.Row.Cells[4].Text = StrHelper.GetFirstString(content, 12); // 截取12字节宽度内容
            }
        }


        protected void ChkSelAll_CheckedChanged(object sender, EventArgs e)
        {
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                CheckBox chkSel = (CheckBox)GridView1.Rows[i].FindControl("ChkSel");
                chkSel.Checked = !chkSel.Checked;
            }
        }

        protected void BtnDel_Click(object sender, EventArgs e)
        {
            string sqlText = "delete from tb_inf where id=@id";
            string connStr = WebConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            foreach (GridViewRow row in GridView1.Rows)
            {
                CheckBox chkSel = (CheckBox)row.FindControl("ChkSel");
                if (chkSel.Checked)
                {
                    using (SqlConnection conn = new SqlConnection(connStr))
                    {
                        SqlCommand cmd = conn.CreateCommand();
                        cmd.CommandText = sqlText;
                        cmd.Parameters.AddWithValue("@id",row.Cells[1].Text);
                        conn.Open();
                        int rowsAffected = cmd.ExecuteNonQuery();
                        conn.Close();

                        if (rowsAffected > 0)
                        {
                            StrHelper.Alert("删除成功！");
                        }
                        else
                        {
                            StrHelper.Alert("删除失败！");
                        }
                    }
                }
            }

            DisplayData();
        }

        protected void BtnDel_Load(object sender, EventArgs e)
        {
            ((Button)sender).Attributes["onclick"] = "return confirm('您确定要删除吗？')";
        }

        protected void BtnDesel_Click(object sender, EventArgs e)
        {
            ChkSelAll.Checked = false;
            foreach (GridViewRow row in GridView1.Rows)
            {
                CheckBox chkSel = (CheckBox)row.FindControl("ChkSel");
                chkSel.Checked = false;
            }
        }

        protected void BtnUpd_Click(object sender, EventArgs e)
        {
            string sqlText = "Update tb_inf set issueDate=@UpdateTime where id=@id";
            string connStr = WebConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            for (int i = 0; i <= GridView1.Rows.Count - 1; i++)
            {
                CheckBox chkSel = (CheckBox)GridView1.Rows[i].FindControl("ChkSel");
                if (chkSel != null)
                {
                    if (chkSel.Checked)
                    {
                        using (SqlConnection conn = new SqlConnection(connStr))
                        {
                            SqlCommand cmd = conn.CreateCommand();
                            cmd.CommandText = sqlText;
                            cmd.Parameters.AddWithValue("@UpdateTime",DateTime.Now);
                            cmd.Parameters.AddWithValue("@id", GridView1.Rows[i].Cells[1].Text);
                            conn.Open();
                            int rowsAffected = cmd.ExecuteNonQuery();
                            conn.Close();

                            if (rowsAffected > 0)
                            {
                                StrHelper.Alert("更新成功！");
                            }
                            else
                            {
                                StrHelper.Alert("更新失败！");
                            }
                        }
                    }
                }
            }

            DisplayData();
        }
    } // end class Default
}