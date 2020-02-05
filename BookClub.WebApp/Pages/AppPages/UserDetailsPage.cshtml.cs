using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BookClub.Core;
using BookClub.Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Configuration;

namespace BookClub.App
{
    public class UserDetailsPageModel : PageModel
    {
        private readonly IConfiguration config;
        private readonly IUserinfo userInfo;
        public IEnumerable<UserLogin> userDetails { get; set; }

        public UserDetailsPageModel(IConfiguration config, IUserinfo userInfo)
        {
            this.config = config;
            this.userInfo = userInfo;
        }

        public void OnGet()
        {
            
        }
    }
}