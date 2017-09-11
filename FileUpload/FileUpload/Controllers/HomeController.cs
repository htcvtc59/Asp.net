using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FileUpload.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Upload(HttpPostedFileBase file)
        {
            string path = Server.MapPath("~/Images/" + file.FileName);
            file.SaveAs(path);
            ViewBag.Path = path;

            return View();
        }
    }
}