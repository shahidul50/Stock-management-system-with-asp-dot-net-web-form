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
    public partial class CategoryUpdateUI : System.Web.UI.Page
    {
        CategoryManager categoryManager = new CategoryManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ID"] != null)
            {
                if (!IsPostBack)
                {
                    int id = Convert.ToInt32(Request.QueryString["Id"]);
                    Category category = categoryManager.GetCategoryByID(id);
                    if (category != null)
                    {
                        LoadCategoryfrom(category);
                    }
                    outputLabel.Text = "";
                }
            }
            else
            {
                Response.Redirect("IndexUI.aspx");
            }
        }


        protected void logoutButton_OnClick(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("IndexUI.aspx");
        }

      

        protected void updateButton_OnClick(object sender, EventArgs e)
        {
           Category category = new Category();
            category.Id = Convert.ToInt32(HiddenFieldId.Value);
            category.Name = nameTextBox.Text;
            outputLabel.Text = categoryManager.Update(category);
            nameTextBox.Text = "";
        }

        public void LoadCategoryfrom(Category category)
        {
            HiddenFieldId.Value = category.Id.ToString();
            nameTextBox.Text = category.Name;
        }
    }
}