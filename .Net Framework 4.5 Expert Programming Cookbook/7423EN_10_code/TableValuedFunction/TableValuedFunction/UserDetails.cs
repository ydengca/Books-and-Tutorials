using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace TableValuedFunction
{
    public partial class UserDetails : Form
    {
        public UserDetails()
        {
            InitializeComponent();
        }

        private void btnSubmit_Click(object sender, EventArgs e)
        {
            int userID = Convert.ToInt32(txtUserID.Text);
            using (CookBookEntities context = new CookBookEntities())
            {
                var result = context.GetUserDetails(userID);

                dgvUserDetails.DataSource = result;

            }
        }
    }
}
