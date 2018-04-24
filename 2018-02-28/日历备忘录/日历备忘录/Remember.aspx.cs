using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 日历备忘录
{
    public partial class Remember : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string dataValue = Request.QueryString["dateValue"].ToString();
                txtContent.Text = GetInfo(dataValue);
            }
        }

        private string GetInfo(string dataValue)
        {
            string content = string.Empty; //获得备忘主题
            string sqlText = "select Content from Holidays where HolidayDate like '%" + dataValue + "%'";
            content = DBHelper.ExecuteReader(sqlText);

            return content;
        }

        protected void BtnInput_Click(object sender, EventArgs e)
        {
            string holidayDate = DateTime.Now.ToShortDateString();
            String contentValue = txtContent.Text.ToString();
            string sqlText = "insert into Holidays(HolidayDate,Content) values ('" +
                holidayDate + "','" + contentValue + "')";
            DBHelper.ExecuteNonQuery(sqlText);
        }

        protected void BtnClose_Click(object sender, EventArgs e)
        {
            Response.Write("<script type='text/javascript'>window.close();location='history.go(-1)'</script>");
        }
    }
}