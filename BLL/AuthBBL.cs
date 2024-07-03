using CRUD_Project.DAL;
using CRUD_Project.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CRUD_Project.BLL
{
	public class AuthBBL
	{
        private readonly IAuthService _authService;
        public AuthBBL()
        {
            _authService = new AuthService();
        }

        public bool Login(User user)
        {
            return _authService.Login(user.UserName, user.Password);
        }

		public bool Register(User user)
		{
			return _authService.Register(user.UserName, user.Password);
		}
	}
}