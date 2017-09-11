using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ProductList;
using ProductList.Models;

namespace ProductList.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {

            List<Product> products = new List<Product>();
            products.Add(new Product() { Id = 1, Name = "a", Price = 23.4f, Images = "gmail.png" });
            products.Add(new Product() { Id = 2, Name = "b", Price = 30.7f, Images = "google.jpg" });
            products.Add(new Product() { Id = 3, Name = "c", Price = 45.2f, Images = "newsletter-naruto3.png" });

            ViewBag.Product = products;
            return View();
        }
    }
}