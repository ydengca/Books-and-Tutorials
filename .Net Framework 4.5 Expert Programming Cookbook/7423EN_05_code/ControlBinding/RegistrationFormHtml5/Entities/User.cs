using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RegistrationFormHtml5.Entities
{
    public class User
    {
        public int ID { get; set; }
        public string UserName { get; set; }
        public string Email { get; set; }
        public DateTime Dob { get; set; }
        public int Age { get; set; }
        public string Phone { get; set; }
        public string Blog { get; set; }
    }
}