using Exam_WAD.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Exam_WAD.Controllers
{
    public class EmployeesController : Controller
    {
        // GET: Employees
        public ActionResult Index()
        {
            EmployeeModel model = new EmployeeModel();
            List<Employee> list = model.GetData();
            ViewBag.data = list;
            return View();
        }

        [HttpGet]
        public ActionResult Employ()
        {
            return View();
        }


        [HttpPost]
        public ActionResult Employ(Employee e)
        {
            if (ModelState.IsValid)
            {
                if (new EmployeeModel().InsertEmployee(e)==true)
                {
                    return RedirectToAction("Index", "Employees");
                }
                else
                {
                    SetAlert("Thêm mới lỗi", "success");
                    ModelState.AddModelError("", "Thêm mới lỗi");
                    
                }
               
            }
            return View();
        }

        protected void SetAlert(string message, string type)
        {
            TempData["AlertMessage"] = message;
            if (type == "success")
            {
                TempData["AlertType"] = "alert-success";
            }
            else if (type == "warning")
            {
                TempData["AlertType"] = "alert-warning";
            }
            else if (type == "error")
            {
                TempData["AlertType"] = "alert-danger";
            }

        }
    }
}