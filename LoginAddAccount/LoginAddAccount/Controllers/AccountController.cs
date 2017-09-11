using LoginAddAccount.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LoginAddAccount.Controllers
{
    public class AccountController : Controller
    {
        // GET: Account
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(Account acc)
        {
            AccountModel model = new AccountModel();
            if (model.CheckLogin(acc))
            {
                return View("CustomPaging");
            }
            else
            {
                return View("Index");
            }
        }

        public ActionResult CustomPaging(int page = 1)
        {
            int pageSize = 3;
            int totalPage = 0;
            int totalRecord = 0;
            AccountModel model = new AccountModel();
            totalRecord = model.GetData().Count;
            totalPage = (totalRecord / pageSize) + ((totalRecord % pageSize) > 0 ? 1 : 0);
            List<Account> listacc = model.GetData().OrderBy(x => x.username).Skip(((page - 1) * pageSize)).Take(pageSize).ToList();
            ViewBag.TotalRows = totalRecord;
            ViewBag.PageSize = pageSize;
            //ViewBag.data = listacc;
            return View(listacc);
        }


        [HttpPost]
        public ActionResult Register(Account acc)
        {
            AccountModel model = new AccountModel();
            if (model.AddAccount(acc))
            {
                return View("Index");
            }
            else
            {
                return View("Register");
            }

        }

    }
}