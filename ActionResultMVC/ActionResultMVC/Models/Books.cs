using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ActionResultMVC.Models
{
    public class Books
    {
        public string id { get; set; }
        public string title { get; set; }
        public string author { get; set; }
        public string description { get; set; }
        public string images { get; set; }
        public double price { get; set; }
    }
}