using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Eval绑定图书图片并实现单击图片进行链接
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetData();
            } // end if
        }

        private void GetData()
        {
            DataTable tbl = DBHelper.GetData("select * from tbPicture");
            Repeater1.DataSource = tbl;
            Repeater1.DataBind();
        }

        protected void Repeater1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            Repeater1.PageIndex = e.NewPageIndex;
            GetData();
        }
    }
}