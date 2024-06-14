using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StockManagementSystemWebApp.DAL.Models
{
    [Serializable]
    public class StockOutStore
    {
        public int SL { get; set; }
        public string CompanyName { get; set; }
        public string ItemName { get; set; }
        public int StockOutQuantity { get; set; }
        public int ReorderLevel { get; set; }
        public int ItemId { get; set; }
        public int CompanyId { get; set; }
        public int AvailableQuantity { get; set; }
        public string Action { get; set; }

       
    }
}