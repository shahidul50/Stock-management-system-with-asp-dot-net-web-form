using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using StockManagementSystemWebApp.DAL.Models;

namespace StockManagementSystemWebApp.DAL.Gateway
{
    public class StockOutGateway: BaseGateway
    {
        public List<GetAllCompanyView> GetAllCompany()
        {
            string query = "SELECT DISTINCT CompanyName, CompanyId from GetAllCompany";
            command = new SqlCommand(query, connection);
            connection.Open();
            reader = command.ExecuteReader();
            List<GetAllCompanyView> itemList = new List<GetAllCompanyView>();
            while (reader.Read())
            {
                GetAllCompanyView itemView = new GetAllCompanyView();

                itemView.CompanyName = reader["CompanyName"].ToString();
                itemView.CompanyId = Convert.ToInt32(reader["CompanyId"]);

                itemList.Add(itemView);
            }
            reader.Close();
            connection.Close();
            return itemList;
        }
        public List<GetItemView> GetAllItems(int companyId)
        {
            string query = "SELECT * From GetItemView WHERE CompanyId = '" + companyId + "' ";
            command = new SqlCommand(query, connection);
            connection.Open();
            reader = command.ExecuteReader();
            List<GetItemView> itemList = new List<GetItemView>();
            while (reader.Read())
            {
                GetItemView item = new GetItemView();
                item.ItemId = Convert.ToInt32(reader["ItemId"]);
                item.ItemName = reader["ItemName"].ToString();
                item.ReorderLevel = Convert.ToInt32(reader["ReorderLevel"]);
                itemList.Add(item);
            }
            reader.Close();
            connection.Close();
            return itemList;
        }

        public StockIn GetReoderLevel(int itemId)
        {
            string query = "SELECT ReorderLevel,AvailableQuantity FROM StockIn WHERE ItemId = " + itemId + " ";
            command = new SqlCommand(query, connection);
            connection.Open();
            reader = command.ExecuteReader();
            StockIn stockIn = new StockIn();
            while (reader.Read())
            {
                stockIn.ReorderLevel = Convert.ToInt32(reader["ReorderLevel"]);
                stockIn.AvilableQuantity = Convert.ToInt32(reader["AvailableQuantity"]);
            }
            reader.Close();
            connection.Close();
            return stockIn;
        }

        public int Save(StockOutStore stockOutStore)
        {
            string query = "INSERT INTO StockOut VALUES("+stockOutStore.ItemId+","+stockOutStore.ReorderLevel+","+stockOutStore.StockOutQuantity+",GETDATE(),'"+stockOutStore.Action+"')";
            command = new SqlCommand(query, connection);
            connection.Open();
            int rowAffect = command.ExecuteNonQuery();
            connection.Close();
            return rowAffect;
        }

        public int Update(StockOutStore stockOutStore)
        {
            string query = "UPDATE StockIn SET AvailableQuantity = "+stockOutStore.AvailableQuantity+" where ItemId = "+stockOutStore.ItemId+" ";
            command = new SqlCommand(query, connection);
            connection.Open();
            int rowAffect = command.ExecuteNonQuery();
            connection.Close();
            return rowAffect;
        }

        public StockOutStore GetStockAvilableValue(StockOutStore stockOutStore)
        {
            string query = "SELECT AvailableQuantity from GetItemView  WHERE ItemId = "+stockOutStore.ItemId+" and CompanyId = "+stockOutStore.CompanyId+" ";
            command = new SqlCommand(query, connection);
            connection.Open();
            reader = command.ExecuteReader();
           StockOutStore stockOut = new StockOutStore();
            while (reader.Read())
            {
                stockOut.AvailableQuantity = Convert.ToInt32(reader["AvailableQuantity"]);
            }
            reader.Close();
            connection.Close();
            return stockOut;
        }
        //Exit
    }
}