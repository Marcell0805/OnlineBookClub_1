
using BookClub.Core;
using System.Collections.Generic;

namespace BookClub.Data
{
    public interface IBookInfo
    {
        IEnumerable<BookDetails> FetchByBookId(int BookId);

        IEnumerable<BookDetails> FetchByBookName(string BookName);

        IEnumerable<BookDetails> GetAll();
    }
}
