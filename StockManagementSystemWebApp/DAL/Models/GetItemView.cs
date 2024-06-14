using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StockManagementSystemWebApp.DAL.Models
{
    public class GetItemView
    {
        public int ItemId { get; set; }
        public int CompanyId { get; set; }

        public string ItemName { get; set; }

        public int ReorderLevel { get; set; }
        public int AvilableQuantity { get; set; }
    }
}