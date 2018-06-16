using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AntiXss
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Session.Add("title", txtTitle.Text);
            Session.Add("comment", txtComments.Text);
            Server.Transfer("~/CommentsDisplay.aspx");
        }
    }
}