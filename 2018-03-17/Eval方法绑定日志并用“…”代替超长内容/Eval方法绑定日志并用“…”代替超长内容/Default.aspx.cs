using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Eval方法绑定日志并用___代替超长内容
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable tbl = DBHelper.GetData("select  * from tb_OrderForm");
                ArtDetailList.DataSource = tbl;
                ArtDetailList.DataBind();
            } // end if
        }
    }
}