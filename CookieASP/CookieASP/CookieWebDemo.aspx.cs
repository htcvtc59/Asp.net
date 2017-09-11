using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CookieASP
{
    public partial class CookieWebDemo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["account"] != null)
            {
                txtUser.Text = Request.Cookies["account"].Values["user"].ToString();
                string pass  =Request.Cookies["account"].Values["pass"].ToString();
                txtPass.Attributes.Add("value", pass);
            }

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string user = txtUser.Text;
            string pass = txtPass.Text;
            if (true) //gia thiet nguoi dung dang nhap thanh cong
            {
                if (cbRemember.Checked)//gia thiet nguoi dung chon luu thong tin tai khoan
                {
                    HttpCookie cookie = new HttpCookie("account");
                    cookie.Values.Add("user", user);
                    cookie.Values.Add("pass", pass);
                    cookie.Expires = DateTime.Now.AddDays(13);
                    Response.Cookies.Add(cookie);


                }
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["account"];
            cookie.Expires = DateTime.Now.AddDays(-1);
            Response.Cookies.Add(cookie);
        }
    }
}