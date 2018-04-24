using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 看看你现在是否处于人生的黄金阶段
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void tbCheck_Click(object sender, EventArgs e)
        {
            const int i = 18;                           //声明一个int类型的常量i，值为18
            const int j = 30;                           //声明一个int类型的常量j，值为30
            const int k = 50;                           //声明一个int类型的常量k，值为50
            int yourAge = 0;							//声明一个int类型的变量YouAge，值为0
            yourAge = Convert.ToInt32(this.txtAge.Text.Trim());
            if (yourAge <= i)
            {
                //如果小于等于18则输出提示信息
                ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script>alert('您的年龄还小，要努力奋斗哦')</script>");
            }
            else
            {
                if (i < yourAge && yourAge <= j)            //判断是否大于18岁小于30岁
                {
                    //如果输入的年龄大于18岁并且小于30岁则输出提示信息
                    ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('您现在的阶段正是努力奋斗的宝贵阶段！')</script>");
                }
                else
                {
                    if (j < yourAge && yourAge <= k)        //判断输入的年龄是否大于30岁小于等于50岁
                    {
                        //如果输入的年龄大于30岁而小于等于50岁则输出提示信息
                        ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('您现在的阶段正是人生的黄金阶段！')</script>");
                    }
                    else
                    {
                        //输出提示信息
                        ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('最美不过夕阳红！')</script>");
                    }
                }
            }
        }
    }
}