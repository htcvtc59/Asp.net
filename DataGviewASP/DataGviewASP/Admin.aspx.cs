using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DataGviewASP
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }
        }

        private void LoadData()
        {
            DataProcess dt = new DataProcess();
            grvData.DataSource = dt.GetData();
            grvData.DataBind();
        }

        protected void grvData_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grvData.PageIndex = e.NewPageIndex;
            LoadData();
        }

        protected void grvData_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string user = grvData.DataKeys[e.RowIndex].Value.ToString();
            DataProcess dt = new DataProcess();
            if (dt.DeleteData(user))
            {
                LoadData();
            }
        }

        protected void grvData_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grvData.EditIndex = e.NewEditIndex;
            LoadData();
        }

        protected void grvData_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grvData.EditIndex = -1;
            LoadData();

        }

        protected void grvData_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string user = grvData.DataKeys[e.RowIndex].Value.ToString();
            string pass = ((TextBox)grvData.Rows[e.RowIndex].Cells[2].Controls[0]).Text;
            DataProcess dt = new DataProcess();
            if (dt.UpdateData(user, pass))
            {
                grvData.EditIndex = -1;
                LoadData();
            }
        }

        protected void grvData_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            Response.Redirect("http://localhost:51822/AddAccount.aspx");
        }
    }
}