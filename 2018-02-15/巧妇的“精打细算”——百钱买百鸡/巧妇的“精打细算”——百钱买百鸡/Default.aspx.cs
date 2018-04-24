using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 巧妇的_精打细算___百钱买百鸡
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            const int totalChicken = 100;//100只鸡
            const int totalMoney = 100;  //100文钱
            const int xMoney = 5;        //公鸡每只5文钱
            const int yMoney = 3;        //母鸡每只3文钱
            const int zMoney = 1;        //定义买小鸡的1文钱
            const int zNumber = 3;       //1文钱要买3只小鸡
            for (int x = 0; x <= totalChicken; x++)
            {
                for (int y = 0; y <= totalChicken; y++)
                {
                    int z = totalChicken - x - y;  //计算小鸡的数量
                    if (z % zNumber == 0) continue;//小鸡的数量是3的倍数才可能是正确答案
                    z /= zNumber;
                    int sumNumber = x * xMoney + y * yMoney + z * zMoney;
                    if (sumNumber == totalMoney)
                    {
                        Response.Write("公鸡数量是" + x.ToString() + "只,母鸡数量是" + y.ToString() + "只,小鸡的数量是" + (z * zNumber).ToString() + "只<br/>");
                    }
                }
            }
        }
    }
}