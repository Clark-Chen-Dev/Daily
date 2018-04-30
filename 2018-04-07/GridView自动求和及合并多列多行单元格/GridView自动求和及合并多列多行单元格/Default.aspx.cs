using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GridView自动求和及合并多列多行单元格
{
    public partial class Default : System.Web.UI.Page
    {
        private int sum = 0;//取指定列的数据和

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["SortOrder"] = "stuname";
                ViewState["OrderDire"] = "ASC";
                GetData();
            }
        }

        private void GetData()
        {
            DataTable tbl = DBHelper.GetData("select * from tb_StuResult");
            DataView dv = new DataView(tbl);
            string sort = (string)ViewState["SortOrder"] + " " + (string)ViewState["OrderDire"];
            dv.Sort = sort;
            GridView1.DataSource = dv;
            GridView1.DataBind();
            GridView1.ShowFooter = false;
        }

        protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
        {
            string sPage = e.SortExpression;
            if (ViewState["SortOrder"].ToString() == sPage)
            {
                if (ViewState["OrderDire"].ToString() == "Desc")
                    ViewState["OrderDire"] = "ASC";
                else
                    ViewState["OrderDire"] = "Desc";
            }
            else
            {
                ViewState["SortOrder"] = e.SortExpression;
            }
            GetData();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowIndex >= 0)//判断当前索引值是否大于等于0
            {
                sum += Convert.ToInt32(e.Row.Cells[4].Text);//索引从0开始查找显示学生分数的列单元格
            }
            else if (e.Row.RowType == DataControlRowType.Footer)//判断当前操作的是否是GridView脚注
            {
                e.Row.Cells[1].Text = "总分为：";
                e.Row.Cells[2].Text = sum.ToString();//计算总分数
                e.Row.Cells[3].Text = "平均分为：";
                e.Row.Cells[4].Text = ((int)(sum / GridView1.Rows.Count)).ToString();//计算平均分数
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text != "")
            {
                GridView1.DataSource = DBHelper.GetData("select * from tb_StuResult where stuname='" + TextBox1.Text.ToString().Trim() + "'") ;
                GridView1.DataBind();
                gvRender();
            }
            else
            {
                Response.Write("<script>alert('请输入要查询的学生姓名')</script>");
            }
        }
        protected void btnBack_Click(object sender, EventArgs e)
        {
            GetData();
        }
        private void gvRender()
        {
            if (GridView1.Rows.Count <= 1)//没有数据返回当前行
            {
                return;
            }
            for (int i = 0; i < GridView1.Columns.Count; i++)//遍历列
            {
                TableCell oldtc = GridView1.Rows[0].Cells[i];//指定列单无格
                for (int j = 1; j < GridView1.Rows.Count; j++)//遍历行
                {
                    TableCell newtc = GridView1.Rows[j].Cells[i];
                    if (newtc.Text == oldtc.Text)
                    {
                        newtc.Visible = false;
                        if (oldtc.RowSpan == 0)//如果合并时跨越的行数为0
                        {
                            oldtc.RowSpan = 1;//第一次合并
                        }
                        oldtc.RowSpan++;//如是不是第一次合并，递增一次跨越的行数
                        oldtc.VerticalAlign = VerticalAlign.Middle;//合并后的内容位置居中
                    }
                }
            }
        }
    }
}