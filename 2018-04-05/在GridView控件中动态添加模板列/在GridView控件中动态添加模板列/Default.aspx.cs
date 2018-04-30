using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 在GridView控件中动态添加模板列
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public class GridViewTemplate : ITemplate
        {
            private DataControlRowType dcrType;
            private string columnName;

            public GridViewTemplate(DataControlRowType type, string colname)
            {
                dcrType = type;
                columnName = colname;
            }

            public void InstantiateIn(Control container)
            {
                switch (dcrType)
                {
                    case DataControlRowType.Header:
                        Literal literal = new Literal();
                        literal.Text = columnName;
                        container.Controls.Add(literal);
                        break;
                    case DataControlRowType.DataRow:
                        DropDownList ddl = new DropDownList();
                        ddl.ID = "dropdownlist";
                        ddl.AppendDataBoundItems = true;
                        ddl.Items.Add(new ListItem("-----请选择------", ""));
                        ddl.Items.Add(new ListItem("ASP.NET全能编程词典", "98"));
                        ddl.Items.Add(new ListItem("ASP.NET编程词典标准版", "368"));
                        ddl.Items.Add(new ListItem("ASP.NET编程词典珍藏版", "698"));
                        container.Controls.Add(ddl);
                        break;
                    default:
                        break;
                }
            }
        }

        ICollection CreateDataSource()
        {
            DataTable dt = new DataTable();//创建一个DataTable对象
            DataRow dr;
            //定义框架
            dt.Columns.Add(new DataColumn("id", typeof(Int32)));
            dt.Columns.Add(new DataColumn("text", typeof(string)));
            for (int i = 0; i < 6; i++)//循环遍历并添充DataTable内容
            {
                dr = dt.NewRow();
                dr[0] = i;
                dr[1] = "列表" + i.ToString();
                dt.Rows.Add(dr);
            }
            DataView dv = new DataView(dt);
            return dv;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            for (int index = 1; index < GridView1.Columns.Count; index++)
            {
                GridView1.Columns[index].Visible = false;
            }

            for (int i = 0; i < Convert.ToInt32(DropDownList1.SelectedValue); i++)
            {
                TemplateField tf = new TemplateField();
                tf.ShowHeader = true;
                tf.HeaderTemplate = new GridViewTemplate(DataControlRowType.Header, "动态添加列");
                tf.ItemTemplate = new GridViewTemplate(DataControlRowType.DataRow, "");
                GridView1.Columns.Add(tf);
                GridView1.DataSource = CreateDataSource();
                GridView1.DataBind();
            }
        }
    }
}