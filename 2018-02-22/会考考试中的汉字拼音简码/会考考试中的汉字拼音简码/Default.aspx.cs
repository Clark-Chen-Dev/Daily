using Microsoft.International.Converters.PinYinConverter;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace 会考考试中的汉字拼音简码
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnShow_Click(object sender, EventArgs e)
        {
            string input = InputTextBox.Text.Trim();//获取汉字字符串
            LblShow.Text = "您查询的汉字的拼音简码为：\n" + 
                new string(input.Select(chr => new ChineseChar(chr).Pinyins[0][0]).ToArray());
        }
    }
}