using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GridView绑定数据为空时的界面设计
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                GridViewEmptyData();
            }
        }

        private void GridViewEmptyData()
        {
            DataTable tbl = new DataTable(); //创建一个DataTable对象

            //新增自定义的4列（即创建DataTable对象的骨架）
            tbl.Columns.Add("id");
            tbl.Columns.Add("name");
            tbl.Columns.Add("location");
            tbl.Columns.Add("date");

            if (tbl.Rows.Count == 0)
            {
                tbl.Rows.Add(tbl.NewRow());
            } // end if

            GridViewEmptyDataShow.DataSource = tbl;
            GridViewEmptyDataShow.DataBind();

            //如果绑定的数据为空，则创建GridView表头并显示提示信息
            int columnCount = tbl.Columns.Count;
            GridViewEmptyDataShow.Rows[0].Cells.Clear();
            GridViewEmptyDataShow.Rows[0].Cells.Add(new TableCell());
            GridViewEmptyDataShow.Rows[0].Cells[0].ColumnSpan = columnCount;
            GridViewEmptyDataShow.Rows[0].Cells[0].Text = "无相关记录信息！";
            GridViewEmptyDataShow.Rows[0].Cells[0].Style.Add("text-align", "center");
        }

        /// <summary>
        /// 数据源为空
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ButtonHasDataBind_Click(object sender, EventArgs e)
        {
            if (GridViewEmptyDataShow.Rows.Count == 1 && GridViewEmptyDataShow.Rows[0].Cells[0].Text == "无相关记录信息！")
            {
                int columnCount = GridViewEmptyDataShow.Columns.Count;          //计算列数
                GridViewEmptyDataShow.Rows[0].Cells.Clear();                    //删除没数据时的提示
                GridViewEmptyDataShow.Rows[0].Cells.Add(new TableCell());       //创建新列的单无格
                GridViewEmptyDataShow.Rows[0].Cells[0].ColumnSpan = columnCount;//计算列数
                GridViewEmptyDataShow.Rows[0].Cells[0].Text = "无相关记录信息！";//数据为空时显示的提示信息
                GridViewEmptyDataShow.Rows[0].Cells[0].Style.Add("text-align", "center");
            }
        }

        /// <summary>
        /// 查询结果为空绑定
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ButtonQueryEmptyBind_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            int columnCount = dt.Columns.Count;
            GridViewEmptyDataShow.Rows[0].Cells.Clear();
            GridViewEmptyDataShow.Rows[0].Cells.Add(new TableCell());
            GridViewEmptyDataShow.Rows[0].Cells[0].ColumnSpan = columnCount;
            GridViewEmptyDataShow.Rows[0].Cells[0].Text = "无相关记录信息！";
            GridViewEmptyDataShow.Rows[0].Cells[0].Style.Add("text-align", "center");
        }

        /// <summary>
        /// 构造空的DataTable绑定
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ButtonConstructTableBind_Click(object sender, EventArgs e)
        {
            DataTable tbl = new DataTable();
            tbl.Columns.Add("id");
            tbl.Columns.Add("name");
            tbl.Columns.Add("location");
            tbl.Columns.Add("date");
            if (tbl.Rows.Count == 0)
            {
                tbl.Rows.Add(tbl.NewRow());
            }
            GridViewEmptyDataShow.DataSource = tbl;
            GridViewEmptyDataShow.DataBind();
        }

        /// <summary>
        /// 普通空数据绑定
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ButtonNormalBind_Click(object sender, EventArgs e)
        {
            DataTable tbl = new DataTable();
            tbl.Columns.Add("id");
            tbl.Columns.Add("name");
            tbl.Columns.Add("location");
            tbl.Columns.Add("date");
            GridViewEmptyDataShow.DataSource = tbl;
            GridViewEmptyDataShow.DataBind();
        }
    }
}