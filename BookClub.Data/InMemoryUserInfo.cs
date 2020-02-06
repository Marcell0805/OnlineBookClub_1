using BookClub.Core;
using System.Collections.Generic;
using System.Linq;

namespace BookClub.Data
{
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

        public UserLogin FetchById(int UserId)
        {
            return UserList.SingleOrDefault(r => r.UserId == UserId);
        }

        public IEnumerable<UserLogin> GetAll()
        {
            return from r in UserList
                   orderby r.UserId
                   select r;
        }

        public UserLogin Update(UserLogin updatedDetails)
        {
            var userDetails = UserList.SingleOrDefault(r => r.UserId == updatedDetails.UserId);
            if (updatedDetails != null)
            {
                userDetails.UserName = updatedDetails.UserName;
                userDetails.UserSurname = updatedDetails.UserSurname;
                userDetails.UserEmail = updatedDetails.UserEmail;
                userDetails.Password = updatedDetails.Password;
            }
            return updatedDetails;
        }

        public int Commit()
        {
            return 0;
        }

        public UserLogin Insert(UserLogin updatedDetails)
        {
            UserList.Add(updatedDetails);
            updatedDetails.UserId = UserList.Max(r => r.UserId) + 1;
            return updatedDetails;
        }
    }
}
