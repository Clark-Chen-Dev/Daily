using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 明日科技编程全能词典种类及其价格
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string[,] strs = new string[5, 2] { { "ASP.NET编程词典:", "全能版98元" }, { "C#编程词典:", "全能版98元" }, { "JAVA编程词典:", "全能版98元" }, { "VB编程词典:", "全能版98元" }, { "VC编程词典:", "全能版98元" } };

            for (int i = 0; i < strs.GetLength(0); i++)
            {
                for (int j = 0; j < strs.GetLength(1)-1; j++)
                {
                    Response.Write(strs[i,j]+"<br />"+ strs[i, j+1] + "<br />");
                }
            }
        }
    }
}