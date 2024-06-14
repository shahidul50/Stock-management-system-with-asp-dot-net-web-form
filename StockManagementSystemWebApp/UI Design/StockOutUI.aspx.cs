using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StockManagementSystemWebApp.BLL.Manager;
using StockManagementSystemWebApp.DAL.Gateway;
using StockManagementSystemWebApp.DAL.Models;

namespace StockManagementSystemWebApp.UI_Design
{
    public partial class StockOutUI : System.Web.UI.Page
    {
        StockOutManager stockOutManager = new StockOutManager();
        StockOutStore stockOutStore = new StockOutStore();

        List<StockOutStore> ItemList = new List<StockOutStore>();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ID"] != null)
            {
                if (!IsPostBack)
                {
                    Cad();
                    itemDropDownList.Items.Insert(0, new ListItem("-Item Not Available-", "0"));
                    itemDropDownList.Enabled = false;
                }
                outputLabel.Text = "";
            }
            else
            {
                Response.Redirect("IndexUI.aspx");
            }
        }

        public void Cad()
        {
            companyDropDownList.DataSource = stockOutManager.GetAllCompany();
            companyDropDownList.DataTextField = "CompanyName";
            companyDropDownList.DataValueField = "CompanyId";
            companyDropDownList.DataBind();
            companyDropDownList.Items.Insert(0, new ListItem("-Select Company-", "0"));
        }

        protected void companyDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(companyDropDownList.SelectedValue);

            itemDropDownList.DataSource = stockOutManager.GetAllItems(id);
            itemDropDownList.DataValueField = "ItemId";
            itemDropDownList.DataTextField = "ItemName";
            itemDropDownList.DataBind();
            itemDropDownList.Items.Insert(0, new ListItem("-Select item-", "0"));
            itemDropDownList.Enabled = true;
        }

        protected void itemDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(itemDropDownList.SelectedValue);
            if (id == 0)
            {
                recoderlevelTextBox.Text = "";
                avilablequantityTextBox.Text = "";
            }
            else
            {
                StockIn stockIn = stockOutManager.GetReoderLevel(id);
                recoderlevelTextBox.Text = stockIn.ReorderLevel.ToString();
                avilablequantityTextBox.Text = stockIn.AvilableQuantity.ToString();
            }
            recoderlevelTextBox.Enabled = false;
            avilablequantityTextBox.Enabled = false;
        }

        protected void stockOutAddButton_Click(object sender, EventArgs e)
        {

            if (companyDropDownList.SelectedIndex != 0)
            {
                if (itemDropDownList.SelectedIndex != 0)
                {
                    if (stockOutQuantityTextBox.Text != "")
                    {
                        int availavleQty = Convert.ToInt32(avilablequantityTextBox.Text);
                        int stockoutQty = Convert.ToInt32(stockOutQuantityTextBox.Text);
                        if (availavleQty >= stockoutQty)
                        {
                            addData(companyDropDownList.SelectedItem.ToString(), itemDropDownList.SelectedItem.ToString(), Convert.ToInt32(stockOutQuantityTextBox.Text), availavleQty, Convert.ToInt32(recoderlevelTextBox.Text), Convert.ToInt32(itemDropDownList.SelectedValue), Convert.ToInt32(companyDropDownList.SelectedValue));
                            companyDropDownList.SelectedIndex = 0;
                            itemDropDownList.SelectedIndex = 0;
                            recoderlevelTextBox.Text = "";
                            avilablequantityTextBox.Text = "";
                            stockOutQuantityTextBox.Text = "";
                            stockOutGridView.DataSource = ItemList;
                            stockOutGridView.DataBind();
                        }
                        else
                        {
                            outputLabel.Text = "Your Available Quantity is " + availavleQty;
                        }

                    }
                    else
                    {
                        outputLabel.Text = "Write Your Quantity";
                    }
                }
                else
                {
                    outputLabel.Text = "Select Your Item";
                }
            }
            else
            {
                outputLabel.Text = "Select Your Company";
            }
   
        }

        public void addData(string company, string item, int stockOutQty,int avilableQty,int reorderlevel,int itemId,int companyId)
        {

            stockOutStore.CompanyName = company;
            stockOutStore.ItemName = item;
            stockOutStore.StockOutQuantity = stockOutQty;
            stockOutStore.ReorderLevel = reorderlevel;
            stockOutStore.ItemId = itemId;
            stockOutStore.CompanyId = companyId;
           
            if (ViewState["ItemsVS"] == null)
            {
                ItemList.Add(stockOutStore);
                ViewState["ItemsVS"] = ItemList;
            }
            else
            {
                ItemList = (List<StockOutStore>)ViewState["ItemsVS"];
                foreach (StockOutStore stock in ItemList)
                {  
                    string com = stock.CompanyName;
                    string itema = stock.ItemName;
                    int qty = stock.StockOutQuantity;
                    int sll = stock.SL;
                    if (com == company && itema == item)
                    {
                        int  hasStock = qty + stockOutQty;
                        if (hasStock <= avilableQty)
                        {
                            stock.StockOutQuantity = hasStock;
                        }
                        else
                        {
                            outputLabel.Text = "Your Available Quantity is " + avilableQty;
                        }
                        break;
                    }
                    else
                    {
                         continue;
                    }

                }
                if (GetData(stockOutStore.CompanyName, stockOutStore.ItemName)== false)
                {
                    ItemList = (List<StockOutStore>)ViewState["ItemsVS"];
                    ItemList.Add(stockOutStore);
                    ViewState["ItemsVS"] = ItemList;
                }
            }
             
        }

        public bool GetData(string c, string it)
        {
            bool r = false;
            int row = stockOutGridView.Rows.Count;

            for (int i = 0; i < row; i++)
            {
                Label lbl = stockOutGridView.Rows[i].Cells[1].FindControl("Label7") as Label;
                string companyN = lbl.Text;
                Label lbl1 = stockOutGridView.Rows[i].Cells[2].FindControl("Label8") as Label;
                string itemName = lbl1.Text;
                if (companyN == c && itemName == it)
                {
                    r = true;
                }
                else
                {
                   continue;
                }
            }
            return r;
        }

        protected void sellButton_Click(object sender, EventArgs e)
        {
            string action = "Sell";
            ItemList = (List<StockOutStore>)ViewState["ItemsVS"];
            if (ItemList != null)
            {
                foreach (StockOutStore stock in ItemList)
                {
                    int stockQty = stock.StockOutQuantity;
                    StockOutStore stockOutAQty = stockOutManager.GetStockAvilableValue(stock);
                    int avQty = Convert.ToInt32(stockOutAQty.AvailableQuantity);
                    int summation = avQty - stockQty;
                    stock.AvailableQuantity = summation;
                    stock.Action = action;
                    stockOutManager.Update(stock);
                    outputLabel.Text = stockOutManager.Save(stock);
                }
                stockOutGridView.DataSource = null;
                stockOutGridView.DataBind();
                ItemList.Clear();
            }
            else
            {
                outputLabel.Text = "No data";
            }
          

        }

        protected void damageButton_Click(object sender, EventArgs e)
        {
            string action = "Damage";
            ItemList = (List<StockOutStore>)ViewState["ItemsVS"];
            if (ItemList != null)
            {
                foreach (StockOutStore stock in ItemList)
                {
                    int stockQty = stock.StockOutQuantity;
                    StockOutStore stockOutAQty = stockOutManager.GetStockAvilableValue(stock);
                    int avQty = Convert.ToInt32(stockOutAQty.AvailableQuantity);
                    int summation = avQty - stockQty;
                    stock.AvailableQuantity = summation;
                    stock.Action = action;
                    stockOutManager.Update(stock);
                    outputLabel.Text = stockOutManager.Save(stock);
                }
                stockOutGridView.DataSource = null;
                stockOutGridView.DataBind();
                ItemList.Clear();
            }
            else
            {
                outputLabel.Text = "No Data";
            }
         
        }

        protected void lostButton_Click(object sender, EventArgs e)
        {
            string action = "Lost";
            ItemList = (List<StockOutStore>)ViewState["ItemsVS"];
            if (ItemList != null)
            {
                foreach (StockOutStore stock in ItemList)
                {
                    int stockQty = stock.StockOutQuantity;
                    StockOutStore stockOutAQty = stockOutManager.GetStockAvilableValue(stock);
                    int avQty = Convert.ToInt32(stockOutAQty.AvailableQuantity);
                    int summation = avQty - stockQty;
                    stock.AvailableQuantity = summation;
                    stock.Action = action;
                    stockOutManager.Update(stock);
                    outputLabel.Text = stockOutManager.Save(stock);
                }
                stockOutGridView.DataSource = null;
                stockOutGridView.DataBind();
                ItemList.Clear();
            }
            else
            {
                outputLabel.Text = "No Data";
            }
           
        }
       
        protected void logoutButton_OnClick(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("IndexUI.aspx");
        }
        //Exit
    }
}