using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StockManagementSystemWebApp.DAL.Gateway;
using StockManagementSystemWebApp.DAL.Models;

namespace StockManagementSystemWebApp.BLL.Manager
{
    public class StockOutManager
    {
        private StockOutGateway stockOutGateway;

        public StockOutManager()
        {
            stockOutGateway  = new StockOutGateway();
        }
        public List<GetAllCompanyView> GetAllCompany()
        {
            return stockOutGateway.GetAllCompany();
        }

        public List<GetItemView> GetAllItems(int companyId)
        {
            return stockOutGateway.GetAllItems(companyId);
        }

        public StockIn GetReoderLevel(int itemId)
        {
            return stockOutGateway.GetReoderLevel(itemId);
        }

        public string Save(StockOutStore stockOutStore)
        {
            int rowAffect = stockOutGateway.Save(stockOutStore);
            if (rowAffect > 0)
            {
                return "All Information Save Successful";
            }
            else
            {
                return "Save Faild";
            }
        }


        public void Update(StockOutStore stockOutStore)
        {
            stockOutGateway.Update(stockOutStore);
        }

        public StockOutStore GetStockAvilableValue(StockOutStore stockOutStore)
        {
           StockOutStore stockOutAvailableQty = stockOutGateway.GetStockAvilableValue(stockOutStore);
            return stockOutAvailableQty;
        }

        //Exit
    }
}