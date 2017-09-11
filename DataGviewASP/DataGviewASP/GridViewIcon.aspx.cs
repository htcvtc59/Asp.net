using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DataGviewASP
{
    public partial class GridViewIcon : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDataIcon();
            }
        }

        private void LoadDataIcon()
        {
            DataProcess dt = new DataProcess();
            gridView.DataSource = dt.GetData();
            gridView.DataBind();
        }


        protected void btnFirst_Click(object sender, EventArgs e)
        {
            gridView.PageIndex = 0;

        }

        protected void btnPrev_Click(object sender, EventArgs e)
        {
            int i = gridView.PageCount;
            if (gridView.PageIndex > 0)
            {
                gridView.PageIndex = gridView.PageIndex - 1;
            }
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            int i = gridView.PageIndex + 1;
            if (i <= gridView.PageCount)
            {
                gridView.PageIndex = i;
            }

        }

        protected void btnLast_Click(object sender, EventArgs e)
        {
            gridView.PageIndex = gridView.PageCount;
        }

        protected void gridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gridView.EditIndex = e.NewEditIndex;
            LoadDataIcon();
        }


        protected void ckAll_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox ckAll = (CheckBox)gridView.HeaderRow.FindControl("ckAll");
            foreach (GridViewRow gv in gridView.Rows)
            {
                CheckBox ckitem = (CheckBox)gv.FindControl("ckBoxRow");
                ckitem.Checked = ckAll.Checked;
            }

        }

        protected void gridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridView.EditIndex = e.NewPageIndex;
            LoadDataIcon();
        }

        protected void imgbtnDelete_Click(object sender, ImageClickEventArgs e)
        {

            CheckBox ckAll = (CheckBox)gridView.HeaderRow.FindControl("ckAll");
            if (ckAll.Checked)
            {
                DataProcess dt = new DataProcess();
                if (dt.DeleteAll())
                {
                    LoadDataIcon();
                }
            }

            foreach (GridViewRow row in gridView.Rows)
            {
                CheckBox ckitem = (CheckBox)row.FindControl("ckBoxRow");
                if (ckitem != null && ckitem.Checked)
                {
                    DataProcess dt = new DataProcess();
                    if (dt.DeleteData(row.Cells[1].Text))
                    {
                        LoadDataIcon();
                    }

                }
            }
        }

        protected void gridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string user = gridView.Rows[e.RowIndex].Cells[1].Text;
            string pass = ((TextBox)gridView.Rows[e.RowIndex].Cells[2].Controls[0]).Text;
            DataProcess dt = new DataProcess();
            if (dt.UpdateData(user, pass))
            {
                gridView.EditIndex = -1;
                LoadDataIcon();
            }

        }

        protected void gridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string user = gridView.Rows[e.RowIndex].Cells[1].Text;
            DataProcess dt = new DataProcess();
            if (dt.DeleteData(user))
            {
                LoadDataIcon();
            }
        }

        protected void gridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gridView.EditIndex = -1;
            LoadDataIcon();

        }

        protected void imgbtnAdd_Click(object sender, ImageClickEventArgs e)
        {

            TextBox txtUser = (TextBox)gridView.FooterRow.FindControl("txtUser");
            TextBox txtPass = (TextBox)gridView.FooterRow.FindControl("txtPass");
            string user = txtUser.Text;
            string pass = txtPass.Text;
            DataProcess dt = new DataProcess();
            if (dt.InsertData(user, pass) && user.Length > 0 && pass.Length > 0)
            {
                LoadDataIcon();
            }


        }
    }
}