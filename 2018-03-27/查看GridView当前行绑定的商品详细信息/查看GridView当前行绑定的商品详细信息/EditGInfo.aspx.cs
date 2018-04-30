using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 查看GridView当前行绑定的商品详细信息
{
    public partial class EditGInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string strid = Page.Request.QueryString["GoodsID"];//接收页面传值
                DataTable tbl = DBHelper.GetData("select * from tbPicture where PicId='" + strid + "'");
                txtGID.Text = Convert.ToString(tbl.Rows[0]["PicId"]);
                txtGName.Text = Convert.ToString(tbl.Rows[0]["PicName"]);
                txtGType.Text = Convert.ToString(tbl.Rows[0]["PicType"]);
                txtGStore.Text = Convert.ToString(tbl.Rows[0]["GoodsStock"]);
                txtGPrice.Text = Convert.ToString(tbl.Rows[0]["SellNumber"]);
                txtGIntro.Text = Convert.ToString(tbl.Rows[0]["PicName"]) + "…";
                iGPhoto.ImageUrl = Convert.ToString(tbl.Rows[0]["PicPath"]);
            }
        }
    }
}