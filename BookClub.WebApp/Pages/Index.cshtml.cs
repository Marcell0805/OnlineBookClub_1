using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BookClub.Core;
using BookClub.Data;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Configuration;

namespace BookClub.WebApp
{
    public class IndexModel : PageModel
    {
        [BindProperty]
        public string Username { get; set; }

        [BindProperty]
        public string Password { get; set; }

        public string Msg { get; set; }
        private readonly IConfiguration config;
        private readonly IUserinfo userinfo;
        public IndexModel(IConfiguration config, IUserinfo userinfo)
        {
            this.config = config;
            this.userinfo = userinfo;
        }

        public void OnGet()
        {
        }

        public IActionResult OnPost()
        {
            IEnumerable<UserLogin> userDetail = userinfo.CheckLogin(Username, Password);
            if(userDetail!=null)
            {
                var userId = 0;
                foreach (var item in userDetail)
                {
                    userId=item.UserId;
                }
                HttpContext.Session.SetString("userId", userId.ToString());
                return RedirectToPage("/AppPages/BookViewingPage");
            }

            //if (Username.Equals("abc") && Password.Equals("123"))
            //{
            //    HttpContext.Session.SetString("username", Username,"",);
            //    return RedirectToPage("/AppPages/BookViewingPage");
            //}
            else
            {
                Msg = "Invalid credentials";
                return Page();
            }
        }
    }
}