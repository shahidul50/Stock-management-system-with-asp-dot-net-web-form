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
    public partial class CompanySetupUI : System.Web.UI.Page
    {
        CompanyManager companyManager = new CompanyManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ID"] != null)
            {
                companyGridView.DataSource = companyManager.GetAllCategories();
                companyGridView.DataBind();
            }
            else
            {
                Response.Redirect("IndexUI.aspx");
            }
           
        }

        protected void companySaveButton_Click(object sender, EventArgs e)
        {
           
                Company company = new Company();
                company.Name = companyNameTextBox.Text;
                companyManager = new CompanyManager();
                companyNameTextBox.Text = "";
                outputLabel.Text = companyManager.Save(company);

                companyGridView.DataSource = companyManager.GetAllCategories();
                companyGridView.DataBind();
            

        }

        protected void logoutButton_OnClick(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("IndexUI.aspx");
        }
    }
}