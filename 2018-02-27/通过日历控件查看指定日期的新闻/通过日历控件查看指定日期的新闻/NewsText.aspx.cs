using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace 通过日历控件查看指定日期的新闻
{
    public partial class NewsText : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                DataGridDataBind();
        }

        private void DataGridDataBind()
        {
            string connStr = WebConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            string sqlText = "select content from tbNews where Id=" + Request["UId"];
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = sqlText;
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                if (reader.Read())
                {
                    Label1.Text = reader["content"].ToString();
                } // end if
                reader.Close();
                conn.Close();
            } // end using
        }
    }
}