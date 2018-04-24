using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace RegexMetaChrsReplace
{
    public partial class MetaChrsReplaceForm : Form
    {
        private Regex metaRegex = new Regex(@"\$|\(|\)|\*|\+|\.|\?|\[|\\|\]|\^|\{|\||\}");
        public MetaChrsReplaceForm()
        {
            InitializeComponent();
        }

        private void escapeButton_Click(object sender, EventArgs e)
        {
            Escape(inputTextBox.Text.Trim());
        }

        private void Escape(string input)
        {
            if (input != string.Empty)
            {
                inputTextBox.Clear();
                outputTextBox.Text = metaRegex.Replace(input, @"\$0");
                outputTextBox.SelectAll();
                outputTextBox.Copy();
                
            } // end if
        }

        private void escapeTimer_Tick(object sender, EventArgs e)
        {
            Escape(inputTextBox.Text.Trim());
        }

        private void MetaChrsReplaceForm_Load(object sender, EventArgs e)
        {
            escapeTimer.Interval = 500;//设置计时器间隔为1000毫秒
            escapeTimer.Start();//启动计时器
        }
    }
}
