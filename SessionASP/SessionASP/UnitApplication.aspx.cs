using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SessionASP
{
    public partial class UnitApplication : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["Data"] = DateTime.Now.ToString();
            Application["Data"] = DateTime.Now.ToString();
            Response.Redirect("ViewData.aspx");
        }
    }
}