using BookClub.Core;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;

namespace BookClub.Data
{
    public class BookClubInfoDbContext :DbContext
    {
        public DbSet<UserLogin> Users { get; set; }

        public DbSet<BookDetails> Books { get; set; }
    }
}
