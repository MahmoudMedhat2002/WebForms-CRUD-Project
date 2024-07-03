using CRUD_Project.BLL;
using CRUD_Project.Models;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRUD_Project
{
	public partial class Register : System.Web.UI.Page
	{
		private readonly AuthBBL authBBL;
        public Register()
        {
            authBBL = new AuthBBL();
        }
        protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void Registerbtn_Click(object sender, EventArgs e)
		{
			User user = new User();
			var encryptedpass = FormsAuthentication.HashPasswordForStoringInConfigFile(Passtxt.Text , "SHA1");
			user.UserName = Emailtxt.Text;
			user.Password = encryptedpass;
			if (authBBL.Register(user))
			{
				FormsAuthentication.RedirectToLoginPage();
			}
			else
			{
				resLabel.ForeColor = Color.Red;
				resLabel.Text = "Invalid Credentials";
			}
		}

		protected void main_Click(object sender, EventArgs e)
		{
			Response.Redirect("~/Welcome.aspx");
		}
	}
}