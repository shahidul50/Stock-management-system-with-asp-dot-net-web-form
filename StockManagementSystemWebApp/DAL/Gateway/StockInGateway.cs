using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using StockManagementSystemWebApp.DAL.Models;

namespace StockManagementSystemWebApp.DAL.Gateway
{
    public class StockInGateway : BaseGateway
    {
        public List<GetAllCompanyView> GetAllCompany()
       {
           string query = "SELECT DISTINCT CompanyName, CompanyId from GetAllCompany";
           command=new SqlCommand(query,connection);
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

        public List<Item> GetAllItems(int companyId)
        {
            string query = "SELECT * FROM Item WHERE CompanyId = '" + companyId + "' ";
            command = new SqlCommand(query, connection);
            connection.Open();
            reader = command.ExecuteReader();
            List<Item> itemList = new List<Item>();
            while (reader.Read())
            {
                Item item = new Item();
                item.Id = Convert.ToInt32(reader["Id"]);
                item.ItemName =reader["ItemName"].ToString();
                item.ReorderLevel = Convert.ToInt32(reader["ReorderLevel"]);
                itemList.Add(item);
            }
            reader.Close();
            connection.Close();
            return itemList;
        }

     public Item GetReoderLevel(int itemId)
        {
            string query = "SELECT ReorderLevel FROM Item WHERE Id = " + itemId + " ";
            command = new SqlCommand(query, connection);
            connection.Open();
            reader = command.ExecuteReader();
            Item item = new Item();
             while (reader.Read())
             {
             item.ReorderLevel = Convert.ToInt32(reader["ReorderLevel"]);
            }
            reader.Close();
            connection.Close();
            return item;
     }

        public int Save(StockIn stockIn)
        {
            string query = "INSERT INTO StockIn VALUES("+stockIn.ItemId+","+stockIn.ReorderLevel+","+stockIn.AvilableQuantity+",GETDATE())";
            command = new SqlCommand(query, connection);
            connection.Open();
            int rowAffect = command.ExecuteNonQuery();
            connection.Close();
            return rowAffect;
        }

        public bool IsItemNameExits(int itemid)
        {
            string query = "SELECT * FROM StockIn  WHERE ItemId  ='" + itemid + "'";
            command = new SqlCommand(query, connection);
            connection.Open();
            reader = command.ExecuteReader();
            bool isExists = reader.HasRows;
            connection.Close();
            return isExists;
        }

        public int Update(StockIn stockIn)
        {
            string query = "UPDATE StockIn SET AvailableQuantity = "+stockIn.AvilableQuantity+" where ItemId = "+stockIn.ItemId+"";
            command = new SqlCommand(query, connection);
            connection.Open();
            int rowAffect = command.ExecuteNonQuery();
            connection.Close();
            return rowAffect;
        }

        public StockIn GetAvailabeQty(int itemid)
        {
            string query = "SELECT AvailableQuantity  FROM StockIn  WHERE ItemId  ='" + itemid + "'";
            command = new SqlCommand(query, connection);
            connection.Open();
            reader = command.ExecuteReader();
            StockIn stockIn = new StockIn();
            while (reader.Read())
            {
                stockIn.AvilableQuantity = Convert.ToInt32(reader["AvailableQuantity"]);
            }
            reader.Close();
            connection.Close();
            return stockIn;
        }

        //Exit
        }
}