using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CRUD_Project.Models
{
	public class Product
	{
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public decimal Price { get; set; }
        public int category_id { get; set; }
    }
}