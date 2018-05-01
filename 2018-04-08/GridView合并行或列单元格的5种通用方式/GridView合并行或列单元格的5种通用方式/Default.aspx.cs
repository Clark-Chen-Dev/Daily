using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GridView合并行或列单元格的5种通用方式
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
            DataView view = new DataView(tbl);
            string sort = (string)ViewState["SortOrder"] + " " + (string)ViewState["OrderDire"];
            view.Sort = sort;
            GridView1.DataSource = view;
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
            if (e.Row.RowIndex != -1)
            {
                int id = e.Row.RowIndex + 1;
                e.Row.Cells[0].Text = id.ToString();
            }
        }

        /// <summary>
        /// 合并GridView中某行相同信息
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnMergeAdjacentColsRow_Click(object sender, EventArgs e)
        {
            int row = Convert.ToInt32(this.TextBox1.Text); // 用户输入的行号
            if ((row - 1) < 0 || (row - 1) > GridView1.Rows.Count)
            {
                return;
            }
            else
            {
                TableCell preCell = GridView1.Rows[row - 1].Cells[0];

                for (int i = 1; i < GridView1.Rows[row - 1].Cells.Count; i++)
                {
                    TableCell currCell = GridView1.Rows[row - 1].Cells[i];

                    if (preCell.Text == currCell.Text)
                    {
                        currCell.Visible = false;
                        if (preCell.ColumnSpan == 0)
                        {
                            preCell.ColumnSpan = 1;
                        }
                        preCell.ColumnSpan++;
                        preCell.VerticalAlign = VerticalAlign.Middle;
                    } // end if
                    else
                    {
                        preCell = currCell;
                    } // end else
                } // end for
            } // end else
        }

        /// <summary>
        /// 合并一行中的几列
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnMergeColsRow_Click(object sender, EventArgs e)
        {
            int row = Convert.ToInt32(this.tbRows.Text);
            int startCol = Convert.ToInt32(this.tbstartCol.Text);
            int endCol = Convert.ToInt32(this.tbendCol.Text);
            if (GridView1 == null || endCol < startCol || (row - 1) > GridView1.Rows.Count)
            {
                return;
            }
            else
            {
                TableCell startCell = GridView1.Rows[row - 1].Cells[startCol - 1];

                for (int i = 1; i < endCol - startCol + 1; i++)
                {
                    TableCell currCell = GridView1.Rows[row - 1].Cells[i + startCol - 1];
                    currCell.Visible = false;
                    if (startCell.ColumnSpan == 0)
                    {
                        startCell.ColumnSpan = 1;
                    } // end if
                    startCell.ColumnSpan++;
                    startCell.VerticalAlign = VerticalAlign.Middle;
                } // end for
            } // end else
        }

        /// <summary>
        /// 合并GridView中某列相同信息
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnColumn_Click(object sender, EventArgs e)
        {
            int colNo = Convert.ToInt32(this.tbCol.Text);
            if (GridView1.Rows.Count < 1 || (colNo - 1) > GridView1.Rows[0].Cells.Count - 1)
            {
                return;
            }

            TableCell preCell = GridView1.Rows[0].Cells[colNo - 1];

            for (int i = 1; i < GridView1.Rows.Count; i++)
            {
                TableCell currCell = GridView1.Rows[i].Cells[colNo - 1];
                if (currCell.Text == preCell.Text)
                {
                    currCell.Visible = false;
                    if (preCell.RowSpan == 0)
                    {
                        preCell.RowSpan = 1;
                    } // end if
                    preCell.RowSpan++;
                } // end if
                else
                {
                    preCell = currCell;
                } // end else
            } // end for
        }

        /// <summary>
        /// 合并某一列中的几行
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnColAndRows_Click(object sender, EventArgs e)
        {
            int col = Convert.ToInt32(this.tbColumns.Text);
            int startRow = Convert.ToInt32(tbstartRow.Text);
            int endRow = Convert.ToInt32(this.tbendRow.Text);
            if (GridView1 == null || endRow < startRow || (col - 1) > GridView1.Rows.Count)
            {
                return;
            }
            else
            {
                TableCell startCell = GridView1.Rows[startRow - 1].Cells[col - 1];
                for (int i = 1; i < endRow - startRow + 1; i++)
                {
                    TableCell currCell = GridView1.Rows[startRow - 1 + i].Cells[col - 1];
                    currCell.Visible = false;

                    if (startCell.RowSpan == 0)
                    {
                        startCell.RowSpan = 1;
                    } // end if
                    startCell.RowSpan++;
                } // end for
            } // end else
        }

        /// <summary>
        /// 自动合并多行多列中相同信息
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnAutoGroup_Click(object sender, EventArgs e)
        {
            // 列合并
            for (int rowIndex = 0; rowIndex < GridView1.Rows.Count; rowIndex++)
            {
                TableCell preCell = GridView1.Rows[rowIndex].Cells[1];
                for (int colIndex = 2; colIndex < GridView1.Columns.Count; colIndex++)
                {
                    TableCell currCell = GridView1.Rows[rowIndex].Cells[colIndex];
                    if (currCell.Text == preCell.Text)
                    {
                        currCell.Visible = false;
                        if (preCell.ColumnSpan == 0)
                        {
                            preCell.ColumnSpan = 1;
                        } // end if
                        preCell.ColumnSpan++;
                    } // end if
                    else
                    {
                        preCell = currCell;
                    } // end else
                } // end for
            } // end for

            // 行合并
            for (int colIndex = 1; colIndex < GridView1.Columns.Count; colIndex++)
            {
                TableCell preCell = GridView1.Rows[0].Cells[colIndex];
                for (int rowIndex = 1; rowIndex < GridView1.Rows.Count; rowIndex++)
                {
                    TableCell currCell = GridView1.Rows[rowIndex].Cells[colIndex];
                    if (currCell.Text == preCell.Text)
                    {
                        currCell.Visible = false;

                        if (preCell.RowSpan == 0)
                        {
                            preCell.RowSpan = 1;
                        } // end if
                        preCell.RowSpan++;
                    } // end if
                    else
                    {
                        preCell = currCell;
                    } // end else
                } // end for
            } // end for
        }

        /// <summary>
        /// 原始状态数据
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnOrginal_Click(object sender, EventArgs e)
        {
            GetData();
            this.TextBox1.Text = tbRows.Text = tbstartCol.Text = tbendCol.Text = tbCol.Text = tbColumns.Text = tbstartRow.Text = tbendRow.Text = "";
        }
    }
}