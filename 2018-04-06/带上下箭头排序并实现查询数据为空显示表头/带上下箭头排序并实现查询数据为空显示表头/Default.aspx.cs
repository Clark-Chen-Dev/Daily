using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 带上下箭头排序并实现查询数据为空显示表头
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["sortExp"] = "订单日期";  //默认排序的字段
                ViewState["sortDir"] = "Desc";      // 字段是按什么排序的
                GetData();                             //绑定数据源
            }
        }

        private void GetData()
        {
            DataTable tbl = DBHelper.GetData("SELECT * FROM tb_OrderForm");
            DataView dv = new DataView(tbl); //定义用于排序操作的表视图
            dv.Sort = ViewState["sortExp"].ToString() + " " + ViewState["sortDir"].ToString(); //注意，此处一定要用一个空格分开
            GVpositionrecods.DataSource = dv; //将查询的表视图数据作为数据源
            GVpositionrecods.DataBind();//绑定GridView控件数据

            if (GVpositionrecods.Rows.Count > 0)//判断数据源是否为空
            {
                return; //有数据，不要处理
            }
            else//如果数据源为空
            {
                GridViewHeader();//显示表头并显示没有数据的提示信息
            }
        }

        protected void GVpositionrecods_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)//如果是表头，则执行如下操作
            {
                foreach (TableCell tc in e.Row.Cells)
                {
                    //这种方法直接新加一个控件，也可以换成图片               
                    if (tc.Controls.Count > 0)//这里要判断一下此时是不是已经生成了linkbutton
                    {
                        string s1 = ((LinkButton)tc.Controls[0]).Text;
                        //样式Webdings是都有自己对应的图片
                        ((LinkButton)tc.Controls[0]).Text = s1.Replace(s1, s1 + "<font face='Webdings'>5</font>");
                        //倒序的样式
                        if (tc.Controls.Count > 0 && tc.Controls[0].GetType().ToString() == "System.Web.UI.WebControls.DataControlLinkButton")
                        {
                            if (((LinkButton)tc.Controls[0]).CommandArgument.ToString() == ViewState["sortExp"].ToString())
                            {
                                string s2 = ((LinkButton)tc.Controls[0]).Text;
                                if (ViewState["sortDir"].ToString() == "Desc")
                                {
                                    ((LinkButton)tc.Controls[0]).Text = s2.Replace("5", "6");
                                }
                            }
                        }
                    }
                }
            }
        }

        protected void GVpositionrecods_Sorting(object sender, GridViewSortEventArgs e)
        {
            string sPage = e.SortExpression;//获得与正在排序的列关联的排序表达式
            if (ViewState["sortExp"].ToString() == sPage)//判断是否为当前的排序方式
            {
                if (ViewState["sortDir"].ToString() == "Desc")//改变当前索引
                    ViewState["sortDir"] = "ASC";
                else
                    ViewState["sortDir"] = "Desc";
            }
            else//重新设置新的排序表达式
            {
                ViewState["sortExp"] = e.SortExpression;
            }
            GetData();//重新绑定下数据
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string sqlstr = "select * from tb_OrderForm where 产品 like '%" + tbSearch.Text + "%'";
            DataTable tbl = DBHelper.GetData(sqlstr);
            GVpositionrecods.DataSource = tbl;
            GVpositionrecods.DataBind();
            if (this.GVpositionrecods.Rows.Count > 0)//判断查询数据是否为空
            {
                return;//有数据，不要处理
            }
            else//如果查询数据为空
            {
                GridViewHeader();//显示表头并显示没有数据的提示信息
            }
        }

        private void GridViewHeader()//显示表头并显示没有数据的提示信息
        {
            //表头的设置
            GridViewRow row = new GridViewRow(-1, -1, DataControlRowType.EmptyDataRow, DataControlRowState.Normal);
            foreach (DataControlField field in GVpositionrecods.Columns)
            {
                TableCell cell = new TableCell();
                cell.Text = field.HeaderText;
                cell.Width = field.HeaderStyle.Width;
                cell.Height = field.HeaderStyle.Height;
                cell.ForeColor = field.HeaderStyle.ForeColor;
                cell.Font.Size = field.HeaderStyle.Font.Size;
                cell.Font.Bold = field.HeaderStyle.Font.Bold;
                cell.Font.Name = field.HeaderStyle.Font.Name;
                cell.Font.Strikeout = field.HeaderStyle.Font.Strikeout;
                cell.Font.Underline = field.HeaderStyle.Font.Underline;
                cell.BackColor = field.HeaderStyle.BackColor;
                cell.VerticalAlign = field.HeaderStyle.VerticalAlign;
                cell.HorizontalAlign = field.HeaderStyle.HorizontalAlign;
                cell.CssClass = field.HeaderStyle.CssClass;
                cell.BorderColor = field.HeaderStyle.BorderColor;
                cell.BorderStyle = field.HeaderStyle.BorderStyle;
                cell.BorderWidth = field.HeaderStyle.BorderWidth;
                row.Cells.Add(cell);
            }
            TableItemStyle headStyle = this.GVpositionrecods.HeaderStyle;
            TableItemStyle emptyStyle = GVpositionrecods.EmptyDataRowStyle;
            emptyStyle.Width = headStyle.Width;
            emptyStyle.Height = headStyle.Height;
            emptyStyle.ForeColor = headStyle.ForeColor;
            emptyStyle.Font.Size = headStyle.Font.Size;
            emptyStyle.Font.Bold = headStyle.Font.Bold;
            emptyStyle.Font.Name = headStyle.Font.Name;
            emptyStyle.Font.Strikeout = headStyle.Font.Strikeout;
            emptyStyle.Font.Underline = headStyle.Font.Underline;
            emptyStyle.BackColor = headStyle.BackColor;
            emptyStyle.VerticalAlign = headStyle.VerticalAlign;
            emptyStyle.HorizontalAlign = headStyle.HorizontalAlign;
            emptyStyle.CssClass = headStyle.CssClass;
            emptyStyle.BorderColor = headStyle.BorderColor;
            emptyStyle.BorderStyle = headStyle.BorderStyle;
            emptyStyle.BorderWidth = headStyle.BorderWidth;
            //空白行的设置
            GridViewRow row1 = new GridViewRow(0, -1, DataControlRowType.EmptyDataRow, DataControlRowState.Normal);
            TableCell cell1 = new TableCell();
            cell1.Text = "没有相关数据可以显示！";
            cell1.BackColor = System.Drawing.Color.White;
            row1.Cells.Add(cell1);
            cell1.ColumnSpan = 6;//合并列
            if (this.GVpositionrecods.Controls.Count == 0)
            {
                GVpositionrecods.Page.Response.Write("<script language='javascript'>alert('必须在初始化表格类之前执行DataBind方法并设置EmptyDataText属性不为空!');</script>");
            }
            else
            {
                GVpositionrecods.Controls[0].Controls.Clear();
                this.GVpositionrecods.Controls[0].Controls.AddAt(0, row);
                this.GVpositionrecods.Controls[0].Controls.AddAt(1, row1);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            GetData();
        }
        protected void GVpositionrecods_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GVpositionrecods.PageIndex = e.NewPageIndex;
            GetData();
        }
    }
}