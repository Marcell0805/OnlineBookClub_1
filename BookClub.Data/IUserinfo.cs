using BookClub.Core;
using System.Collections.Generic;

namespace BookClub.Data
{
    public interface IUserinfo
    {
        IEnumerable<UserLogin> CheckLogin(string Username, string Password);

        UserLogin FetchById(int UserId);

        IEnumerable<UserLogin> GetAll();
    }
}
