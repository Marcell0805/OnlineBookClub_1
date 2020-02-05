
using BookClub.Core;
using System.Collections.Generic;
using System.Linq;

namespace BookClub.Data
{
    public class InMemoryBookInfo: IBookInfo
    {
        public List<BookDetails> BookList;
        public InMemoryBookInfo()
        {
            BookList = new List<BookDetails>()
            {
                new BookDetails { BookNumber = 1, BookName = "Dark Be Light", Author = "Smity",BookRating = 1},
                new BookDetails { BookNumber = 2, BookName = "Candle Burn",Author = "John Doe",BookRating = 2,},
                new BookDetails { BookNumber = 3, BookName = "The Power Grid",Author = "Black",BookRating =3}
            };
        }

        public int Commit()
        {
            return 0;
        }

        public IEnumerable<BookDetails> FetchByBookId(int BookId)
        {
            return from r in BookList
                   where r.BookNumber==BookId
                   orderby r.BookNumber
                   select r;
        }

        public IEnumerable<BookDetails> FetchByBookName(string BookName=null)
        {
            if (!string.IsNullOrEmpty(BookName))
                BookName=BookName.ToUpper();
            return from r in BookList
                   where string.IsNullOrEmpty(BookName)|| r.BookName.ToUpper().Contains(BookName)
                   orderby r.BookNumber
                   select r;
        }

        public IEnumerable<BookDetails> GetAll()
        {
            return from r in BookList
                   orderby r.BookNumber
                   select r;
        }

        public BookDetails Insert(BookDetails bookDetails)
        {
            BookList.Add(bookDetails);
            bookDetails.BookNumber = BookList.Max(r=>r.BookNumber)+1;
            return bookDetails;
        }

        public BookDetails Update(BookDetails bookDetails)
        {
            var bookList = BookList.SingleOrDefault(r => r.BookNumber == bookDetails.BookNumber);
            if (bookDetails != null)
            {
                bookList.BookName = bookDetails.BookName;
                bookList.BookRating = bookDetails.BookRating;
                bookList.Author = bookDetails.Author;
            }
            return bookList;
        }
    }
}
