using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Web;
using System.Web.UI.WebControls;
using System.Data;

namespace CRUD_Project.DAL
{
	public class AuthService : IAuthService
	{
		public bool Login(string username, string password)
		{
			if(!IsUserExists(username))
				return false;

			using(DatabaseHelper db = new DatabaseHelper())
			{
				var command = db.CreateCommand("Users_login");
				command.CommandType = CommandType.StoredProcedure;
				command.Parameters.AddWithValue("@username", username);
				command.Parameters.AddWithValue("@password", password);

				var res = (int)command.ExecuteScalar();

				if(res == 1)
					return true;
				else
					return false;
			}
		}

		public bool Register(string username, string password)
		{
			if(IsUserExists(username))
				return false;

			using (DatabaseHelper db = new DatabaseHelper())
			{
				var command = db.CreateCommand("Users_InsertUser");
				command.CommandType = CommandType.StoredProcedure;
				command.Parameters.AddWithValue("@id", Guid.NewGuid().ToString());
				command.Parameters.AddWithValue("@username", username);
				command.Parameters.AddWithValue("@password", password);
				command.ExecuteNonQuery();

				return true;
			}
		}

		public bool IsUserExists(string username)
		{
			using (DatabaseHelper db = new DatabaseHelper())
			{
				var command = db.CreateCommand("Users_IsExists");
				command.CommandType = CommandType.StoredProcedure;
				command.Parameters.AddWithValue("@username", username);

				var res = (int)command.ExecuteScalar();

				if (res == 1)
					return true;
				else
					return false;
			}
		}
	}
}