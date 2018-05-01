using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 一次性编辑GridView控件的所有行中的数据
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                GetData();
            }
        }

        private void GetData()
        {
            GridView1.DataSource = DBHelper.GetData("select * from tb_mrEmp");
            GridView1.DataBind();
        }



        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GetData();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            StringBuilder query = new StringBuilder();//动态字符串类StringBuilder
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                GridViewRow row = GridView1.Rows[i];
                string value1 = ((TextBox)row.Cells[1].FindControl("txtName")).Text.Replace("'", "''");
                string value2 = ((TextBox)row.Cells[2].FindControl("txtSex")).Text.Replace("'", "''");
                string value3 = ((TextBox)row.Cells[3].FindControl("txtState")).Text.Replace("'", "''");
                string value4 = ((TextBox)row.Cells[4].FindControl("txtPhone")).Text.Replace("'", "''");
                string value5 = ((TextBox)row.Cells[5].FindControl("txtAddress")).Text.Replace("'", "''");
                string value = GridView1.DataKeys[i].Value.ToString();
                query.Append("UPDATE [tb_mrEmp] SET [au_lname] = '")//追加字符串
                    .Append(value1).Append("' , [sex] = '")
                    .Append(value2).Append("' , [state] = '")
                    .Append(value3).Append("' , [phone] = '")
                    .Append(value4).Append("' , [address] = '")
                    .Append(value5).Append("' WHERE [ID] = '")
                    .Append(value).Append("';\n");
            }

            if (DBHelper.ExecuteNonQuery(query.ToString()) > 0)
            {
                Response.Write("<script>alert('一次修改数据成功！')</script>");
            } // end if
            else
            {
                Response.Write("<script>alert('一次修改数据失败！')</script>");
            }

            GetData();
        }
    }
}