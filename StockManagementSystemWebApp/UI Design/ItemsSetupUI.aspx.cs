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
    public partial class ItemsSetupUI : System.Web.UI.Page
    {
     ItemManager itemManager = new ItemManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ID"] != null)
            {
                if (!IsPostBack)
                {

                    categoryDropDownList.DataSource = itemManager.GetAllCategories();

                    categoryDropDownList.DataTextField = "Name";
                    categoryDropDownList.DataValueField = "Id";

                    categoryDropDownList.DataBind();

                    companyDropDownList.DataSource = itemManager.GetAllCompanys();
                    companyDropDownList.DataTextField = "Name";
                    companyDropDownList.DataValueField = "Id";
                    companyDropDownList.DataBind();
                }
            }
            else
            {
                Response.Redirect("IndexUI.aspx");
            }
         
          
            
        }

        protected void itemSaveButton_Click(object sender, EventArgs e)
        {
            if (categoryDropDownList.SelectedIndex != 0)
            {
                if (companyDropDownList.SelectedIndex != 0)
                {
                    if (itemnameTextBox.Text != "")
                    {
                        
                            Item item = new Item();
                            item.CategoryId = Convert.ToInt32(categoryDropDownList.SelectedValue);
                            item.CompanyId = Convert.ToInt32(companyDropDownList.SelectedValue);
                            item.ItemName = itemnameTextBox.Text;
                            if (reorderlevelTextBox.Text == "")
                            {
                                item.ReorderLevel = 0;
                            }
                            else
                            {
                                int nn = Convert.ToInt32(reorderlevelTextBox.Text);
                                if ( nn>= 0)
                                {
                                    item.ReorderLevel = Convert.ToInt32(reorderlevelTextBox.Text);
                                    outputLabel.Text = itemManager.Save(item);
                                    categoryDropDownList.SelectedIndex = 0;
                                    companyDropDownList.SelectedIndex = 0;
                                    itemnameTextBox.Text = "";
                                    reorderlevelTextBox.Text = "";
                                }
                                else
                                {
                                    outputLabel.Text = "Reorder level must be a positive number!!";
                                }
                               
                            }
                           
                        
                        
                    }
                    else
                    {
                        outputLabel.Text = "Item Name is Empty!";
                    }
                }
                else
                {
                    outputLabel.Text = "Please Select Your Company";
                }
            }
            else
            {
                outputLabel.Text = "Please Select Your Category";
            }
           
        }


        protected void logoutButton_OnClick(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("IndexUI.aspx");
        }
    }
}