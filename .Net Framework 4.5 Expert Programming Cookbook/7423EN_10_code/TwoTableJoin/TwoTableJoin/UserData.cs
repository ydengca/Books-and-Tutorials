using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.Objects;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace TwoTableJoin
{
    public partial class UserData : Form
    {
        public UserData()
        {
            InitializeComponent();
        }

        private void btnShow_Click(object sender, EventArgs e)
        {
            using (CookBookEntities context = new CookBookEntities())
            {
                ObjectSet<User> users = context.Users;
                ObjectSet<Files> files = context.Files;
                int userID = Convert.ToInt32(txtUser.Text);
                var query =
                    from user in users
                    join file in files
                    on user.Id equals file.User_ID
                    where user.Id == userID
                    select new
                    {
                        FileID = file.ID,
                        FileName = file.File_name
                    };
                var fileDetails = query.ToList();
                dgvFiles.DataSource = fileDetails;


            }
        }
        
    }
}
