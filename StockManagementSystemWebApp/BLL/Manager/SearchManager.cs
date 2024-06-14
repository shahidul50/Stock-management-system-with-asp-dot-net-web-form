using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StockManagementSystemWebApp.DAL.Gateway;
using StockManagementSystemWebApp.DAL.Models;

namespace StockManagementSystemWebApp.BLL.Manager
{
    public class SearchManager
    {
        private SearchGateway searchGateway;

        public SearchManager()
        {
            searchGateway = new SearchGateway();
        }
        public List<GetAllCompanyView> GetAllCompany()
        {
            return searchGateway.GetAllCompany();
        }
        public List<GetAllCategoryView> GetAllItemById(int companyId)
        {
            return searchGateway.GetAllItemById(companyId);
        }

        public List<GetAllCategoryView> GetAllCompanyItem()
        {
            return searchGateway.GetAllCompanyItem();
        }

        public List<GetAllCategoryView> GetAllCompanyById(int companyId)
        {
            return searchGateway.GetAllCompanyById(companyId);
        }

        public List<GetAllCategoryView> GetAllCompanyAndCategoryById(int categoryId, int companyId)
        {
            return searchGateway.GetAllCompanyAndCategoryById(categoryId, companyId);
        }

        public List<GetAllCategoryView> GetAllCategoryItem()
        {
            return searchGateway.GetAllCategoryItem();
        }

        public List<GetAllCategoryView> GetCategoryById(int categoryId)
        {
            return searchGateway.GetCategoryById(categoryId);
        }

        //Exit
    }
}