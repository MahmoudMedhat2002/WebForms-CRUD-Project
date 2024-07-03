using CRUD_Project.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace CRUD_Project.DAL
{
	public class CategoryRepo : ICategoryRepo
	{ 
		public List<Category> GetAll()
		{
			using(DatabaseHelper db = new DatabaseHelper())
			{
				var command = db.CreateCommand("Categories_GetAll");
				command.CommandType = CommandType.StoredProcedure;

				var reader = command.ExecuteReader();

				List<Category> categories = new List<Category>();

				while(reader.Read())
				{
					var category = new Category();
					category.Id = reader.GetInt32(0);
					category.Name = reader.GetString(1);
					categories.Add(category);
				}

				return categories;
			}
		}
	}
}