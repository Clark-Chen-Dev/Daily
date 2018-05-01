using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 使用___优化GridView控件中的超长字符显示
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.GetData();
            }
        }

        public void GetData()
        {
            this.GridView1.DataSource = DBHelper.GetData("select * from tb_inf ");
            this.GridView1.DataKeyNames = new string[] { "id" };
            this.GridView1.DataBind();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string gIntro = e.Row.Cells[3].Text;
                e.Row.Cells[3].Text = GetFirstString(gIntro, 12);
            }
        }
        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            string id = GridView1.DataKeys[e.NewSelectedIndex].Value.ToString();
            string sqlText = "update tb_inf set [check] = ~[check] where id = " + id;
            if (DBHelper.ExecuteNonQuery(sqlText) == 0)
            {
                Response.Write("<script>alert('数据更新失败');</script>");
            }
            GetData();
        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.GridView1.PageIndex = e.NewPageIndex;
            this.GetData();
        }

        /// <summary>
        /// 截取字符串优化版
        /// </summary>
        /// <param name="stringToSub">所要截取的字符串</param>
        /// <param name="length">截取字符串的长度</param>
        /// <returns></returns>
        private string GetFirstString(string stringToSub, int length)
        {
            #region
            Regex regex = new Regex("[\u4e00-\u9fa5]+", RegexOptions.Compiled);
            char[] stringChar = stringToSub.ToCharArray();
            StringBuilder sb = new StringBuilder();
            int nLength = 0;
            bool isCut = false;
            for (int i = 0; i < stringChar.Length; i++)
            {
                if (regex.IsMatch((stringChar[i]).ToString()))//regex.IsMatch指示正则表达式在输入字符串中是否找到匹配项
                {
                    sb.Append(stringChar[i]);//将信息追加到当前 StringBuilder 的结尾
                    nLength += 2;
                }
                else
                {
                    sb.Append(stringChar[i]);
                    nLength = nLength + 1;
                }
                if (nLength > length)//替换字符串
                {
                    isCut = true;
                    break;
                }
            }
            if (isCut)
                return sb.ToString() + "...";
            else
                return sb.ToString();
            #endregion
        }
    }
}