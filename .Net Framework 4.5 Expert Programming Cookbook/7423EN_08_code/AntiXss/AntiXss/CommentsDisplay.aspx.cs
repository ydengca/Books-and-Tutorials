using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AntiXss
{
    public partial class CommentsDisplay : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ltlTitle.Text = System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode((string)Session["title"],false);
            ltlComments.Text = System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode( (string)Session["comment"], false);
            ltlUnsafeComments.Text = (string)Session["comment"];
        }
    }
}