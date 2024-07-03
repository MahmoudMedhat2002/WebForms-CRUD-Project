using CRUD_Project.DAL;
using CRUD_Project.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CRUD_Project.BLL
{
	public class CategoryBBL
	{
        private readonly ICategoryRepo _categoryRepo;
        public CategoryBBL()
        {
            _categoryRepo = new CategoryRepo();
        }

        public List<Category> GetCategories()
        {
            return _categoryRepo.GetAll();
        }
    }
}