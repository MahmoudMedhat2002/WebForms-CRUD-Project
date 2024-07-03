using CRUD_Project.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace CRUD_Project.DAL
{
	public class ProductRepo : IProductRepo
	{
        public void DeleteOne(int id)
		{
			using (DatabaseHelper DB = new DatabaseHelper())
			{
				var command = DB.CreateCommand("Products_DeleteOne");
				command.CommandType = CommandType.StoredProcedure;
				command.Parameters.AddWithValue("@id", id);
				command.ExecuteNonQuery();
			}
		}

		public DataTable GetAll()
		{
			using (DatabaseHelper DB = new DatabaseHelper())
			{
				var command = DB.CreateCommand("Products_GetAll");
				command.CommandType = CommandType.StoredProcedure;
				DataTable products = new DataTable();
				SqlDataAdapter adapter = new SqlDataAdapter(command);
				adapter.Fill(products);
				return products;
			}
			
		}

		public DataTable GetOneById(int id)
		{
			using (DatabaseHelper DB = new DatabaseHelper())
			{
				var command = DB.CreateCommand("Products_GetOne");
				command.CommandType = CommandType.StoredProcedure;
				command.Parameters.AddWithValue("@id", id);
				DataTable products = new DataTable();
				SqlDataAdapter adapter = new SqlDataAdapter(command);
				adapter.Fill(products);
				return products;
			}
		}

		public void InsertOne(Product product)
		{
			using (DatabaseHelper DB = new DatabaseHelper())
			{
				var command = DB.CreateCommand("Products_InsertOne");
				command.CommandType = CommandType.StoredProcedure;
				command.Parameters.AddWithValue("@name", product.Name);
				command.Parameters.AddWithValue("@description", product.Description);
				command.Parameters.AddWithValue("@price", product.Price);
				command.Parameters.AddWithValue("@catId", product.category_id);
				command.ExecuteNonQuery();
			}
		}

		public void UpdateOne(Product product)
		{ 
			using (DatabaseHelper DB = new DatabaseHelper())
			{
				var command = DB.CreateCommand("Products_UpdateOne");
				command.CommandType = CommandType.StoredProcedure;
				command.Parameters.AddWithValue("@id", product.Id);
				command.Parameters.AddWithValue("@name", product.Name);
				command.Parameters.AddWithValue("@description", product.Description);
				command.Parameters.AddWithValue("@price", product.Price);
				command.Parameters.AddWithValue("@catId", product.category_id);
				command.ExecuteNonQuery();
			}
		}
	}
}