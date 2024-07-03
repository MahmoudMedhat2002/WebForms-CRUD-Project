using CRUD_Project.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRUD_Project
{
	public partial class ProductHome : System.Web.UI.Page
	{
		private readonly ProductBBL _productBBL;
        public ProductHome()
        {
            _productBBL = new ProductBBL();
        }
        protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				DataTable dt = _productBBL.GetAllProducts();
				GridView1.DataSource = dt;
				GridView1.DataBind();
			}
		}

		protected void Button1_Click(object sender, EventArgs e)
		{
			Response.Redirect("~/CreateProuct.aspx");
		}

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
			if(e.CommandName == "Update")
			{
				int index = Convert.ToInt32(e.CommandArgument);
				var row = GridView1.Rows[index];
				Response.Redirect($"~/UpdateProduct.aspx?name={row.Cells[3].Text}&desc={row.Cells[4].Text}&price={row.Cells[5].Text}&id={row.Cells[2].Text}&catName={row.Cells[6].Text}");
			}
			if(e.CommandName == "Delete")
			{
				int index = Convert.ToInt32(e.CommandArgument);
				var row = GridView1.Rows[index];
				_productBBL.DeleteProduct(int.Parse(row.Cells[2].Text));
				Response.Redirect(Request.RawUrl);
			}
			
        }
    }
}