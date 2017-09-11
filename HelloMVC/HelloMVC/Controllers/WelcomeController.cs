using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HelloMVC.Controllers
{
    public class WelcomeController : Controller
    {
        // GET: Welcome
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Hello(string name)
        {
            ViewData["message"] = "Hello" + name;
            return View();
        }
    }
}