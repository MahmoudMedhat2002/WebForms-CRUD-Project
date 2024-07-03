using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CRUD_Project.DAL
{
	public interface IAuthService
	{
		bool IsUserExists(string username);
		bool Register(string username, string password);
		bool Login (string username, string password);
	}
}