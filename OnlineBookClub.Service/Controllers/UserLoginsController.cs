using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using BookClub.Core;
using BookClub.Data;

namespace OnlineBookClub.Service.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserLoginsController : ControllerBase
    {
        private readonly BookClubDbContext _context;

        public UserLoginsController(BookClubDbContext context)
        {
            _context = context;
        }

        // GET: api/UserLogins
        [HttpGet]
        public IEnumerable<UserLogin> GetUsers()
        {
            return _context.Users;
        }

        // GET: api/UserLogins/5
        [HttpGet("{id}")]
        public async Task<IActionResult> GetUserLogin([FromRoute] int id)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var userLogin = await _context.Users.FindAsync(id);

            if (userLogin == null)
            {
                return NotFound();
            }

            return Ok(userLogin);
        }

        [HttpGet("/UserName", Name ="GetUserByLogin")]
        public async Task<IActionResult> GetUserLoginDetails(string UserName, string Password)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var userLogin =  _context.Users.FirstOrDefault(p=>p.UserName==UserName&& p.Password==Password);

            if (userLogin == null)
            {
                return NotFound();
            }

            return Ok(userLogin);
        }

        // PUT: api/UserLogins/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutUserLogin([FromRoute] int id, [FromBody] UserLogin userLogin)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != userLogin.UserId)
            {
                return BadRequest();
            }

            _context.Entry(userLogin).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!UserLoginExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/UserLogins
        [HttpPost]
        public async Task<IActionResult> PostUserLogin([FromBody] UserLogin userLogin)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            _context.Users.Add(userLogin);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetUserLogin", new { id = userLogin.UserId }, userLogin);
        }

        // DELETE: api/UserLogins/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteUserLogin([FromRoute] int id)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var userLogin = await _context.Users.FindAsync(id);
            if (userLogin == null)
            {
                return NotFound();
            }

            _context.Users.Remove(userLogin);
            await _context.SaveChangesAsync();

            return Ok(userLogin);
        }

        private bool UserLoginExists(int id)
        {
            return _context.Users.Any(e => e.UserId == id);
        }
    }
}