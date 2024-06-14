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
    public partial class CategorySetupUI : System.Web.UI.Page
    {
        CategoryManager categoryManager = new CategoryManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ID"] != null)
            {
                if (!IsPostBack)
                {
                    categoryGridView.DataSource = categoryManager.GetAllCategories();
                    categoryGridView.DataBind();
                    outputLabel.Text = "";
                }
            }
            else
            {
                Response.Redirect("IndexUI.aspx");
            }
           
        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            
                Category category = new Category();
                category.Name = nameTextBox.Text;
                categoryManager = new CategoryManager();
                nameTextBox.Text = "";
                outputLabel.Text = categoryManager.Save(category);

                categoryGridView.DataSource = categoryManager.GetAllCategories();
                categoryGridView.DataBind();
            

        }

        protected void logoutButton_OnClick(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("IndexUI.aspx");
        }

        protected void updateLinkButton_OnClick(object sender, EventArgs e)
        {
            LinkButton linkUpdateButton = sender as LinkButton;
            DataControlFieldCell cell = linkUpdateButton.Parent as DataControlFieldCell;
            GridViewRow row = cell.Parent as GridViewRow;
            HiddenField idHiddenField = row.FindControl("idHiddenField") as HiddenField;
            int id = Convert.ToInt32(idHiddenField.Value);
            Response.Redirect("CategoryUpdateUI.aspx?Id=" + id);
        }
    }
}