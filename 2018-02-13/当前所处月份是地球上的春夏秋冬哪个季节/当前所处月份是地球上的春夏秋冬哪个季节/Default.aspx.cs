using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 当前所处月份是地球上的春夏秋冬哪个季节
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            if (!Regex.IsMatch(txtmonth.Text.Trim(), @"^\+?[1-9][0-9]*$"))  //判断输入的是否是大于0的数字
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script>alert('请输入数字！');</script>");//弹出提示信息
                //Response.Write("<script>alert('请输入数字！');</script>");
            }
            else
            {
                if (Convert.ToInt32(txtmonth.Text.Trim()) >= 1 && Convert.ToInt32(txtmonth.Text.Trim()) <= 12)
                {
                    string season = string.Empty;
                    int month = Convert.ToInt32(txtmonth.Text.Trim());
                    switch (month)
                    {
                        case 12:
                        case 1:
                        case 2:
                            season = "冬季"; break;
                        case 3:
                        case 4:
                        case 5:
                            season = "春季"; break;
                        case 6:
                        case 7:
                        case 8:
                            season = "夏季"; break;
                        case 9:
                        case 10:
                        case 11:
                            season = "秋季"; break;
                        default:
                            season = "不存在"; break;
                    }
                    txtShow.Text = season;//根据输入的当前月份查询出相应的季节
                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script>alert('您输入的月份错误，请重新输入');</script>");
                }
            }
        }
    }
}