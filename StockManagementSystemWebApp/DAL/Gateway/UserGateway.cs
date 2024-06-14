using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using StockManagementSystemWebApp.DAL.Models;

namespace StockManagementSystemWebApp.DAL.Gateway
{
    public class UserGateway: BaseGateway
    {
        public string IsExist(User user)
        {
            string query = "select count(*) from Account where Username = '"+user.Username+"' and Password = '"+user.Password+"'";
            command = new SqlCommand(query,connection);
            connection.Open();
            string rowAffect = command.ExecuteScalar().ToString();
            connection.Close();
            return rowAffect;
        }
    }
}