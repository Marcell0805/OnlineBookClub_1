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
    public class BookViewingPageModel : PageModel
    {
        private readonly IConfiguration config;
        private readonly IBookInfo bookInfo;
        [BindProperty(SupportsGet = true)]
        public string SearchTerm { get; set; }

        public IEnumerable<BookDetails> bookDetails { get; set; }
        public BookViewingPageModel(IConfiguration config, IBookInfo bookInfo)
        {
            this.config = config;
            this.bookInfo = bookInfo;
        }
        public void OnGet()
        {
            bookDetails = bookInfo.FetchByBookName(SearchTerm);
        }
        public void OnPost()
        {
        }
    }
}