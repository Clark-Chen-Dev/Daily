using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Eval绑定图书图片并实现单击图片进行链接
{
    public partial class DisplayDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request["id"];
            DataTable tbl = DBHelper.GetData("select * from tbPicture where PicId='" + id + "'");
            txtGID.Text = tbl.Rows[0]["PicId"].ToString();
            txtGName.Text = tbl.Rows[0]["PicName"].ToString();
            txtGType.Text = tbl.Rows[0]["PicType"].ToString(); 
            iGPhoto.ImageUrl = tbl.Rows[0]["PicPath"].ToString(); 
        }
    }
}