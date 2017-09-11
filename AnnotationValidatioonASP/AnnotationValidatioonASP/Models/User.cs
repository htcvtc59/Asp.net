using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
namespace AnnotationValidatioonASP.Models
{
    public class User
    {
        [Required(ErrorMessage = "Login field is required")]
        [StringLength(100,MinimumLength =6,ErrorMessage ="Login name length must be greater than 6 characters")]
        public string Login { get; set; }
        [Required(ErrorMessage = "Name field is required")]
        public string Name { get; set; }
        [Required(ErrorMessage = "Password field is required")]
        public string Password { get; set; }
        [Required(ErrorMessage = "ReEnterPassword field is required")]
        [Compare("Password",ErrorMessage ="Password is not the same")]
        public string ReEnterPassword { get; set; }
        [Required(ErrorMessage = "Email field is required")]
        [RegularExpression("[0-9a-zA-Z\\._]+@+[0-9a-zA-Z\\._]+",ErrorMessage ="Email is invalid")]
        public string Email { get; set; }


    }
}