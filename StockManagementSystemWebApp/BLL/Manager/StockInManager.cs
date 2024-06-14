using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StockManagementSystemWebApp.DAL.Gateway;
using StockManagementSystemWebApp.DAL.Models;

namespace StockManagementSystemWebApp.BLL.Manager
{
    public class StockInManager
    {
        private StockInGateway stockInGateway;

        public StockInManager()
        {
            stockInGateway = new StockInGateway();
        }
        public List<GetAllCompanyView> GetAllCompany()
        {
            return stockInGateway.GetAllCompany();
        }


        public List<Item> GetAllItems(int companyId)
        {
            return stockInGateway.GetAllItems(companyId);
        }

       public Item GetReoderLevel(int itemId)
      {
           return stockInGateway.GetReoderLevel(itemId);
       }

        public string Save(StockIn stockIn)
        {
            int rowAffect = stockInGateway.Save(stockIn);
            if (rowAffect > 0)
            {
                return "Save Sucessful";
            }
            else
            {
                return "Save Faild";
            }
        }

        public bool IsItemNameExits(int itemid)
        {
            return stockInGateway.IsItemNameExits(itemid);
        }

        public string Update(StockIn stockIn)
        {
            int rowAffect = stockInGateway.Update(stockIn);
            if (rowAffect > 0)
            {
                return "update Sucessful";
            }
            else
            {
                return "update Faild";
            }
        }

        public StockIn GetAvailabeQty(int itemid)
        {
            return stockInGateway.GetAvailabeQty(itemid);
        }

        //Exit
    }
}