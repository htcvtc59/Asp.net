using ExamWAD.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ExamWAD.Controllers
{
    public class BookController : Controller
    {
        // GET: Book
        public ActionResult Index()
        {
            BookModel model = new BookModel();
            ViewBag.books = model.GetData();


            return View();
        }

        public ActionResult Edit(string id)
        {
            BookModel model = new BookModel();
            ViewBag.book = model.GetData().Find(x => x.Bookid == id);
            return View();
        }

        public ActionResult Delete(string id)
        {
            BookModel model = new BookModel();
            model.DeleteItem(id);
            ViewBag.books = model.GetData();
            return View("Index");
        }













        [HttpGet]
        public ActionResult AddBook()
        {
            SetViewBag();
            return View();
        }

        

        [HttpPost]
        public ActionResult AddBook(Book b)
        {
            if (new BookModel().InsertBook(b))
            {
                return View("Index");
            }
            else
            {
                return Redirect("/");
            }
          
        }


        [HttpGet]
        public ActionResult AddTitleB()
        {
            return View();
        }

        [HttpPost]
        public ActionResult AddTitleB(TitleBook t)
        {
            if(new BookModel().InsertTitleBook(t))
            {
                return View("Index");
            }
            else
            {
                return Redirect("/");
            }
        }
        public void SetViewBag(int? selectedId = null)
        {
            BookModel model = new BookModel();
            ViewBag.data = new SelectList(model.listTitleBook(), "Id", "Title", selectedId);
        }

    }
}