using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StockManagementSystemWebApp.DAL.Models
{
    public class GetAllCategoryView
    {
        public string ItemName { get; set; }
        public string CompanyName { get; set; }
        public int AvailableQuantity { get; set; }
        public int ReorderLevel { get; set; }
        public int CompanyId { get; set; }
        public int SlNumber { get; set; }

        public int CategoryId { get; set; }
        public string CategoryName { get; set; }
    }
}