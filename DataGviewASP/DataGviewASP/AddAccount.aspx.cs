using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DataGviewASP
{
    public partial class AddAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            DataProcess dt = new DataProcess();
            if (dt.InsertData(txtUser.Text, txtPass.Text)){
                Response.Redirect("http://localhost:51822/Admin.aspx");
            }
           

        }
    }
}