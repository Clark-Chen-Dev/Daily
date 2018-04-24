using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SearchPages
{
    public partial class SearchPagesForm : Form
    {
        private WebBrowser webBrowser = new WebBrowser();
        private int startPageNo;
        private int endPageNo;
        private string searchText;
        private List<string> urls;
        private string queryHtmlPrefix = string.Empty;

        public SearchPagesForm()
        {
            InitializeComponent();
            webBrowser.DocumentCompleted += WebBrowser_DocumentCompleted;
        }

        private void WebBrowser_DocumentCompleted(object sender, WebBrowserDocumentCompletedEventArgs e)
        {
            bool found = false;
            string bodyInnerHtml = webBrowser.Document.Body.InnerText;
            WebBrowser wb = (WebBrowser)sender;
            Regex searchRegex = null;
          
            if (searchText.StartsWith("regex:")) // 查找模式为正则表达式
            {
                searchRegex = new Regex(searchText.Substring(6), RegexOptions.IgnoreCase);
                Match madeMade = searchRegex.Match(bodyInnerHtml);
                if (madeMade.Success)
                {
                    found = true;
                    outputTextBox.AppendText(wb.Url + Environment.NewLine);
                }
            }
            else
            {
                if (bodyInnerHtml.IndexOf(searchText) != -1)
                {
                    found = true;
                    outputTextBox.AppendText(wb.Url + Environment.NewLine);
                }
            }

            if (!found)
            {
                if (--endPageNo >= startPageNo)
                {
                    webBrowser.Navigate(queryHtmlPrefix + endPageNo);
                    Console.WriteLine(queryHtmlPrefix + endPageNo);
                }
                else
                {
                    MessageBox.Show("未找到： \"" + searchText + "\"");
                }
                
            }
        }

        private void goButton_Click(object sender, EventArgs e)
        {
            urls = new List<string>();
            outputTextBox.Clear();
            startPageNo = 0;
            endPageNo = 0;
            
            queryHtmlPrefix = ConfigurationManager.AppSettings["Website"] +
                queryHtmlPrefixTextBox.Text.Trim(); // 获取查询的html前缀
            if (queryHtmlPrefix == string.Empty)
            {
                MessageBox.Show("Please input query html.", "Message", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }

            startPageNo = startPageTextBox.Text.Trim() != string.Empty ? 
                Convert.ToInt32(startPageTextBox.Text.Trim()) : 0; // 获取查询的html的起始页
            endPageNo = endPageTextBox.Text.Trim() != string.Empty ? 
                Convert.ToInt32(endPageTextBox.Text.Trim()): 0; // 获取查询的html终止页

            searchText = searchTextTextBox.Text.Trim(); // 获取查询文本
            if (startPageNo == 0 && endPageNo == 0)
            {
                webBrowser.Navigate(queryHtmlPrefix);
            }
            else
            {
                webBrowser.Navigate(queryHtmlPrefix + endPageNo);
            }
        }
    }
}
