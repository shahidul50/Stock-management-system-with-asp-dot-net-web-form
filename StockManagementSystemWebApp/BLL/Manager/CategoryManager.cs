using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StockManagementSystemWebApp.DAL.Gateway;
using StockManagementSystemWebApp.DAL.Models;

namespace StockManagementSystemWebApp.BLL.Manager
{
    public class CategoryManager
    {
        private CategoryGateway categoryGateway;
        public CategoryManager()
        {
            categoryGateway = new CategoryGateway();
        }

        public string Save(Category category)
        {
            if (categoryGateway.IsExitsName(category.Name))
            {
                return "Name Is Already Exists";
            }
            else
            {
                int rowaffect = categoryGateway.Save(category);
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

        public List<Category> GetAllCategories()
        {
            return categoryGateway.GetAllCategories();

        }

        public Category GetCategoryByID(int id)
        {
            return categoryGateway.GetCategoryByID(id);
        }

        public string Update(Category category)
        {
            int rowaffect = categoryGateway.Update(category);
            if (rowaffect > 0)
            {
                return "Update Sucessful";
            }
            else
            {
                return "Update Faild";
            }
        }
    }
}