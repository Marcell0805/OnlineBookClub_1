using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BookClub.Data;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace OnlineBookClub.Service.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly BookClubDbContext _userdata;

        public UsersController(BookClubDbContext dbContext)
        {
            _userdata = dbContext;
        }
        // GET: api/Users
        

    }
}