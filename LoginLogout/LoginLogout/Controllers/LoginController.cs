using LoginLogout.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LoginLogout.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(string name, string password)
        {
            if ("tron".Equals(name) && "1234".Equals(password))
            {
                Session["user"] = new User() { Login = name, Name = "Tron" };
                return RedirectToAction("Index", "Home");
            }
            return View();
        }
        public ActionResult Logout()
        {
            Session.Clear();
            //or Session["user"] = null;
            return RedirectToAction("Index", "Home");
        }
    }
}