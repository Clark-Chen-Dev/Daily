using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string sqlServerConnStr = WebConfigurationManager
            .ConnectionStrings["SqlServerConnectionstring"].ConnectionString;
        Response.Write("SQL Server数据库连接字符串：" + sqlServerConnStr);
        using (SqlConnection sqlConn = new SqlConnection(sqlServerConnStr))
        {
            try
            {
                sqlConn.Open();
                Response.Write("<script>alert('连接成功')</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert(" + ex.ToString() + ")</script>");
            }

            sqlConn.Close();
        }
    }
}