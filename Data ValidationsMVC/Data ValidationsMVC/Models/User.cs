using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel;

namespace Data_ValidationsMVC.Models
{
    public class User
    {
        public long Id { get; set; }
        public string name { get; set; }
        [Required(ErrorMessage ="Please enter your name.")]

        [DataType(DataType.Password)]
        public string Password { get; set; }

        [DataType(DataType.Password)]
        [DisplayName("Re-enter Password")]
        [Compare("Password")]
        public string ReenterPassword { get; set; }

        [Required]
        [Range(18,60,ErrorMessage ="The age should be between 18 and 60.")]
        public int Age { get; set; }

        [Required]
        [RegularExpression(@"[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.]\.[A-Za-z]{2,4}",ErrorMessage ="Email is not valid.")]
        public string Email { get; set; }

    }
}