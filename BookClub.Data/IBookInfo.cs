
using BookClub.Core;
using System.Collections.Generic;

namespace BookClub.Data
{
    public interface IBookInfo
    {
        IEnumerable<BookDetails> FetchByBookId(int BookId);

        IEnumerable<BookDetails> FetchByBookName(string BookName);
        BookDetails Update(BookDetails bookDetails);
        BookDetails Insert(BookDetails bookDetails);
        int Commit();
        IEnumerable<BookDetails> GetAll();
    }
}
