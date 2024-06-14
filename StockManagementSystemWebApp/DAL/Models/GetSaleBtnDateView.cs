using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StockManagementSystemWebApp.DAL.Models
{
    public class GetSaleBtnDateView
    {
        public string CompanyName { get; set; }
        public string ItemName { get; set; }
        public int StockOutQuantity { get; set; }
        public int SlNumber { get; set; }
    }
}