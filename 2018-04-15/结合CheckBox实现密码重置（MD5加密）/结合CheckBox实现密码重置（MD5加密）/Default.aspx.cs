using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 结合CheckBox实现密码重置_MD5加密_
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetData();
            }

            ImageButtonResetPassword.Attributes.Add("onClick", "javascript:return confirm('确定重置密码?');");
        }

        private void GetData()
        {
            GridView1.DataSource = DBHelper.GetData("SELECT Usersmr.UserID,	Usersmr.UserName,Departmentmr.DepartmentName,Rolemr.RoleName FROM Usersmr,Departmentmr,Rolemr WHERE Usersmr.DepartmentId=Departmentmr.DepartmentId AND Usersmr.RoleId=Rolemr.RoleId");
            GridView1.DataBind();
            LabelPageInfo.Text = "你所在的位置：当前是:（第" + (GridView1.PageIndex + 1).ToString() + "页/共" + GridView1.PageCount.ToString() + "页）";
        }

        protected void chkSelectAll_CheckedChanged(object sender, EventArgs e)
        {
            for (int i = 0; i <= GridView1.Rows.Count - 1; i++)
            {
                ((CheckBox)GridView1.Rows[i].FindControl("chkSelected")).Checked = this.chkSelectAll.Checked;
            }
        }

        protected void ImageButtonResetPassword_Click(object sender, ImageClickEventArgs e)
        {
            int numOfChecked = 0;
            for (int i = 0; i < this.GridView1.Rows.Count; i++)
            {
                bool isChecked = ((CheckBox)GridView1.Rows[i].FindControl("chkSelected")).Checked;
                if (isChecked)
                {
                    numOfChecked++;
                }
            }

            if (numOfChecked == 1)
            {
                for (int i = 0; i < this.GridView1.Rows.Count; i++)
                {
                    bool isChecked = ((CheckBox)GridView1.Rows[i].FindControl("chkSelected")).Checked;
                    if (isChecked)
                    {
                        string UserID = ((Label)GridView1.Rows[i].FindControl("Label1")).Text;
                        Random ran = new Random();
                        string newPassword = (ran.Next(999999).ToString().PadLeft(6, '8')); //随机生成一个密码
                        string pwdMd5 = FormsAuthentication.HashPasswordForStoringInConfigFile(newPassword, "MD5").ToString();

                        string sqlText = "UPDATE Usersmr SET UserPwd = '" + pwdMd5.ToString().Trim() + "' WHERE (UserID = " + GridView1.DataKeys[i].Value + ")";
                        if (DBHelper.ExecuteNonQuery(sqlText) > 0)//更改用户密码
                        {
                            Page.RegisterStartupScript("", "<Script>alert('" + UserID + "的密码已经重置，新密码为【" + newPassword + "】。');location='Default.aspx';</Script>");
                        }
                        else
                        {
                            Response.Write("<Script>alert('" + UserID + "重置密码失败!');location='Default.aspx';</Script>");//修改密码失败
                        }
                    }
                    else
                    {
                        isChecked = false;//取消选中
                    }
                }

            }
            else
            {
                Response.Write("<Script>alert('您只能选择一个用户!');;location='Default.aspx';</Script>");
                return;
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GetData();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (((DropDownList)e.Row.FindControl("ddlRole")) != null)
            {
                DropDownList myddlrole = (DropDownList)e.Row.FindControl("ddlRole");
                //生成 DropDownList 的值，绑定数据
                string sqlText = "SELECT Rolemr.RoleId,Rolemr.RoleName FROM Rolemr";
                myddlrole.DataSource = DBHelper.GetData(sqlText);
                myddlrole.DataTextField = "RoleName";
                myddlrole.DataValueField = "RoleId";
                myddlrole.DataBind();
            }

            if (((DropDownList)e.Row.FindControl("ddlDepartment")) != null)
            {
                DropDownList ddldepartment = (DropDownList)e.Row.FindControl("ddlDepartment");
                //生成 DropDownList 的值，绑定数据
                string sqlText = "SELECT DepartmentId,DepartmentName FROM Departmentmr";
                ddldepartment.DataSource = DBHelper.GetData(sqlText);
                ddldepartment.DataTextField = "DepartmentName";
                ddldepartment.DataValueField = "DepartmentId";
                ddldepartment.DataBind();
            }

            //执行循环，保证每条数据都可以更新
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    //当鼠标停留时更改背景色
                    e.Row.Attributes.Add("onmouseover", "c=this.style.backgroundColor;this.style.backgroundColor='Aqua'");
                    //当鼠标移开时还原背景色
                    e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=c");
                }
            }
        }
    }
}