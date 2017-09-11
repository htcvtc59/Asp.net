﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SessionASP
{
    public partial class LoginAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Account"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            DataProcess dt = new DataProcess();
            GridView1.DataSource = dt.GetData();
            Account account = (Account)Session["Account"];
            if (account.level.Equals("admin"))
            {
                GridView1.AutoGenerateDeleteButton = true;
                GridView1.AutoGenerateEditButton = true;
            }
            GridView1.DataBind();
        }
    }
}