using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace UploadServiceTestApp
{
    public partial class UploadTestForm : Form
    {
        public UploadTestForm()
        {
            InitializeComponent();
        }

        private void btnBrowse_Click(object sender, EventArgs e)
        {
            OpenFileDialog diagOpen = new OpenFileDialog();
            if (diagOpen.ShowDialog() == System.Windows.Forms.DialogResult.OK)
            {
                try
                {
                    txtFile.Text = diagOpen.FileName;
                    UploadServiceReference.UploadServiceClient client = new UploadServiceReference.UploadServiceClient();
                    client.Upload(Path.GetFileName(txtFile.Text), File.Open(txtFile.Text, FileMode.Open));
                    MessageBox.Show("Upload Successful");
                }
                catch (Exception)
                {

                    MessageBox.Show("Upload failed");
                }
            }

        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }
    }
}
