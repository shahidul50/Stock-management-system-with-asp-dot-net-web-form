using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StockManagementSystemWebApp.DAL.Gateway;
using StockManagementSystemWebApp.DAL.Models;

namespace StockManagementSystemWebApp.BLL.Manager
{
    public class CompanyManager
    {
        private CompanyGateway companyGateway;

        public CompanyManager()
        {
            companyGateway = new CompanyGateway();
        }

        public string Save(Company category)
        {
            if (companyGateway.IsExitsName(category.Name))
            {
                return "Name Already Exists";
            }
            else
            {
                int rowaffect = companyGateway.Save(category);
                if (rowaffect > 0)
                {
                    return "Save Sucessful";
                }
                else
                {
                    return "Save Faild";
                }
            }
        }

        public List<Company> GetAllCategories()
        {
            return companyGateway.GetAllCategories();
        }
    }
}