using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ZAP_BEACH_CAMPING
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void redirectHome(object sender, EventArgs e)
        {
            Response.Redirect("/");
        }
        protected void redirectAbout(object sender, EventArgs e)
        {
            Response.Redirect("/About.aspx");
        }
        protected void redirectOrder(object sender, EventArgs e)
        {
            Response.Redirect("/");
        }
    }
}