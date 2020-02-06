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
    public class BookDetailsController : ControllerBase
    {
        private readonly BookClubDbContext _context;

        public BookDetailsController(BookClubDbContext context)
        {
            _context = context;
        }

        // GET: api/BookDetails
        [HttpGet]
        public IEnumerable<BookDetails> GetBooks()
        {
            return _context.Books;
        }

        // GET: api/BookDetails/5
        [HttpGet("{id}")]
        public async Task<IActionResult> GetBookDetails([FromRoute] int id)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var bookDetails = await _context.Books.FindAsync(id);

            if (bookDetails == null)
            {
                return NotFound();
            }

            return Ok(bookDetails);
        }

        // PUT: api/BookDetails/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutBookDetails([FromRoute] int id, [FromBody] BookDetails bookDetails)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != bookDetails.BookNumber)
            {
                return BadRequest();
            }

            _context.Entry(bookDetails).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!BookDetailsExists(id))
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

        // POST: api/BookDetails
        [HttpPost]
        public async Task<IActionResult> PostBookDetails([FromBody] BookDetails bookDetails)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            _context.Books.Add(bookDetails);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetBookDetails", new { id = bookDetails.BookNumber }, bookDetails);
        }

        // DELETE: api/BookDetails/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteBookDetails([FromRoute] int id)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var bookDetails = await _context.Books.FindAsync(id);
            if (bookDetails == null)
            {
                return NotFound();
            }

            _context.Books.Remove(bookDetails);
            await _context.SaveChangesAsync();

            return Ok(bookDetails);
        }

        private bool BookDetailsExists(int id)
        {
            return _context.Books.Any(e => e.BookNumber == id);
        }
    }
}