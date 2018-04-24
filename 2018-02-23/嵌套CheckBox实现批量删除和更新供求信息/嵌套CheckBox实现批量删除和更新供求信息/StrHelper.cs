using System.Text;
//引入如下命名空间
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI.WebControls;

/// <summary>
///StrHelper 的摘要说明
/// </summary>
public class StrHelper
{
	public StrHelper(){}
    /// <summary>
    /// 截取字符串函数
    /// </summary>
    /// <param name="str">所要截取的字符串</param>
    /// <param name="num">截取字符串的长度</param>
    /// <returns></returns>
    static public string GetSubString(string str, int num)
    {
        #region
        return (str.Length > num) ? str.Substring(0, num) + "..." : str;
        #endregion
    }
    /// <summary>
    /// 截取字符串优化版
    /// </summary>
    /// <param name="stringToSub">所要截取的字符串</param>
    /// <param name="length">截取字符串的长度</param>
    /// <returns></returns>
    public static string GetFirstString(string stringToSub, int length)
    {
        #region
        Regex regex = new Regex("[\u4e00-\u9fa5]+", RegexOptions.Compiled);
        char[] stringChar = stringToSub.ToCharArray();
        StringBuilder sb = new StringBuilder();
        int nLength = 0;
        bool isCut = false;
        for (int i = 0; i < stringChar.Length; i++)
        {
            if (regex.IsMatch((stringChar[i]).ToString()))//regex.IsMatch指示正则表达式在输入字符串中是否找到匹配项
            {
                sb.Append(stringChar[i]);//将信息追加到当前 StringBuilder 的结尾
                nLength += 2;
            }
            else
            {
                sb.Append(stringChar[i]);
                nLength = nLength + 1;
            }
            if (nLength > length)//替换字符串
            {
                isCut = true;
                break;
            }
        }
        if (isCut)
            return sb.ToString() + "...";
        else
            return sb.ToString();
        #endregion
    }
    /// 弹出JavaScript小窗口
    /// </summary>
    /// <param name="js">窗口信息</param>
    public static void Alert(string message)
    {
        #region
        string js = @"<Script type='text/javascript'>
                    alert('" + message + "');</Script>";
        HttpContext.Current.Response.Write(js);

        #endregion
    }
    public static void GridViewHeader(GridView gdv)//显示表头并显示没有数据的提示信息
    {
        //表头的设置
        GridViewRow row = new GridViewRow(-1, -1, DataControlRowType.EmptyDataRow, DataControlRowState.Normal);
        foreach (DataControlField field in gdv.Columns)
        {
            TableCell cell = new TableCell();
            cell.Text = field.HeaderText;
            cell.Width = field.HeaderStyle.Width;
            cell.Height = field.HeaderStyle.Height;
            cell.ForeColor = field.HeaderStyle.ForeColor;
            cell.Font.Size = field.HeaderStyle.Font.Size;
            cell.Font.Bold = field.HeaderStyle.Font.Bold;
            cell.Font.Name = field.HeaderStyle.Font.Name;
            cell.Font.Strikeout = field.HeaderStyle.Font.Strikeout;
            cell.Font.Underline = field.HeaderStyle.Font.Underline;
            cell.BackColor = field.HeaderStyle.BackColor;
            cell.VerticalAlign = field.HeaderStyle.VerticalAlign;
            cell.HorizontalAlign = field.HeaderStyle.HorizontalAlign;
            cell.CssClass = field.HeaderStyle.CssClass;
            cell.BorderColor = field.HeaderStyle.BorderColor;
            cell.BorderStyle = field.HeaderStyle.BorderStyle;
            cell.BorderWidth = field.HeaderStyle.BorderWidth;
            row.Cells.Add(cell);
        }
        TableItemStyle headStyle = gdv.HeaderStyle;
        TableItemStyle emptyStyle = gdv.EmptyDataRowStyle;
        emptyStyle.Width = headStyle.Width;
        emptyStyle.Height = headStyle.Height;
        emptyStyle.ForeColor = headStyle.ForeColor;
        emptyStyle.Font.Size = headStyle.Font.Size;
        emptyStyle.Font.Bold = headStyle.Font.Bold;
        emptyStyle.Font.Name = headStyle.Font.Name;
        emptyStyle.Font.Strikeout = headStyle.Font.Strikeout;
        emptyStyle.Font.Underline = headStyle.Font.Underline;
        emptyStyle.BackColor = headStyle.BackColor;
        emptyStyle.VerticalAlign = headStyle.VerticalAlign;
        emptyStyle.HorizontalAlign = headStyle.HorizontalAlign;
        emptyStyle.CssClass = headStyle.CssClass;
        emptyStyle.BorderColor = headStyle.BorderColor;
        emptyStyle.BorderStyle = headStyle.BorderStyle;
        emptyStyle.BorderWidth = headStyle.BorderWidth;
        //空白行的设置
        GridViewRow row1 = new GridViewRow(0, -1, DataControlRowType.EmptyDataRow, DataControlRowState.Normal);
        TableCell cell1 = new TableCell();
        cell1.Text = "没有相关数据可以显示！";
        cell1.BackColor = System.Drawing.Color.White;
        row1.Cells.Add(cell1);
        cell1.ColumnSpan = 6;//合并列
        if (gdv.Controls.Count == 0)
        {
            gdv.Page.Response.Write("<script type='text/javascript'>alert('必须在初始化表格类之前执行DataBind方法并设置EmptyDataText属性不为空!');</script>");
        }
        else
        {
            gdv.Controls[0].Controls.Clear();
            gdv.Controls[0].Controls.AddAt(0, row);
            gdv.Controls[0].Controls.AddAt(1, row1);
        }
    }
}
