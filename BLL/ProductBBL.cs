using CRUD_Project.DAL;
using CRUD_Project.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace CRUD_Project.BLL
{
	public class ProductBBL
	{
		private readonly IProductRepo _productRepo;
		public ProductBBL()
		{
			_productRepo = new ProductRepo();
		}

		public DataTable GetAllProducts()
		{
			return _productRepo.GetAll();
		}

		public void InsertProduct(Product product)
		{
			if(product != null)
				_productRepo.InsertOne(product);
		}

		public void UpdateProduct(Product product)
		{
			if(product != null)
			{
				_productRepo.UpdateOne(product);
			}
			
		}

		public void DeleteProduct(int id)
		{
			_productRepo.DeleteOne(id);
		}
	}
}