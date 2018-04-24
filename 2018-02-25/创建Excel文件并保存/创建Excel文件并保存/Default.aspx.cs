using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Excel = Microsoft.Office.Interop.Excel;
using System.Reflection;
using System.Runtime.InteropServices;
using System.Diagnostics;
using System.Threading;

namespace 创建Excel文件并保存
{
    public partial class Default : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TxtSavePath.Text = Server.MapPath("~/File"); //初始化文件保存路径
            }

        }

        [DllImport("User32.dll", CharSet = CharSet.Auto)]
        public static extern int GetWindowThreadProcessId(IntPtr hwnd, out int ID);

        protected void BtnCreate_Click(object sender, EventArgs e)
        {
            const int OLDOFFICEVESION = -4143; 
            const int NEWOFFICEVESION = 56;

            string filePath = TxtSavePath.Text;
            //保存excel文件的格式
            int formatNum;
            //excel版本号
            string version;
            //启动应用
            Excel.Application excelApp = new Excel.Application(); // 创建Excel对象
            Excel.Workbook newWorkbook = excelApp.Workbooks.Add(Excel.XlWBATemplate.xlWBATWorksheet); //创建工作簿
            Excel.Worksheet newWorksheet = (Excel.Worksheet)newWorkbook.Worksheets.Add( 
                Type.Missing, Type.Missing, Type.Missing, Type.Missing);  //创建工作表

            // Excel对象的Cells属性的行索引和列索引都从1开始。
            newWorksheet.Cells[1, 1] = "列1";
            newWorksheet.Cells[2, 1] = "内容1";

            //获取你使用的excel 的版本号
            version = excelApp.Version;

            //使用Excel 97-2003
            if (Convert.ToDouble(version) < 12)
            {
                formatNum = OLDOFFICEVESION;
            }
            //使用excel 2007或者更新
            else
            {
                formatNum = NEWOFFICEVESION;
            }

            string exportExcel = filePath + (filePath.EndsWith("\\") ? "" : "\\") +
                DateTime.Now.ToString("yyyy-MM-dd HHmmss") + ".xls";
            newWorkbook.SaveAs(exportExcel, formatNum);//保存Excel文件

            newWorkbook.Close(Type.Missing, Type.Missing, Type.Missing);
            excelApp.Quit();  //应用程序退出，但是进程还在运行

            #region 停止Excel进程
            IntPtr excelIntPtr = new IntPtr(excelApp.Hwnd);
            int excelPId = 0;
            GetWindowThreadProcessId(excelIntPtr, out excelPId);
            Process excelProcess = Process.GetProcessById(excelPId);
            excelProcess.Kill();
            #endregion

            Response.Write("<script>alert('Excel文件创建成功');</script>"); // 弹出提示信息
        }
    }
}