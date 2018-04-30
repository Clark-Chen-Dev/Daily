using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 高亮显示数据行并实现双击数据行弹出新窗口
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
            }
        }

        public void BindData()
        {
            GridView1.DataSource = DBHelper.GetData("select stor_id,stor_name,stor_address,city from stores");
            GridView1.DataKeyNames = new string[] { "stor_id" };
            GridView1.DataBind();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)//判断当前操作的是否是数据行
            {
                e.Row.Attributes.Add("onMouseOver", "Color=this.style.backgroundColor;this.style.backgroundColor='lightBlue'");
                e.Row.Attributes.Add("onMouseOut", "this.style.backgroundColor=Color;");

                int count = GridView1.Rows.Count;//计算GridView控件的总行数
                string id = "";
                for (int i = 0; i <= count; i++)
                {
                    id = GridView1.DataKeys[i].Value.ToString(); //获取当前双击的行的索引值
                    e.Row.Attributes.Add("ondblclick", "javascript:var win=window.open('DisplayDetail.aspx?ID=" + id + "','商品详细页','width=450,height=200,top=176,left=161,toolbar=no,location=no,directories=no,status=no,menubar=no,resizable=no,scrollbars=yes'); win.focus()");
                }
            }
        }
    }
}