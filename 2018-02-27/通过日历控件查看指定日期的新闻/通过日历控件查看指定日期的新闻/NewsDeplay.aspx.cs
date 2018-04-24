using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 通过日历控件查看指定日期的新闻
{
    public partial class NewsDeplay : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataGridDataBind();
                Session["dateValue"] = Request["dateValue"]; 
            } // end if
        }

        protected void MyDataView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            MyDataView.PageIndex = e.NewPageIndex;
            DataGridDataBind();
        }

        private void DataGridDataBind()
        {
            string connStr = WebConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            string sqlText = "select ID,Title,Style,Type,IssueDate from tbNews where IssueDate='" + Request["dateValue"] + "'";
            //string sqlText = "select ID,Title,Style,Type,IssueDate from tbNews where IssueDate='" + "2006-03-28" + "'";
            SqlConnection conn = new SqlConnection();
            SqlDataAdapter adapter = new SqlDataAdapter(sqlText, connStr);
            DataTable tbl = new DataTable();
            adapter.Fill(tbl);
            try
            {
                if (tbl.Rows.Count == 0)
                {
                    Response.Write("您指定的日期没有发布任何新闻");
                } // end if
                else
                {
                    MyDataView.DataSource = tbl;
                    MyDataView.DataBind();
                } // end else
            } // end try
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            } // end catch
        } // end method DataGridDataBind
    }
}