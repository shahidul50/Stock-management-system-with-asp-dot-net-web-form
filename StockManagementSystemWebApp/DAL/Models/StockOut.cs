using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StockManagementSystemWebApp.DAL.Models
{
 
    public class StockOut
    {

        public int Id { get; set; }
        public int CompanyId { get; set; }
        public int ItemId { get; set; }
        public int RecoderLevel { get; set; }
        public int StockOutQuantity { get; set; }
        public DateTime StockOutEntryDate { get; set; }

      
    }
}