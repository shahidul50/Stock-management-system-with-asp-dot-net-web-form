using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StockManagementSystemWebApp.DAL.Gateway;
using StockManagementSystemWebApp.DAL.Models;

namespace StockManagementSystemWebApp.BLL.Manager
{
    
    public class ViewManager
    {
        private ViewGateway viewGateway;

        public ViewManager()
        {
            viewGateway = new ViewGateway();
        }

        public List<GetSaleBtnDateView> GetDataBtnDate(string fromDate, string toDate)
        {
            return viewGateway.GetDataBtnDate(fromDate, toDate);
        }

        //Exit
    }
}