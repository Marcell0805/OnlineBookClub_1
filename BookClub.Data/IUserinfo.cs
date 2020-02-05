using BookClub.Core;
using System.Collections.Generic;

namespace BookClub.Data
{
    public interface IUserinfo
    {
        IEnumerable<UserLogin> CheckLogin(string Username, string Password);

        UserLogin FetchById(int UserId);

        UserLogin Update(UserLogin updatedDetails);
        UserLogin Insert(UserLogin updatedDetails);
        int Commit();

        IEnumerable<UserLogin> GetAll();
    }
}
