using ExamWAD.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ExamWAD.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            BookModel model = new BookModel();
            List<Book> books = model.GetData();
            List<TitleBook> listt = new List<TitleBook>();
            foreach (var item in books)
            {
                listt.Add(model.GetByIDNameTitle(item.Title));
            }
            ViewBag.listTitle = listt;

            return View(books);
        }

        public ActionResult Detail(string id)
        {
            BookModel model = new BookModel();
            Book b = model.GetByID(id);
            ViewBag.titleb = model.GetByIDNameTitle(b.Title);

            return View(b);
        }




    }
}