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

namespace BookClub.App
{
    public class UserPageModel : PageModel
    {
        public string UserId { get; set; }
        public bool logOut { get; set; }
        public UserLogin userDetails { get; set; }
        public IEnumerable<UserLogin> UserLoginDetails { get; set; }

        private readonly IConfiguration config;
        private readonly IUserinfo userData;

        public UserPageModel(IConfiguration config, IUserinfo userinfo)
        {
            this.config = config;
            userData = userinfo;
        }
        public IActionResult OnGet(bool LogOut)
        {
            //if (logOut)
            //{
            //    OnGetLogout();
            //    return RedirectToPage("/Index");
            //}
            UserId = HttpContext.Session.GetString("userId");
            if (string.IsNullOrEmpty(UserId))
                return RedirectToPage("/Index");
            userDetails = userData.FetchById(int.Parse(UserId));
            return Page();
        }
        public void OnPost()
        {
            HttpContext.Session.Remove("userId");
        }
        public IActionResult OnGetLogout()
        {
            HttpContext.Session.Remove("userId");
            return RedirectToPage("/Index");
        }
    }
}