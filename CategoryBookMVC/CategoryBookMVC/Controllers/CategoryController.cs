using CategoryBookMVC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CategoryBookMVC.Controllers
{
    public class CategoryController : Controller
    {
        // GET: Category
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(Category cate)
        {
            ModelsBook model = new ModelsBook();
            model.AddCategory(cate);
            return RedirectToAction("Create","Book");
        }

    }
}