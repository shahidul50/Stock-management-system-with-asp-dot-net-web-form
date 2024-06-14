using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using StockManagementSystemWebApp.DAL.Models;

namespace StockManagementSystemWebApp.DAL.Gateway
{
    public class ViewGateway : BaseGateway
    {
        public List<GetSaleBtnDateView> GetDataBtnDate(string fromDate,string toDate)
        {
            string query =
                "SELECT CompanyName,ItemName,StockOutQuantity FROM GetSalesBtnDateView  WHERE EntryDate between '" +
                fromDate + "' and '" + toDate + "' ";
            command = new SqlCommand(query, connection);
            connection.Open();
            reader = command.ExecuteReader();
            int SlNumber = 0;
            List<GetSaleBtnDateView> getSaleBtnDateList = new List<GetSaleBtnDateView>();
            while (reader.Read())
            {
                SlNumber++;
                GetSaleBtnDateView getSaleBtnDate = new GetSaleBtnDateView();
                getSaleBtnDate.CompanyName = reader["CompanyName"].ToString();
                getSaleBtnDate.ItemName = reader["ItemName"].ToString();
                getSaleBtnDate.StockOutQuantity = Convert.ToInt32(reader["StockOutQuantity"]);
                getSaleBtnDate.SlNumber = SlNumber;
                getSaleBtnDateList.Add(getSaleBtnDate);
            }
            reader.Close();
            connection.Close();
            return getSaleBtnDateList;
        } 
    }
}