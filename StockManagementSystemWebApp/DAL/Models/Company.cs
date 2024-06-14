using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StockManagementSystemWebApp.DAL.Models
{
    public class Company
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int SerialNumber { get; set; }
    }
}