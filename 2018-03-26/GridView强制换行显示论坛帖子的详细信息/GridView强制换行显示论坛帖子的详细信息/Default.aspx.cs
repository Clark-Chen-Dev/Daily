using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GridView强制换行显示论坛帖子的详细信息
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //正常换行,normal为默认情况，英文单词不被拆开
            //GridView1.Attributes.Add("style", "word-break:keep-all;word-wrap:normal");
            //一般换行，此方法可解决长串英文单词被断开，但会导致普通英文语句中的单词被断开
            //GridView1.Attributes.Add("style", "word-wrap:break-word;word-break:break-all");
            //最佳换行方案
            GridView1.Attributes.Add("style", "word-wrap:break-word;overflow:hidden");

            if (!IsPostBack)
            {
                GridView1.DataSource = DBHelper.GetData("select * from tb_Card") ;
                GridView1.DataBind();
            }
        }
    }
}