using BookClub.Core;
using System;
using System.Collections.Generic;
using System.Linq;

namespace BookClub.Data
{
    public interface IUserinfo
    {
        IEnumerable<UserLogin> CheckLogin(string Username, string Password);

        IEnumerable<UserLogin> FetchById(int UserId);

        IEnumerable<UserLogin> GetAll();
    }
    public class InMemoryUserInfo : IUserinfo
    {
        public List<UserLogin> UserList;
        public InMemoryUserInfo()
        {
            UserList = new List<UserLogin>()
            {
                new UserLogin { UserId = 1, UserName = "Marcell", UserSurname = "Smit", UserEmail = "email@gmail.com",Password="password1"},
                new UserLogin { UserId = 2, UserName = "John", UserSurname = "Doe", UserEmail = "email2@gmail.com",Password="abc" },
                new UserLogin { UserId = 3, UserName = "Jack", UserSurname = "Black", UserEmail = "email3@gmail.com",Password="123" }
            };
        }

        public IEnumerable<UserLogin> CheckLogin(string Username, string Password)
        {
            return from r in UserList
                   where r.UserName==Username && r.Password==Password
                   orderby r.UserId
                   select r;
        }

        public IEnumerable<UserLogin> FetchById(int UserId)
        {
            return from r in UserList
                   where r.UserId == UserId
                   orderby r.UserId
                   select r;
        }

        public IEnumerable<UserLogin> GetAll()
        {
            return from r in UserList
                   orderby r.UserId
                   select r;
        }
    }
}
