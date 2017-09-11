using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ViewProductwithIDProASP
{
    public partial class ListCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataProcess dt = new DataProcess();
            foreach (Category item in dt.GetDataCate())
            {
                string id = item.id;
                string name = item.name;
                Response.Write("<a href='View.aspx?id="+id+"'>");
                Response.Write(name);
                Response.Write("</a><br/>");
            }
        }
    }
}