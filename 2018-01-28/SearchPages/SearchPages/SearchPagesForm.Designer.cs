namespace SearchPages
{
    partial class SearchPagesForm
    {
        /// <summary>
        /// 必需的设计器变量。
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// 清理所有正在使用的资源。
        /// </summary>
        /// <param name="disposing">如果应释放托管资源，为 true；否则为 false。</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows 窗体设计器生成的代码

        /// <summary>
        /// 设计器支持所需的方法 - 不要修改
        /// 使用代码编辑器修改此方法的内容。
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(SearchPagesForm));
            this.EndPageLabel = new System.Windows.Forms.Label();
            this.startPageLabel = new System.Windows.Forms.Label();
            this.endPageTextBox = new System.Windows.Forms.TextBox();
            this.startPageTextBox = new System.Windows.Forms.TextBox();
            this.queryHtmlPrefixlabel = new System.Windows.Forms.Label();
            this.queryHtmlPrefixTextBox = new System.Windows.Forms.TextBox();
            this.searchTextTextBox = new System.Windows.Forms.TextBox();
            this.goButton = new System.Windows.Forms.Button();
            this.outputTextBox = new System.Windows.Forms.TextBox();
            this.searcgGroupBox = new System.Windows.Forms.GroupBox();
            this.searchTextLabel = new System.Windows.Forms.Label();
            this.outputLabel = new System.Windows.Forms.Label();
            this.searcgGroupBox.SuspendLayout();
            this.SuspendLayout();
            // 
            // EndPageLabel
            // 
            this.EndPageLabel.AutoSize = true;
            this.EndPageLabel.Location = new System.Drawing.Point(429, 24);
            this.EndPageLabel.Name = "EndPageLabel";
            this.EndPageLabel.Size = new System.Drawing.Size(30, 17);
            this.EndPageLabel.TabIndex = 21;
            this.EndPageLabel.Text = "End";
            // 
            // startPageLabel
            // 
            this.startPageLabel.AutoSize = true;
            this.startPageLabel.Location = new System.Drawing.Point(395, 24);
            this.startPageLabel.Name = "startPageLabel";
            this.startPageLabel.Size = new System.Drawing.Size(35, 17);
            this.startPageLabel.TabIndex = 20;
            this.startPageLabel.Text = "Start";
            // 
            // endPageTextBox
            // 
            this.endPageTextBox.Location = new System.Drawing.Point(432, 44);
            this.endPageTextBox.Name = "endPageTextBox";
            this.endPageTextBox.Size = new System.Drawing.Size(28, 23);
            this.endPageTextBox.TabIndex = 3;
            this.endPageTextBox.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // startPageTextBox
            // 
            this.startPageTextBox.Location = new System.Drawing.Point(398, 44);
            this.startPageTextBox.Name = "startPageTextBox";
            this.startPageTextBox.Size = new System.Drawing.Size(28, 23);
            this.startPageTextBox.TabIndex = 2;
            this.startPageTextBox.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // queryHtmlPrefixlabel
            // 
            this.queryHtmlPrefixlabel.AutoSize = true;
            this.queryHtmlPrefixlabel.Location = new System.Drawing.Point(13, 24);
            this.queryHtmlPrefixlabel.Name = "queryHtmlPrefixlabel";
            this.queryHtmlPrefixlabel.Size = new System.Drawing.Size(102, 17);
            this.queryHtmlPrefixlabel.TabIndex = 17;
            this.queryHtmlPrefixlabel.Text = "QueryHtmlPrefix";
            // 
            // queryHtmlPrefixTextBox
            // 
            this.queryHtmlPrefixTextBox.Location = new System.Drawing.Point(16, 44);
            this.queryHtmlPrefixTextBox.Name = "queryHtmlPrefixTextBox";
            this.queryHtmlPrefixTextBox.Size = new System.Drawing.Size(376, 23);
            this.queryHtmlPrefixTextBox.TabIndex = 1;
            this.queryHtmlPrefixTextBox.Text = "thread0806.php?fid=2&search=&page=";
            // 
            // searchTextTextBox
            // 
            this.searchTextTextBox.Location = new System.Drawing.Point(16, 90);
            this.searchTextTextBox.Name = "searchTextTextBox";
            this.searchTextTextBox.Size = new System.Drawing.Size(376, 23);
            this.searchTextTextBox.TabIndex = 4;
            // 
            // goButton
            // 
            this.goButton.Location = new System.Drawing.Point(398, 90);
            this.goButton.Name = "goButton";
            this.goButton.Size = new System.Drawing.Size(62, 23);
            this.goButton.TabIndex = 5;
            this.goButton.Text = "Go";
            this.goButton.UseVisualStyleBackColor = true;
            this.goButton.Click += new System.EventHandler(this.goButton_Click);
            // 
            // outputTextBox
            // 
            this.outputTextBox.Location = new System.Drawing.Point(11, 165);
            this.outputTextBox.Multiline = true;
            this.outputTextBox.Name = "outputTextBox";
            this.outputTextBox.Size = new System.Drawing.Size(477, 314);
            this.outputTextBox.TabIndex = 6;
            // 
            // searcgGroupBox
            // 
            this.searcgGroupBox.Controls.Add(this.searchTextTextBox);
            this.searcgGroupBox.Controls.Add(this.queryHtmlPrefixTextBox);
            this.searcgGroupBox.Controls.Add(this.goButton);
            this.searcgGroupBox.Controls.Add(this.queryHtmlPrefixlabel);
            this.searcgGroupBox.Controls.Add(this.searchTextLabel);
            this.searcgGroupBox.Controls.Add(this.startPageTextBox);
            this.searcgGroupBox.Controls.Add(this.endPageTextBox);
            this.searcgGroupBox.Controls.Add(this.EndPageLabel);
            this.searcgGroupBox.Controls.Add(this.startPageLabel);
            this.searcgGroupBox.Location = new System.Drawing.Point(11, 8);
            this.searcgGroupBox.Name = "searcgGroupBox";
            this.searcgGroupBox.Size = new System.Drawing.Size(477, 129);
            this.searcgGroupBox.TabIndex = 26;
            this.searcgGroupBox.TabStop = false;
            this.searcgGroupBox.Text = "Search Criteria";
            // 
            // searchTextLabel
            // 
            this.searchTextLabel.AutoSize = true;
            this.searchTextLabel.Location = new System.Drawing.Point(13, 70);
            this.searchTextLabel.Name = "searchTextLabel";
            this.searchTextLabel.Size = new System.Drawing.Size(71, 17);
            this.searchTextLabel.TabIndex = 23;
            this.searchTextLabel.Text = "SearchText";
            // 
            // outputLabel
            // 
            this.outputLabel.AutoSize = true;
            this.outputLabel.Location = new System.Drawing.Point(11, 145);
            this.outputLabel.Name = "outputLabel";
            this.outputLabel.Size = new System.Drawing.Size(48, 17);
            this.outputLabel.TabIndex = 27;
            this.outputLabel.Text = "Output";
            // 
            // SearchPagesForm
            // 
            this.AcceptButton = this.goButton;
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 17F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(500, 491);
            this.Controls.Add(this.outputLabel);
            this.Controls.Add(this.searcgGroupBox);
            this.Controls.Add(this.outputTextBox);
            this.Font = new System.Drawing.Font("微软雅黑", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.Name = "SearchPagesForm";
            this.Text = "Search Pages";
            this.searcgGroupBox.ResumeLayout(false);
            this.searcgGroupBox.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label EndPageLabel;
        private System.Windows.Forms.Label startPageLabel;
        private System.Windows.Forms.TextBox endPageTextBox;
        private System.Windows.Forms.TextBox startPageTextBox;
        private System.Windows.Forms.Label queryHtmlPrefixlabel;
        private System.Windows.Forms.TextBox queryHtmlPrefixTextBox;
        private System.Windows.Forms.TextBox searchTextTextBox;
        private System.Windows.Forms.Button goButton;
        private System.Windows.Forms.TextBox outputTextBox;
        private System.Windows.Forms.GroupBox searcgGroupBox;
        private System.Windows.Forms.Label searchTextLabel;
        private System.Windows.Forms.Label outputLabel;
    }
}

