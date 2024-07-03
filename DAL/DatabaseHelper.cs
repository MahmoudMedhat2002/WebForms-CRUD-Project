using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace CRUD_Project.DAL
{
	public class DatabaseHelper : IDisposable
	{
		private readonly SqlConnection _conn;

        public DatabaseHelper()
        {
            string constr = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
            _conn = new SqlConnection(constr);
        }

        public SqlCommand CreateCommand(string query)
        {
            var command = new SqlCommand(query,_conn);
            _conn.Open();
            return command;
        }

		public void Dispose()
		{
			_conn.Close();
		}
	}
}