using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StockManagementSystemWebApp.BLL.Manager;
using StockManagementSystemWebApp.DAL.Models;

namespace StockManagementSystemWebApp.UI_Design
{
    public partial class IndexUI : System.Web.UI.Page
    {
        UserManager userManager = new UserManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                usernameTextBox.Text = "";
                passwordTextBox.Text = "";
            }
           
        }

        protected void loginButton_Click(object sender, EventArgs e)
        {
            User user = new User();
            user.Username = usernameTextBox.Text;
            user.Password = passwordTextBox.Text;
            string output = userManager.IsExist(user);
            if (output == "1")
            {
                Session["ID"] = usernameTextBox.Text;
                Response.Redirect("HomeUI.aspx");
                
            }
            else
            {
                outputLabel.Text = "Login Faild!!";
                usernameTextBox.Text = "";
                passwordTextBox.Text = "";
            }

        }
    }
}