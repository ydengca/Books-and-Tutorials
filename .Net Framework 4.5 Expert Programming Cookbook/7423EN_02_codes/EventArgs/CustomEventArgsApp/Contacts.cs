using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using CookBook.Recipes.Winforms.Events;

namespace CustomEventArgsApp
{
    public partial class Contacts : Form
    {
        public event EventHandler<EventArgs<string>> ContactDetailsAdded = delegate { };
        public Contacts()
        {
            InitializeComponent();
        }

        private void btnOK_Click(object sender, EventArgs e)
        {
            string data = String.Format("{0}-{1};{2}", txtLname.Text, txtFname.Text, txtPhone.Text);
            ContactDetailsAdded(this, new EventArgs<string>(data));
            this.Close();
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        
    }
}
