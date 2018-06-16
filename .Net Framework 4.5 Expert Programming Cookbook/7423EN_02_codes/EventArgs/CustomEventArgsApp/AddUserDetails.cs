using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CustomEventArgsApp
{
    public partial class AddUserDetails : Form
    {
        public AddUserDetails()
        {
            InitializeComponent();
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            Contacts contacts = new Contacts();
            contacts.ContactDetailsAdded += new EventHandler<CookBook.Recipes.Winforms.Events.EventArgs<string>>(contacts_ContactDetailsAdded);
            contacts.Show();
        }

        void contacts_ContactDetailsAdded(object sender, CookBook.Recipes.Winforms.Events.EventArgs<string> e)
        {
            txtContacts.Text += e.Data;
        }
    }
}
