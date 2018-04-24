using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 浓浓思乡之情__李白的_静夜思_
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //创建并初始化一个三维数组
            string[,,] strs = new string[,,] { { { "李白", "《静夜思》", "<br><br>" } }, { { "床前明日光，", "<br>", "疑是地上霜。<br>" } }, { { "举头望明月，", "<br>", "低头思故乡。" } } };
            foreach (var str in strs)
            {
                Response.Write(str);
            }
        }
    }
}