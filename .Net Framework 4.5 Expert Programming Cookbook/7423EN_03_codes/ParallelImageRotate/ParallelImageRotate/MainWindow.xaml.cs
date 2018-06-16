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
using System.Drawing;
using System.Threading;
namespace ParallelImageRotate
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

        private void btnSelectDir_Click(object sender, RoutedEventArgs e)
        {
            FolderBrowserDialog diagFolder = new FolderBrowserDialog();
            if (diagFolder.ShowDialog() == System.Windows.Forms.DialogResult.OK)
            {
                DoRotate(diagFolder.SelectedPath);
            }

            
        }
        private void DoRotate(string path)
        {
            string[] files = System.IO.Directory.GetFiles(path, "*.jpg");
            string newDir = @"C:\Users\Public\Pictures\Sample Pictures\Modified";
            System.IO.Directory.CreateDirectory(newDir);

            //  Method signature: Parallel.ForEach(IEnumerable<TSource> source, Action<TSource> body)
            Parallel.ForEach(files, currentFile =>
            {
                // The more computational work you do here, the greater 
                // the speedup compared to a sequential foreach loop.
                string filename = System.IO.Path.GetFileName(currentFile);
                System.Drawing.Bitmap bitmap = new System.Drawing.Bitmap(currentFile);

                bitmap.RotateFlip(System.Drawing.RotateFlipType.Rotate180FlipNone);
                bitmap.Save(System.IO.Path.Combine(newDir, filename));
                lblImagesProcessed.Dispatcher.BeginInvoke((Action)delegate() { lblImagesProcessed.Content += filename + Environment.NewLine; });
            } //close lambda expression
                 ); //close method invocation

            //to see how much time it has taken for computation
            

        }
    }
}
