using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SessionASP
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            DataProcess dt = new DataProcess();
            string user = txtUser.Text;
            string pass = txtPass.Text;
            if (dt.CheckLogin(user, pass) != null)
            {
                Session["Account"] = dt.CheckLogin(user, pass);
                Response.Redirect("LoginAdmin.aspx");
            }
        }
    }
}