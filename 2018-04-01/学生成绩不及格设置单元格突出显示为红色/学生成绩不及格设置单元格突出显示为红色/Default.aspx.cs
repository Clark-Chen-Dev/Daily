using System;
using System.Data;
using System.Drawing;
using System.Web.UI.WebControls;

namespace 学生成绩不及格设置单元格突出显示为红色
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable tbl = DBHelper.GetData("select * from tb_StuResult");
            GridView1.DataSource = tbl;//设置数据源
            GridView1.DataBind();//绑定数据

            for (int i = 0; i <= GridView1.Rows.Count - 1; i++)//遍历控件
            {
        
                GridViewRow row = GridView1.Rows[i];
                string score = row.Cells[5].Text;
                if (Convert.ToInt32(score) < 60)//判断res_total值即学生成绩如果小于60分为不及格
                {
                    GridView1.Rows[i].Cells[5].BackColor = Color.Red;//成绩不及格时单无格显示红色
                }
            }
        }
    }
}