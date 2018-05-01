using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 一次性编辑GridView控件的所有行中的数据
{
    public partial class Default2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                GridViewRow row = GridView1.Rows[i];
                SqlDataSource1.UpdateParameters[0].DefaultValue = ((TextBox)row.Cells[0].FindControl("txtName")).Text;
                SqlDataSource1.UpdateParameters[1].DefaultValue = ((TextBox)row.Cells[1].FindControl("txtSex")).Text;
                SqlDataSource1.UpdateParameters[2].DefaultValue = ((TextBox)row.Cells[1].FindControl("txtState")).Text;
                SqlDataSource1.UpdateParameters[3].DefaultValue = ((TextBox)row.Cells[1].FindControl("txtPhone")).Text;
                SqlDataSource1.UpdateParameters[4].DefaultValue = ((TextBox)row.Cells[1].FindControl("txtAddress")).Text;
                SqlDataSource1.UpdateParameters[5].DefaultValue = GridView1.DataKeys[i].Value.ToString();
                SqlDataSource1.Update();
            }
        }
    }
}