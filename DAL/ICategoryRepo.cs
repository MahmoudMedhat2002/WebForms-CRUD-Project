using CRUD_Project.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CRUD_Project.DAL
{
	internal interface ICategoryRepo
	{
		List<Category> GetAll();
	}
}
