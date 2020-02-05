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
        [BindProperty]
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
            if(!string.IsNullOrEmpty(HttpContext.Session.GetString("userRegister")))
            {
                userDetails = new UserLogin();
            }
            else
            {
                UserId = HttpContext.Session.GetString("userId");
                if (string.IsNullOrEmpty(UserId)||UserId=="0")
                    return RedirectToPage("/Index");
                userDetails = userData.FetchById(int.Parse(UserId));
            }            
            return Page();
        }
        public IActionResult OnPost()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }
            if (userDetails.UserId > 0)
            {
                userData.Update(userDetails);
            }
            else
            {
                userData.Insert(userDetails);
                HttpContext.Session.SetString("userId", userDetails.UserId.ToString());
                HttpContext.Session.Remove("userRegister");
            }
            TempData["Message"] = "Your details were updated";
            userData.Commit();
            return RedirectToPage("./BookViewingPage");

        }
        public IActionResult OnGetLogout()
        {
            HttpContext.Session.Remove("userId");
            return RedirectToPage("/Index");
        }
    }
}