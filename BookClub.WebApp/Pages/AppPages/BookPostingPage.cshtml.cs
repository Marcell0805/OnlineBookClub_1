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
    public class BookPostingPageModel : PageModel
    {
        private readonly IConfiguration config;
        private readonly IBookInfo bookInfo;
        [BindProperty]
        public BookDetails BookDetails{ get; set; }

        public IEnumerable<BookDetails> bookDetails { get; set; }
        public BookPostingPageModel(IConfiguration config, IBookInfo bookInfo)
        {
            this.config = config;
            this.bookInfo = bookInfo;
        }
        public IActionResult OnGet()
        {
            BookDetails = new BookDetails();
            return Page();
        }
        public IActionResult OnPost()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }
            if (BookDetails.BookNumber>0)
            {
                bookInfo.Update(BookDetails);
            }
            else
            {
                bookInfo.Insert(BookDetails);
            }
            bookInfo.Commit();
            return RedirectToPage("./BookViewingPage");
        }
    }
}