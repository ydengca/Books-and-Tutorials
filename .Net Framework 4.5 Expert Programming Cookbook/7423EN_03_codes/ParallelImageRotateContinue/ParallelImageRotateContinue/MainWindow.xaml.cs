using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Forms;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace ParallelImageRotateContinue
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }
        private void StartBulkProcessing(string path)
        {
            string[] files = System.IO.Directory.GetFiles(path, "*.jpg");
            string newDir = @"C:\Users\Public\Pictures\Sample Pictures\Modified";

            System.IO.Directory.CreateDirectory(newDir);
            try
            {
                var firstTask = new Task(() => DoRotate(files,newDir));
                var secondTask = firstTask.ContinueWith((t) => MakeTransparent(files, newDir));
                firstTask.Start();
            }
            catch (AggregateException e)
            {
                Console.WriteLine(e.Message);
            }
        }
        private void DoRotate(string[] files, string newDir)
        {
            Parallel.ForEach(files, currentFile =>
            {
                // The more computational work you do here, the greater 
                // the speedup compared to a sequential foreach loop.
                string filename = System.IO.Path.GetFileName(currentFile);
                System.Drawing.Bitmap bitmap = new System.Drawing.Bitmap(currentFile);
                
                bitmap.RotateFlip(System.Drawing.RotateFlipType.Rotate180FlipNone);
                bitmap.Save(System.IO.Path.Combine(newDir, filename));
                
            } //close lambda expression
                 ); //close method invocation
        }

        private void MakeTransparent(string[] files, string newDir)
        {
            Parallel.ForEach(files, currentFile =>
            {
                // The more computational work you do here, the greater 
                // the speedup compared to a sequential foreach loop.
                string filename = System.IO.Path.GetFileName(currentFile);
                System.Drawing.Bitmap bitmap = new System.Drawing.Bitmap(currentFile);
                string newFile = "trans_" + filename;
                bitmap.MakeTransparent(System.Drawing.Color.Blue);
                bitmap.Save(System.IO.Path.Combine(newDir, newFile));
                lblImagesProcessed.Dispatcher.BeginInvoke((Action)delegate() { lblImagesProcessed.Content += filename + Environment.NewLine; });
            } //close lambda expression
                 ); //close method invocation
        }

        private void btnSelectDir_Click(object sender, RoutedEventArgs e)
        {
            FolderBrowserDialog diagFolder = new FolderBrowserDialog();
            if (diagFolder.ShowDialog() == System.Windows.Forms.DialogResult.OK)
            {
                StartBulkProcessing(diagFolder.SelectedPath);
            }

        }
    }
}
