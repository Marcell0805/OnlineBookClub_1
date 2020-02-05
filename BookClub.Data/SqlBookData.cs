using System.Collections.Generic;
using BookClub.Core;
using System.Linq;
using Microsoft.EntityFrameworkCore;

namespace BookClub.Data
{
    public class SqlBookData : IBookInfo
    {
        private readonly BookClubDbContext db;

        public SqlBookData(BookClubDbContext db)
        {
            this.db = db;
        }
        public int Commit()
        {
            return db.SaveChanges();
        }

        public IEnumerable<BookDetails> FetchByBookId(int BookId)
        {
            return null;
        }

        public IEnumerable<BookDetails> FetchByBookName(string BookName)
        {
            if (!string.IsNullOrEmpty(BookName))
                BookName = BookName.ToUpper();
            var query = from r in db.Books
                        where r.BookName.Contains(BookName)
                        || string.IsNullOrEmpty(BookName)
                        orderby r.BookName
                        select r;
            return query;
        }

        public IEnumerable<BookDetails> GetAll()
        {
            var query = from r in db.Books                        
                        orderby r.BookName
                        select r;
            return query;
        }

        public BookDetails Insert(BookDetails bookDetails)
        {
            db.Add(bookDetails);
            return bookDetails;
        }

        public BookDetails Update(BookDetails bookDetails)
        {
            var entity = db.Books.Attach(bookDetails);
            entity.State = EntityState.Modified;
            return bookDetails;
        }
    }
}
