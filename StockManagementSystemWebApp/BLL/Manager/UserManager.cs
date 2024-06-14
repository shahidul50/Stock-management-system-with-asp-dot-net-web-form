using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StockManagementSystemWebApp.DAL.Gateway;
using StockManagementSystemWebApp.DAL.Models;

namespace StockManagementSystemWebApp.BLL.Manager
{
    public class UserManager
    {
        UserGateway userGateway = new UserGateway();
        public string IsExist(User user)
        {
            string row = userGateway.IsExist(user);
            return row;
        }
    }
}