using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Org.BouncyCastle.Asn1.Crmf;
using StockManagementSystemWebApp.BLL.Manager;
using StockManagementSystemWebApp.DAL.Models;

namespace StockManagementSystemWebApp.UI_Design
{
    public partial class StockInUI : System.Web.UI.Page
    {
        StockInManager stockInManager = new StockInManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ID"] != null)
            {
                if (!IsPostBack)
                {
                    Cad();
                    itemDropDownList.Items.Insert(0, new ListItem("-Item Not Available-", "0"));
                    itemDropDownList.Enabled = false;
                    avilablequantityTextBox.Text = 0.ToString();
                }
            }
            else
            {
                Response.Redirect("IndexUI.aspx");
            }
           
        }

        protected void companyDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
               int id =  Convert.ToInt32(companyDropDownList.SelectedValue);
           
              itemDropDownList.DataSource = stockInManager.GetAllItems(id);
              itemDropDownList.DataValueField = "Id";
              itemDropDownList.DataTextField = "ItemName";
              itemDropDownList.DataBind();
              itemDropDownList.Items.Insert(0, new ListItem("-Select item-", "0"));
              itemDropDownList.Enabled = true;

        }

        public void Cad()
        {
            companyDropDownList.DataSource = stockInManager.GetAllCompany();
            companyDropDownList.DataTextField = "CompanyName";
            companyDropDownList.DataValueField = "CompanyId";
            companyDropDownList.DataBind();
            companyDropDownList.Items.Insert(0, new ListItem("-Select Company-", "0"));
        }



        protected void itemDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(itemDropDownList.SelectedValue);
            if (id == 0)
            {
                recoderlevelTextBox.Text = "";
            }
            else
            {
                Item item = stockInManager.GetReoderLevel(id);
                recoderlevelTextBox.Text = item.ReorderLevel.ToString(); 
            }
                 recoderlevelTextBox.Enabled = false;
                 avilablequantityTextBox.Enabled = false;

                 StockIn stockIn = stockInManager.GetAvailabeQty(id);
            if (stockIn.AvilableQuantity == 0)
            {
                avilablequantityTextBox.Text = 0.ToString();
            }
            else
            {
                avilablequantityTextBox.Text = stockIn.AvilableQuantity.ToString();
                }
           }
           
            

        protected void stockInSaveButton_Click(object sender, EventArgs e)
        {
            if (companyDropDownList.SelectedIndex != 0)
            {
                if (itemDropDownList.SelectedIndex != 0)
                {
                    if (stockInQuantityTextBox.Text != "")
                    {
                        if (Convert.ToInt32(stockInQuantityTextBox.Text) >0)
                        {
                            StockIn stockIn = new StockIn();
                        int id = Convert.ToInt32(itemDropDownList.SelectedValue);
                        if (stockInManager.IsItemNameExits(id) == true)
                        {
                            int value = Convert.ToInt32(avilablequantityTextBox.Text) + Convert.ToInt32(stockInQuantityTextBox.Text);
                            stockIn.ItemId = id;
                            stockIn.AvilableQuantity = value;
                            outputLabel.Text = stockInManager.Update(stockIn);

                            companyDropDownList.SelectedIndex = 0;
                            itemDropDownList.SelectedIndex = 0;
                            recoderlevelTextBox.Text = "";
                            avilablequantityTextBox.Text = "";
                            stockInQuantityTextBox.Text = "";
                        }
                        else
                        {
                            int value = Convert.ToInt32(avilablequantityTextBox.Text) + Convert.ToInt32(stockInQuantityTextBox.Text);
                            stockIn.ItemId = Convert.ToInt32(itemDropDownList.SelectedValue);
                            stockIn.ReorderLevel = Convert.ToInt32(recoderlevelTextBox.Text);
                            stockIn.AvilableQuantity = value;
                            outputLabel.Text = stockInManager.Save(stockIn);

                            companyDropDownList.SelectedIndex = 0;
                            itemDropDownList.SelectedIndex = 0;
                            recoderlevelTextBox.Text = "";
                            avilablequantityTextBox.Text = "";
                            stockInQuantityTextBox.Text = "";
                          }
                        }
                        else
                        {
                            outputLabel.Text = "Stock in quantity must be a positive number!!";
                        }
 
                    }
                    else
                    {
                        outputLabel.Text = "Quantity field is empty!";
                    }
                }
                else
                {
                    outputLabel.Text = "Please Select Item";
                }
            }
            else
            {
                outputLabel.Text = "Please Select Company";
            }
            
        }

        protected void logoutButton_OnClick(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("IndexUI.aspx");
        }
    }
}