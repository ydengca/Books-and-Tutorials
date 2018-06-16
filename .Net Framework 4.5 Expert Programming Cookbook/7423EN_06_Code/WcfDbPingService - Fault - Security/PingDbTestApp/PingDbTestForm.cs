using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.ServiceModel;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PingDbTestApp
{
    public partial class PingDbTestForm : Form
    {
        public PingDbTestForm()
        {
            InitializeComponent();
        }

        private void btnPing_Click(object sender, EventArgs e)
        {
            try
            {
                PingServiceReference.PingServiceClient client = new PingServiceReference.PingServiceClient();
                bool result = client.IsDbUp(txtConnString.Text);
                lblResult.Text = "Database with connection string " + txtConnString.Text + " is up? " + result;
            }
            catch (FaultException<PingServiceReference.PingException> ex)
            {
                MessageBox.Show(ex.Detail.Message);
            }
            catch (System.ServiceModel.Security.SecurityAccessDeniedException ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}
