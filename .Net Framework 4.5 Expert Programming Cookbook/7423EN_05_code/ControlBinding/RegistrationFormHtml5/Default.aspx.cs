using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RegistrationFormHtml5.Entities;
namespace RegistrationFormHtml5
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtAge.Text = string.Empty;
            txtBlog.Text = string.Empty;
            txtDob.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtPhone.Text = string.Empty;
            txtUserName.Text = string.Empty;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            User user = new User();
            user.UserName = txtUserName.Text;
            user.Age = Convert.ToInt32( txtAge.Text);
            user.Blog = txtBlog.Text;
            user.Email = txtEmail.Text;
            List<User> users = new List<Entities.User>();
            users.Add(user);
            Session.Add("users", users);
            Server.Transfer("~/Display.aspx");
        }
    }
}