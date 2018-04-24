using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 我的_双色球_从小到大的排序号码
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Write("对以下双色球号码：1, 5, 8, 17, 21, 10, 26进行排序<br/>");
            int[] sum = { 1, 5, 8, 17, 21, 10, 26 };
            int[] sortedSum =sum.OrderBy(n => n).ToArray();

            Response.Write("排序后的结果如下：" + "<br/>");
            foreach (int n in sortedSum)
            {
                Response.Write("开出的双色球号码：" + n.ToString() + "<br/>");
            }
        }
    }
}