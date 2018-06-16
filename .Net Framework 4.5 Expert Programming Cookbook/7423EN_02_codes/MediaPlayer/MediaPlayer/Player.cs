using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Microsoft.DirectX.AudioVideoPlayback;
namespace MediaPlayer
{
    public partial class Player : Form
    {
        private string _fileName;
        private Video _video;
        public Player()
        {
            InitializeComponent();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            
        }

        private void tsmiOpen_Click(object sender, EventArgs e)
        {
            OpenFileDialog diagOpen = new OpenFileDialog();
            diagOpen.DefaultExt = "*.avi,*.wmv";
            if (diagOpen.ShowDialog() == System.Windows.Forms.DialogResult.OK)
            {
                _fileName = diagOpen.FileName;
                if (_video != null)
                {
                    _video.Dispose();
                }
                _video = new Video(_fileName);

                int height = pnlVideo.Height;
                int width = pnlVideo.Width;
                
                _video.Owner = pnlVideo;
                pnlVideo.Width = width;
                pnlVideo.Height = height;
                _video.Play();
                _video.Pause();
            }
        }

        private void btnPlay_Click(object sender, EventArgs e)
        {
            if (_video != null && !_video.Playing)
            {
                _video.Play();
            }
        }

        private void btnPause_Click(object sender, EventArgs e)
        {
            if (_video != null && _video.Playing)
            {
                _video.Pause();
            }
        }

        private void btnStop_Click(object sender, EventArgs e)
        {
            if (_video != null && _video.Playing)
            {
                _video.Stop();
            }
        }

        private void tbSeek_ValueChanged(object sender, EventArgs e)
        {
            if (_video != null)
            {
                _video.SeekCurrentPosition((tbSeek.Value * 5000000000D), SeekPositionFlags.RelativePositioning);
            }
        }
    }
}
