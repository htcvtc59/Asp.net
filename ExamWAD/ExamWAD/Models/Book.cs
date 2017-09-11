﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ExamWAD.Models
{
    public class Book
    {
        public string Bookid { get; set; }
        public string Title { get; set; }
        public string Author { get; set; }
        public double Price { get; set; }
        public string Image { get; set; }
        public string Description { get; set; }
        public bool Status { get; set; }



    }
}