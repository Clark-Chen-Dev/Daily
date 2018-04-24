using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 显示长日期格式时间
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            string sqlText = "select top 1* from tb_Member";
            SqlDataAdapter adapter = new SqlDataAdapter(sqlText, connStr);
            DataSet ds = new DataSet();
            adapter.Fill(ds, "tb_Member");
            DataList1.DataSource = ds;
            DataList1.DataBind();
            
            DataRowView drv = ds.Tables["tb_Member"].DefaultView[0];
            for (int i = 0; i <= DataList1.Items.Count - 1; i++)
            {
                Label lab = (Label)DataList1.Items[i].FindControl("Label1");
                DateTime dt = Convert.ToDateTime(drv["date"]);
                lab.Text = dt.ToLongDateString();
            }
        }
    }
}