using System;
using System.Configuration;
using System.Data.OleDb;
using System.Web.Configuration;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // 获取链接字符串的第一种写法
        //string accessConnStr = ConfigurationManager.AppSettings["AccessConnectionString"];

        // 获取链接字符串的第二种写法
        //string accessConnStr = ConfigurationManager.ConnectionStrings["AccessConnectionString"].ConnectionString;

        // 获取链接字符串的第三种写法（推荐）
        string accessConnStr = WebConfigurationManager.ConnectionStrings["AccessConnectionString"].ConnectionString;
        Response.Write("Aceess数据库连接字符串：" + accessConnStr);//输出获取的数据库字符串信息

        OleDbConnection accessConn = new OleDbConnection(ConfigurationManager.AppSettings["AccessConnectionString"]);
        try
        {
            accessConn.Open();
            Response.Write("<script>alert('连接成功')</script>");//输出获取的数据库字符串信息
            accessConn.Close();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert(" + ex.ToString() + ")</script>");
        }
    }
}