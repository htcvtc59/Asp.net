using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ViewProductwithIDProASP
{
    public partial class View : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string cate = Request.QueryString["id"];
            DataProcess dt = new DataProcess();
            GridView1.DataSource = dt.GetData(cate);
            GridView1.DataBind();
        }
    }
}