using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Office.Interop.Excel;

namespace 将SQLServer数据查询结果输出到Excel
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string connStr = WebConfigurationManager.ConnectionStrings["ConnStr"].ToString();
                using (SqlConnection con = new SqlConnection(connStr))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("select * from tb_Employee", con);
                    SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                    GridView1.DataSource = reader;
                    GridView1.DataBind();
                }
            }
        }

        protected void BtnExport_Click(object sender, EventArgs e)
        {
            Application excel = new Application(); // 实例化Excel对象
            excel.Workbooks.Add(true); // 在Excel中添加一个工作簿
            excel.Visible = true; // 设置Excel显示

            for (int i = 0; i < GridView1.Columns.Count; i++)
            {
                excel.Cells[1, i + 1] = GridView1.Columns[i].HeaderText; // 将数据表格控件中的列表头填充到Excel中
            }

            #region 填充数据
            for (int i = 0; i < GridView1.Rows.Count; i++) // 遍历数据表格控件的所有行
            {
                for (int j = 0; j < GridView1.Columns.Count; j++) // 遍历数据表格控件的所有列
                {
                    excel.Cells[i + 2, j + 1] = GridView1.Rows[i].Cells[j].Text; // 填充Excel表格
                }
            } 
            #endregion

        }
    }
}