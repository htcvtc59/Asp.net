using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LoginDemoASP
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string user = txtUser.Text;
            string pass = txtPass.Text;
            DataProcess dt = new DataProcess();
            if (dt.CheckLogin(user, pass))
                Response.Write("Login success");
            else
                Response.Write("Login failed");

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string user = txtUser.Text;
            string pass = txtPass.Text;
            DataProcess dt = new DataProcess();
            if (dt.Register(user, pass)==1)
                Response.Write("Register success");
            else
                Response.Write("Register failed");
        }
    }
}