using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 将GridView控件的数据导出到Excel并进行格式化
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DisplayData();
            }
        }

        private void DisplayData()
        {
            GridView1.DataSource = GetData();
            GridView1.DataBind();
        }

        private DataTable GetData()
        {
            string connStr = WebConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlDataAdapter adapter = new SqlDataAdapter(
                "select top 10 GoodsID as 商品ID,GoodsName as 商品名称,GoodsIntroduce as 商品介绍,GoodsPrice as 商品价格 from tb_GoodsInfo", 
                connStr);
            DataTable tbl = new DataTable();
            adapter.Fill(tbl);
            return tbl;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // 版本1
            //Export("application/ms-excel", "商品信息表.xls");

            //*****************************************
            #region 版本2
            string filePath = Server.MapPath("~/Files/");
            string fileName = string.Format("商品信息表{0}.xls", DateTime.Now.ToString("yyyyMMddHHmmss"));
            string exportExcel = Path.Combine(filePath, fileName);
            DataTable dt = GetData();
            NPOIExcel excel = new NPOIExcel("商品信息表", "商品信息", exportExcel);
            excel.ToExcel(dt);
            Response.AddHeader("Content-Disposition", "attachment;filename=" +
                HttpUtility.UrlEncode(fileName, Encoding.UTF8).ToString());
            Response.WriteFile(exportExcel);
            Response.End(); 
            #endregion
        }
        private void Export(string FileType, string FileName)
        {
            Response.Charset = "GB2312";
            Response.ContentEncoding = System.Text.Encoding.UTF8;
            Response.AppendHeader("Content-Disposition", "attachment;filename=" +
                HttpUtility.UrlEncode(FileName, Encoding.UTF8).ToString());
            Response.ContentType = FileType;
            this.EnableViewState = false;
            StringWriter tw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(tw);
            GridView1.RenderControl(hw);
            Response.Write(tw.ToString());
            Response.End();
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[3].Attributes.Add("style", "vnd.ms-excel.numberformat:￥#,###.00");
            }
        }
    }
}