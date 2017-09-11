using ActionResultMVC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Xml.Linq;

namespace ActionResultMVC.Controllers
{
    public class BooksController : Controller
    {
        // GET: Books
        public ActionResult Index()
        {
            BooksModel model = new BooksModel();
            ViewBag.books = model.GetData();
            return View();
        }

        public JsonResult GetJsonData()
        {
            BooksModel model = new BooksModel();
            List<Books> list = model.GetData();
            return Json(list, JsonRequestBehavior.AllowGet);
        }
        public ContentResult GetXmlData()
        {
            XElement xData = new XElement("BookStore");
            BooksModel model = new BooksModel();
            List<Books> list = model.GetData();
            foreach (var item in list)
            {
                xData.Add(
                    new XElement("Book",
                    new XElement("ID", item.id),
                    new XElement("Title", item.title),
                    new XElement("Author", item.author),
                    new XElement("Description", item.description),
                    new XElement("Images", item.images),
                    new XElement("Price", item.price)
                    ));
            }
                return Content(xData.ToString(), "text/html", Encoding.Unicode);

            }
           
      public int CountBook()
        {
            XElement xData = new XElement("BookStore");
            BooksModel model = new BooksModel();
            return model.GetData().Count;
        }          


      


    }
}