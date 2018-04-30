using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 结合分页模板PagerTemplate实现自定义分页
{
    public partial class Default : System.Web.UI.Page
    {
        int rowCount = 0;//用来记录总记录数

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                GetData();
        }

        private void GetData()
        {
            DataTable tbl = DBHelper.GetData("SELECT * FROM tb_OrderForm");
            rowCount = tbl.Rows.Count;
            GridView1.DataSource = tbl;
            GridView1.DataBind();
        }

        protected void NavigateToPage(object sender, CommandEventArgs e)
        {
            switch (e.CommandArgument.ToString())//控制转页
            {
                case "First"://首页
                    this.GridView1.PageIndex = 0;
                    break;
                case "Prev"://上一页
                    if (this.GridView1.PageIndex > 0)
                        this.GridView1.PageIndex -= 1;
                    break;
                case "Next"://下一页
                    if (this.GridView1.PageIndex < (this.GridView1.PageCount - 1))
                        this.GridView1.PageIndex += 1;
                    break;
                case "Last"://尾页
                    this.GridView1.PageIndex = this.GridView1.PageCount - 1;
                    break;
            }
            GetData();
        }

        protected void GridView1_DataBound(object sender, EventArgs e)
        {
            GridViewRow pagerRow = GridView1.BottomPagerRow;
            //获取Label实例，显示页次信息
            Label lblCurrent = (Label)pagerRow.Cells[0].FindControl("lblPageCurrent");
            Label lblCount = (Label)pagerRow.Cells[0].FindControl("lblPageCount");
            Label lblRow = (Label)pagerRow.Cells[0].FindControl("lblPageRow");
            //获取按钮实例，为了控制其是否可用
            LinkButton btnFirstTem = (LinkButton)pagerRow.Cells[0].FindControl("btnFirst");
            LinkButton btnPrevTem = (LinkButton)pagerRow.Cells[0].FindControl("btnPrev");
            LinkButton btnNextTem = (LinkButton)pagerRow.Cells[0].FindControl("btnNext");
            LinkButton btnLastTem = (LinkButton)pagerRow.Cells[0].FindControl("btnLast");
            if (lblCurrent != null)
                lblCurrent.Text = (this.GridView1.PageIndex + 1).ToString();
            if (lblCount != null)
                lblCount.Text = this.GridView1.PageCount.ToString();
            if (lblRow != null)
                lblRow.Text = rowCount.ToString();
            if (this.GridView1.PageIndex == 0)
            {
                btnFirstTem.Enabled = false;
                btnPrevTem.Enabled = false;
                //只有一页，所有分页按钮不可用
                if (this.GridView1.PageCount == 1)
                {
                    btnNextTem.Enabled = false;
                    btnLastTem.Enabled = false;
                }
            }
            else if (this.GridView1.PageIndex == (this.GridView1.PageCount - 1))
            {
                btnNextTem.Enabled = false;
                btnLastTem.Enabled = false;
            }
        }
    }
}