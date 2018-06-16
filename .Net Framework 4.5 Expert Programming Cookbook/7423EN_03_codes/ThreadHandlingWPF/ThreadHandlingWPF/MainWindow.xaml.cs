using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Forms;
using System.IO;
using System.Threading;
namespace ThreadHandlingWPF
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private delegate void ListDelegate(string[] files);
        private ListDelegate listFiles;
        Thread _thread;
        string _path;
        
        public MainWindow()
        {
            InitializeComponent();
            listFiles = new ListDelegate(DisplayFiles);
        }

        private void btnSelectDir_Click(object sender, RoutedEventArgs e)
        {
            FolderBrowserDialog diagFolder = new FolderBrowserDialog();
            if (diagFolder.ShowDialog() == System.Windows.Forms.DialogResult.OK)
            {
                txtPath.Text = diagFolder.SelectedPath;
                _path = txtPath.Text;
            }
        }

        private void ListFiles()
        {
            if (!String.IsNullOrEmpty(_path))
            {
                string[] files;

                try
                {
                    files = Directory.GetFiles(_path);
                }
                catch (Exception)
                {

                    return;
                }
                lstFileList.Dispatcher.BeginInvoke(listFiles, new object[] { files });
            }
        }

        private void DisplayFiles(string[] files)
        {
            lstFileList.ItemsSource = files;
        }

        private void btnListFiles_Click(object sender, RoutedEventArgs e)
        {
            ThreadStart start = new ThreadStart(ListFiles);
            _thread = new Thread(start);
            _thread.Start();
            _thread.Join();
        }
    }
}
