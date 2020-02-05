using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace BookClub.Core
{
    public class UserLogin
    {
        public int UserId { get; set; }
        [Required,StringLength(50)]
        public string UserName { get; set; }
        [Required, StringLength(50)]
        public string UserSurname { get; set; }
        [Required]
        [DataType(DataType.EmailAddress,ErrorMessage = "Please enter a valid email")]
        public string UserEmail { get; set; }
        [Required]
        public string Password { get; set; }

    }
}
