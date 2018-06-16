using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace UIThreadHandlingWinForms
{
    public partial class DirectoryLister : Form
    {
        private Thread _thread;
        private delegate void FileList(string[] fileNames);
        private FileList fileList;

        public DirectoryLister()
        {
            InitializeComponent();
            fileList = new FileList(DisplayFiles);
        }

        private void btnSelectDir_Click(object sender, EventArgs e)
        {
            FolderBrowserDialog diagFolder = new FolderBrowserDialog();
            if (diagFolder.ShowDialog() == System.Windows.Forms.DialogResult.OK)
            {
                txtDirectory.Text = diagFolder.SelectedPath;
            }
        }

        private void ListFiles()
        {
            string directoryPath = txtDirectory.Text;
            if (!String.IsNullOrEmpty(directoryPath))
            {
                string[] files;

                try
                {
                    files = Directory.GetFiles(directoryPath);
                }
                catch (Exception e)
                {

                    return;
                }
                IAsyncResult result = BeginInvoke(fileList, new object[] { files });
            }
        }
        private void DisplayFiles(string[] files)
        {
            lstFiles.DataSource = files;
        }
        private void btnListFiles_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(txtDirectory.Text))
            {
                _thread = new Thread(new ThreadStart(ListFiles));
                _thread.Start();
                _thread.Join();
            }
        }
    }
}
