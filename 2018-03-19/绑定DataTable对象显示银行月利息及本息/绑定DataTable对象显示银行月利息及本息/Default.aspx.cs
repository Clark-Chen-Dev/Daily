using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 绑定DataTable对象显示银行月利息及本息
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable tbl = new DataTable();//创建TataTable对象
                tbl.Columns.Add(new DataColumn("月份", typeof(int)));
                tbl.Columns.Add(new DataColumn("现存款数", typeof(float)));
                tbl.Columns.Add(new DataColumn("利息", typeof(float)));
                tbl.Columns.Add(new DataColumn("本息和", typeof(float)));

                decimal interest = 0;
                decimal total = 500;
                for (int i = 0; i <=11; i++)
                {
                    
                    DataRow dr = tbl.NewRow();
                    dr[0] = i + 1;
                    dr[1] = 500;
                    dr[2] = interest;
                    dr[3] = total;
                    tbl.Rows.Add(dr);

                    if (i > 0)
                    {
                        interest = total * 0.05m;
                        total = (500 + interest + total);
                    }
                } // end for

                GridView1.DataSource = tbl;
                GridView1.DataBind();
            }
        }
    }
}