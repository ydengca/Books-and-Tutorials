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

namespace FileUpload
{
    public partial class UploadForm : Form
    {
        public UploadForm()
        {
            InitializeComponent();
        }

        private void btnUpload_Click(object sender, EventArgs e)
        {
            OpenFileDialog diagFile = new OpenFileDialog();

            if (diagFile.ShowDialog()==System.Windows.Forms.DialogResult.OK)
            {
                txtPath.Text = diagFile.FileName;
                using (CookBookEntities context = new CookBookEntities())
                {
                    try
                    {
                        context.SaveFile(Path.GetFileNameWithoutExtension(txtPath.Text), GetBytesFromFile(txtPath.Text));
                        MessageBox.Show("Upload Successful");
                    }
                    catch (Exception ex)
                    {

                        MessageBox.Show(ex.Message);
                    }
                } 
            }
        }

        private byte[] GetBytesFromFile(string path)
        {
            byte[] data = null;

            FileInfo info = new FileInfo(path);
            long numBytes = info.Length;

            FileStream stream = new FileStream(path, FileMode.Open,
            FileAccess.Read);

            BinaryReader reader = new BinaryReader(stream);
            data = reader.ReadBytes((int)numBytes);
            return data;
        }
    }
}
