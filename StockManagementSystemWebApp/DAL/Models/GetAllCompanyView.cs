﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StockManagementSystemWebApp.DAL.Models
{
    public class GetAllCompanyView
    {
        public int ItemId { get; set; }

        public string CompanyName { get; set; }
        public int CompanyId { get; set; }

        public string ItemName { get; set; }

        public int ReorderLevel { get; set; }
    }
}