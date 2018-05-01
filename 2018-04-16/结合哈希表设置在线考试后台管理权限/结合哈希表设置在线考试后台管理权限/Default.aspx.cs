using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 结合哈希表设置在线考试后台管理权限
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
            DataTable tbl = DBHelper.GetData("Select top 2 * From [Rolemr] order by RoleId");
            GV.DataSource = tbl;
            GV.DataBind();

            for (int i = 0; i < tbl.Rows.Count; i++)
            {
                // 部门管理
                if (Convert.ToInt32(tbl.Rows[i]["HasDuty_DepartmentManage"]) == 1)
                {
                    ((CheckBox)GV.Rows[i].FindControl("chkDepartmentManage")).Checked = true;
                } // end if

                //用户管理
                if (Convert.ToInt32(tbl.Rows[i]["HasDuty_UserManage"]) == 1)
                {
                    ((CheckBox)GV.Rows[i].FindControl("chkUserManage")).Checked = true;
                } // end if

                //考试科目管理
                if (Convert.ToInt32(tbl.Rows[i]["HasDuty_CourseManage"]) == 1)
                {
                    ((CheckBox)GV.Rows[i].FindControl("chkCourseManage")).Checked = true;
                } // end if

                //试卷制定维护
                if (Convert.ToInt32(tbl.Rows[i]["HasDuty_PaperSetup"]) == 1)
                {
                    ((CheckBox)GV.Rows[i].FindControl("chkPaperSetup")).Checked = true;
                } // end if

                //用户试卷管理
                if (Convert.ToInt32(tbl.Rows[i]["HasDuty_UserPaperList"]) == 1)
                {
                    ((CheckBox)GV.Rows[i].FindControl("chkUserPaperList")).Checked = true;
                } // end if

                //试题类别管理
                if (Convert.ToInt32(tbl.Rows[i]["HasDuty_SingleSelectManage"]) == 1)
                {
                    ((CheckBox)GV.Rows[i].FindControl("chkTypeManage")).Checked = true;
                } // end if
            }
        }

        protected void GV_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GV.PageIndex = e.NewPageIndex;
            GetData();
        }

        protected void ImageButtonGiant_Click(object sender, ImageClickEventArgs e)
        {
            //定义一个哈希表ht
            Hashtable ht = new Hashtable();
            string where = "";
            //应用foreach循环GridView控件中的CheckBox控件
            foreach (GridViewRow row in GV.Rows)
            {
                //先清空下哈希表中的数据
                ht.Clear();
                //应用FindControl方法查找GridView控件中CheckBox控件,并判断是否选中了种用户权限
                ht.Add("HasDuty_DepartmentManage", ((CheckBox)row.FindControl("chkDepartmentManage")).Checked == true ? 1 : 0);
                ht.Add("HasDuty_UserManage", ((CheckBox)row.FindControl("chkUserManage")).Checked == true ? 1 : 0);
                ht.Add("HasDuty_RoleManage", ((CheckBox)row.FindControl("chkUserManage")).Checked == true ? 1 : 0);
                ht.Add("HasDuty_Role", ((CheckBox)row.FindControl("chkUserManage")).Checked == true ? 1 : 0);
                ht.Add("HasDuty_CourseManage", ((CheckBox)row.FindControl("chkCourseManage")).Checked == true ? 1 : 0);
                ht.Add("HasDuty_PaperSetup", ((CheckBox)row.FindControl("chkPaperSetup")).Checked == true ? 1 : 0);
                ht.Add("HasDuty_PaperLists", ((CheckBox)row.FindControl("chkPaperSetup")).Checked == true ? 1 : 0);
                ht.Add("HasDuty_UserPaperList", ((CheckBox)row.FindControl("chkUserPaperList")).Checked == true ? 1 : 0);
                ht.Add("HasDuty_UserScore", ((CheckBox)row.FindControl("chkUserPaperList")).Checked == true ? 1 : 0);
                ht.Add("HasDuty_SingleSelectManage", ((CheckBox)row.FindControl("chkTypeManage")).Checked == true ? 1 : 0);
                ht.Add("HasDuty_MultiSelectManage", ((CheckBox)row.FindControl("chkTypeManage")).Checked == true ? 1 : 0);
                ht.Add("HasDuty_FillBlankManage", ((CheckBox)row.FindControl("chkTypeManage")).Checked == true ? 1 : 0);
                ht.Add("HasDuty_JudgeManage", ((CheckBox)row.FindControl("chkTypeManage")).Checked == true ? 1 : 0);
                ht.Add("HasDuty_QuestionManage", ((CheckBox)row.FindControl("chkTypeManage")).Checked == true ? 1 : 0);
                //定义一个查询的条件语句
                where = " Where RoleId=" + row.Cells[0].Text;
                //调用公共类中的Update方法修改角色权限信息
                Update(ht, where);
                Response.Write("<script>alert('授权成功！')</script>");
            }
        }

        protected void GV_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            int i;
            //执行循环，保证每条数据都可以更新
            for (i = 0; i < GV.Rows.Count; i++)
            {
                //首先判断是否是数据行
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    //当鼠标停留时更改背景色
                    e.Row.Attributes.Add("onmouseover", "c=this.style.backgroundColor;this.style.backgroundColor='Aqua'");
                    //当鼠标移开时还原背景色
                    e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=c");
                }
            }
        }

        /// <summary>
        /// 公有方法，更新一个数据表。
        /// </summary>
        /// <param name="TableName">表名</param>
        /// <param name="Cols">哈西表，键值为字段名，值为字段值</param>
        /// <param name="Where">Where子句</param>
        /// <returns>是否成功</returns>
        private bool Update(String TableName, Hashtable Cols, String Where)
        {
            int Count = 0;
            if (Cols.Count <= 0)
            {
                return true;
            }
            String Fields = " ";
            foreach (DictionaryEntry item in Cols)
            {
                if (Count != 0)
                {
                    Fields += ",";
                }
                Fields += "[" + item.Key.ToString() + "]";
                Fields += "=";
                Fields += item.Value.ToString();
                Count++;
            }
            Fields += " ";

            String SqlString = "Update " + TableName + " Set " + Fields + Where;

            return DBHelper.ExecuteNonQuery(SqlString) > 0 ? true : false;
        }

        public void Update(Hashtable roleInfo, string where)
        {
            Update("[Rolemr]", roleInfo, where);    //利用Database类的Update方法修改数据
        }
    }
}