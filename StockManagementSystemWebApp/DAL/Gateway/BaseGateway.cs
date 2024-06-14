using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace StockManagementSystemWebApp.DAL.Gateway
{
    public class BaseGateway
    {
        public SqlConnection connection;
        public SqlCommand command;
        public SqlDataReader reader;

        public BaseGateway()
        {
            string conString = WebConfigurationManager.ConnectionStrings["StockManagementSystemDBConnectionString"].ConnectionString;
            connection = new SqlConnection(conString);
        }
    }
}