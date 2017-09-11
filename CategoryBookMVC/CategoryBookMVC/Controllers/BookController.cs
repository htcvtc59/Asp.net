using CategoryBookMVC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CategoryBookMVC.Controllers
{
    public class BookController : Controller
    {
        // GET: Book
        public ActionResult Index()
        {
            SetViewBag();
            return View();
        }

        [HttpPost]
        public ActionResult Create(Book book)
        {
            ModelsBook model = new ModelsBook();
            model.AddBook(book);
            SetViewBag();
            return View("Index");
        }

        public void SetViewBag(int? selectedId = null)
        {
            ModelsBook model = new ModelsBook();
            ViewBag.data = new SelectList(model.listCategory(), "ID", "Name", selectedId);
        }
    }
}