using CRUD_Project.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CRUD_Project.DAL
{
	internal interface IProductRepo
	{
		DataTable GetAll();
		DataTable GetOneById(int id);
		void InsertOne(Product product);
		void UpdateOne(Product product);
		void DeleteOne(int id);
	}
}
