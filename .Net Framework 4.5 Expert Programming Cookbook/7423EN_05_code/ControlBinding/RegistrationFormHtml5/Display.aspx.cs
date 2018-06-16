using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RegistrationFormHtml5
{
    public partial class Confirm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<RegistrationFormHtml5.Entities.User> users = (List<RegistrationFormHtml5.Entities.User>)Session["users"];
            UserDetails.DataSource = users;
            UserDetails.DataBind();
        }
    }
}