using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StockManagementSystemWebApp.DAL.Gateway;
using StockManagementSystemWebApp.DAL.Models;

namespace StockManagementSystemWebApp.BLL.Manager
{
    public class ItemManager
    {
        
        private ItemGateway itemGateway;


        public ItemManager()
        {    
            itemGateway = new ItemGateway();
        }
        public List<Category> GetAllCategories()
        {
            return itemGateway.GetAllCategories();
        }

         public List<Company> GetAllCompanys()
         {
             return itemGateway.GetAllCompanys();
         }

        public string Save(Item item)
        {
            if (itemGateway.IsItemNameExits(item.ItemName,item.CompanyId))
            {
                return "Item Name Already Exists";
            }
            else
            {
                int rowAffect = itemGateway.Save(item);
                if (rowAffect > 0)
                {
                    return "Save Sucessful";
                }
                else
                {
                    return "Save Faild";
                }
            }
          
        }

        //Exit
    }
}