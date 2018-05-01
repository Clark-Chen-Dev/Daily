using System;
using System.Collections;

namespace 创建表头固定_表体可滚动的GridView控件
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridView1.Attributes.Add("style", "table-layout:fixed");
                GridView1.DataSource = CreateDataSource();
                GridView1.DataBind();
            }
        }

        ICollection CreateDataSource()
        {
            System.Data.DataTable dt = new System.Data.DataTable();
            System.Data.DataRow dr;
            dt.Columns.Add(new System.Data.DataColumn("学生班级", typeof(System.String)));
            dt.Columns.Add(new System.Data.DataColumn("学生姓名", typeof(System.String)));
            dt.Columns.Add(new System.Data.DataColumn("语文", typeof(System.Decimal)));
            dt.Columns.Add(new System.Data.DataColumn("数学", typeof(System.Decimal)));
            dt.Columns.Add(new System.Data.DataColumn("英语", typeof(System.Decimal)));
            dt.Columns.Add(new System.Data.DataColumn("计算机", typeof(System.Decimal)));

            for (int i = 0; i < 50; i++)
            {
                System.Random rd = new System.Random(Environment.TickCount * i); ;
                dr = dt.NewRow();
                dr[0] = "班级" + i.ToString();
                dr[1] = "【明日科技】" + i.ToString();
                dr[2] = Math.Round(rd.NextDouble() * 100, 2);
                dr[3] = Math.Round(rd.NextDouble() * 100, 2);
                dr[4] = Math.Round(rd.NextDouble() * 100, 2);
                dr[5] = Math.Round(rd.NextDouble() * 100, 2);
                dt.Rows.Add(dr);
            }
            System.Data.DataView dv = new System.Data.DataView(dt);
            return dv;
        }
    }
}