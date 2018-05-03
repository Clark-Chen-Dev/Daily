using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NestedGridView
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                gvCustomers.DataSource = DBHelper.GetData("select top 10 * from Customers");
                gvCustomers.DataBind();
            }
        }

        protected void Show_Hide_ChildGrid(object sender, ImageClickEventArgs e)
        {
            ImageButton imgShowHide = (sender as ImageButton);
            GridViewRow row = (imgShowHide.NamingContainer as GridViewRow);
            if (imgShowHide.CommandArgument == "Show")
            {
                row.FindControl("pnlOrders").Visible = true;
                imgShowHide.CommandArgument = "Hide";
                imgShowHide.ImageUrl = "~/images/minus.png";
                string customerId = gvCustomers.DataKeys[row.RowIndex].Value.ToString();
                GridView gvOrders = row.FindControl("gvOrders") as GridView;
                gvOrders.ToolTip = customerId;
                GetOrders(gvOrders, gvOrders.ToolTip);
            } // end if
            else
            {
                row.FindControl("pnlOrders").Visible = false;
                imgShowHide.CommandArgument = "Show";
                imgShowHide.ImageUrl = "~/images/plus.png";
            } // end else
        }

        protected void OnChildGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView gvOrders = (sender as GridView);
            gvOrders.PageIndex = e.NewPageIndex;
            GetOrders(gvOrders, gvOrders.ToolTip);
        }

        private void GetOrders(GridView orderGv, string custId)
        {
            orderGv.DataSource = DBHelper.GetData(string.Format("select * from Orders where CustomerId='{0}'", custId));
            orderGv.DataBind();
        }
    }
}