using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;

namespace Webcam
{
    public partial class MainPage : UserControl
    {
        private CaptureSource _captureSource = null;
        public MainPage()
        {
            InitializeComponent();
        }

        private void btnStart_Click(object sender, RoutedEventArgs e)
        {
            if (!CaptureDeviceConfiguration.AllowedDeviceAccess)
            {
                if (!CaptureDeviceConfiguration.RequestDeviceAccess())
                {
                    MessageBox.Show("Cannot access the webcam");
                }
            }
            else
            {
                StartWebCam();
            }
        }

        private void StartWebCam()
        {
            if (_captureSource==null)
            {
                _captureSource = new CaptureSource(); 
            }
            if (_captureSource.State== CaptureState.Stopped)
            {
                _captureSource.VideoCaptureDevice = CaptureDeviceConfiguration.GetDefaultVideoCaptureDevice();
                VideoBrush PreviewBrush = new VideoBrush();
                PreviewBrush.SetSource(_captureSource);
                rectCam.Fill = PreviewBrush;
                _captureSource.Start(); 
            }
        }

        private void btnStop_Click(object sender, RoutedEventArgs e)
        {
            if (_captureSource != null && _captureSource.State == CaptureState.Started)
            {
                _captureSource.Stop();
            }
        }
    }
}
