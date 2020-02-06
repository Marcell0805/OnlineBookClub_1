using BookClub.Core;
using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.EntityFrameworkCore;

namespace BookClub.Data
{
    public class SqlUsersData : IUserinfo
    {
        private readonly BookClubDbContext _db;

        public SqlUsersData(BookClubDbContext db)
        {
            _db = db;
        }
        public IEnumerable<UserLogin> CheckLogin(string Username, string Password)
        {
            var query = from r in _db.Users
                where r.UserName == Username && r.Password == Password
                        orderby r.UserName
                select r;
            if(query.ToList().Count()==0)
            {
                query = null;
            }
            return query;
        }

        public int Commit()
        {
            return _db.SaveChanges();
        }

        public UserLogin FetchById(int UserId)
        {
            return _db.Users.SingleOrDefault(r => r.UserId == UserId);
        }

        public IEnumerable<UserLogin> GetAll()
        {
            var query = from r in _db.Users
                orderby r.UserName
                select r;
            return query;
        }

        public UserLogin Insert(UserLogin updatedDetails)
        {
            _db.Add(updatedDetails);
            return updatedDetails;
        }

        public UserLogin Update(UserLogin updatedDetails)
        {
            var entity = _db.Users.Attach(updatedDetails);
            entity.State = EntityState.Modified;
            return updatedDetails;
        }
    }
}
