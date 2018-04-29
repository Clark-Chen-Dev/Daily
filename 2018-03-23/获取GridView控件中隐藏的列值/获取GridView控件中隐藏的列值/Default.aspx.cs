using System;
using System.Web.UI.WebControls;

namespace 获取GridView控件中隐藏的列值
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetData();
            }
        }

        private void GetData()
        {
            GridView1.DataSource = DBHelper.GetData("select * from tb_inf ");
            GridView1.DataBind();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GetData();
        }

        protected void btnCheck_Click(object sender, EventArgs e)
        {
            string output = String.Empty;
            Response.Write("你所选择的供求信息编号如下：" + "<br/>");

            foreach (GridViewRow row in GridView1.Rows)
            {
                bool isChecked = ((CheckBox)row.FindControl("cbChecked")).Checked;
                if (isChecked)
                {
                    int id = (int)GridView1.DataKeys[row.RowIndex].Value;
                    Response.Write(id + "<br/>");
                } // end if
            } // end foreach

            Response.Write(output);
        }
    }
}