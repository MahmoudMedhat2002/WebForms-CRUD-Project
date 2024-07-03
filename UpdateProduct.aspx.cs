using CRUD_Project.BLL;
using CRUD_Project.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRUD_Project
{
	public partial class UpdateProduct : System.Web.UI.Page
	{
		private readonly ProductBBL _productBBL;
		private readonly CategoryBBL _categoryBBL;
		public UpdateProduct()
        {
            _productBBL = new ProductBBL();
			_categoryBBL = new CategoryBBL();
		}

        protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				List<Category> categories = _categoryBBL.GetCategories();
				foreach (var cat in categories)
				{
					ListItem li = new ListItem();
					li.Text = cat.Name;
					li.Value = cat.Id.ToString();
					List1.Items.Add(li);
				}
				NameInput.Text = Request.QueryString["name"];
				DescInput.Text = Request.QueryString["desc"];
				PriceInput.Text = Request.QueryString["price"];
				List1.SelectedValue = categories.FirstOrDefault(c => c.Name.Equals(Request.QueryString["catName"])).Id.ToString();
			}
			
		}

        protected void UpdateProductbtn_Click(object sender, EventArgs e)
        {
			Product product = new Product();
			product.Id = int.Parse(Request.QueryString["id"]);
			product.Name = NameInput.Text;
			product.Description = DescInput.Text;
			product.Price = decimal.Parse(PriceInput.Text);
			product.category_id = int.Parse(List1.SelectedValue);
			_productBBL.UpdateProduct(product);
			Response.Redirect("~/ProductHome.aspx");
		}
    }
}