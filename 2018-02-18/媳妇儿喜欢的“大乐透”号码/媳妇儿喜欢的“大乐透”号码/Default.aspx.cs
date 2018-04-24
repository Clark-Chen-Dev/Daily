using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 媳妇儿喜欢的_大乐透_号码
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int[] lottos = { 01, 05, 08, 10, 17, 21, 26, 28 };//定义大乐透号码的数组
            foreach (int lotto in lottos)//在网页中输出大乐透号码
            {
                Response.Write("大乐透号码为："+lotto+"<br />");
            }
            Response.Write("小号开的乐透号码为：" + lottos[2] + ""); 
        }
    }
}