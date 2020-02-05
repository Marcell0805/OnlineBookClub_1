using BookClub.Core;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;

namespace BookClub.Data
{
    public class BookClubDbContext : DbContext
    {
        public DbSet<UserLogin> Users { get; set; }
        public DbSet<BookDetails> Books { get; set; }
        public BookClubDbContext(DbContextOptions<BookClubDbContext>options)
            :base(options)
        {

        }
    }
}
