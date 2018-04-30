using System;
using System.Data;
using System.Web.UI;

namespace 高亮显示数据行并实现双击数据行弹出新窗口
{
    public partial class DisplayDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string ID = Page.Request.QueryString["ID"];
            DataTable tbl = DBHelper.GetData("select * from stores where stor_id='" + ID + "'");
            txtGID.Text = Convert.ToString(tbl.Rows[0]["stor_id"]);
            txtGName.Text = Convert.ToString(tbl.Rows[0]["stor_name"]);
            txtGType.Text = Convert.ToString(tbl.Rows[0]["stor_address"]);
        }
    }
}