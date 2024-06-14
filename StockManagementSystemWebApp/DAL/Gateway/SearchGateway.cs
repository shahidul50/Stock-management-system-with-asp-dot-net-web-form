using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using StockManagementSystemWebApp.DAL.Models;

namespace StockManagementSystemWebApp.DAL.Gateway
{
    public class SearchGateway: BaseGateway
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
                itemView.CompanyId = Convert.ToInt32(reader["CompanyId"]);
                itemView.CompanyName = reader["CompanyName"].ToString();
                itemList.Add(itemView);
            }
            reader.Close();
            connection.Close();
            return itemList;
        }

        public List<GetAllCategoryView> GetAllItemById(int companyId)
        {
            string query = "SELECT ItemName,CompanyName,AvailableQuantity,ReorderLevel FROM  GetAllCategoryView WHERE CompanyId =" + companyId + " ";
            command = new SqlCommand(query, connection);
            connection.Open();
            reader = command.ExecuteReader();
            int slNumber = 0;
            List<GetAllCategoryView> itemList = new List<GetAllCategoryView>();
            while (reader.Read())
            {
                slNumber++;

                GetAllCategoryView item = new GetAllCategoryView();
             
                item.ItemName = reader["ItemName"].ToString();
                item.CompanyName = reader["CompanyName"].ToString();
                item.AvailableQuantity = Convert.ToInt32(reader["AvailableQuantity"]);
                item.ReorderLevel = Convert.ToInt32(reader["ReorderLevel"]);
                item.SlNumber = slNumber;
                itemList.Add(item);
            }
            reader.Close();
            connection.Close();
            return itemList;
        }

        public List<GetAllCategoryView> GetAllCompanyItem()
        {
            string query = "SELECT ItemName,CompanyName,AvailableQuantity,ReorderLevel FROM  GetAllCategoryView";
            command = new SqlCommand(query, connection);
            connection.Open();
            reader = command.ExecuteReader();
            int slNumber = 0;
            List<GetAllCategoryView> itemList = new List<GetAllCategoryView>();
            while (reader.Read())
            {
                slNumber++;

                GetAllCategoryView item = new GetAllCategoryView();

                item.ItemName = reader["ItemName"].ToString();
                item.CompanyName = reader["CompanyName"].ToString();
                item.AvailableQuantity = Convert.ToInt32(reader["AvailableQuantity"]);
                item.ReorderLevel = Convert.ToInt32(reader["ReorderLevel"]);
                item.SlNumber = slNumber;
                itemList.Add(item);
            }
            reader.Close();
            connection.Close();
            return itemList;
        }

        public List<GetAllCategoryView> GetAllCompanyById(int companyId)
        {
            string query = "SELECT DISTINCT CategoryName,CategoryId FROM  GetAllCategoryView WHERE CompanyId =" + companyId + " ";
            command = new SqlCommand(query, connection);
            connection.Open();
            reader = command.ExecuteReader();
            List<GetAllCategoryView> itemList = new List<GetAllCategoryView>();
            while (reader.Read())
            {
                GetAllCategoryView item = new GetAllCategoryView();
                item.CategoryId = Convert.ToInt32(reader["CategoryId"]);
                item.CategoryName = reader["CategoryName"].ToString();
                itemList.Add(item);
            }
            reader.Close();
            connection.Close();
            return itemList;
        }

        public List<GetAllCategoryView> GetAllCompanyAndCategoryById(int categoryId,int companyId)
        {
            string query = "SELECT ItemName,CompanyName,AvailableQuantity,ReorderLevel FROM  GetAllCategoryView WHERE CategoryId = " + categoryId + " and CompanyId =" + companyId + "";
            command = new SqlCommand(query, connection);
            connection.Open();
            reader = command.ExecuteReader();
            int slNumber = 0;
            List<GetAllCategoryView> itemList = new List<GetAllCategoryView>();
            while (reader.Read())
            {
                slNumber++;
                GetAllCategoryView item = new GetAllCategoryView();
                item.ItemName = reader["ItemName"].ToString();
                item.CompanyName = reader["CompanyName"].ToString();
                item.AvailableQuantity = Convert.ToInt32(reader["AvailableQuantity"]);
                item.ReorderLevel = Convert.ToInt32(reader["ReorderLevel"]);
                item.SlNumber = slNumber;
                itemList.Add(item);
            }
            reader.Close();
            connection.Close();
            return itemList;
        }
        public List<GetAllCategoryView> GetAllCategoryItem()
        {
            string query = "SELECT DISTINCT CategoryName, CategoryId FROM  GetAllCategoryView";
            command = new SqlCommand(query, connection);
            connection.Open();
            reader = command.ExecuteReader();
            List<GetAllCategoryView> itemList = new List<GetAllCategoryView>();
            while (reader.Read())
            {
                GetAllCategoryView item = new GetAllCategoryView();
                item.CategoryId = Convert.ToInt32(reader["CategoryId"]);
                item.CategoryName = reader["CategoryName"].ToString();
                itemList.Add(item);
            }
            reader.Close();
            connection.Close();
            return itemList;
        }

        public List<GetAllCategoryView> GetCategoryById(int categoryId)
        {
            string query = "SELECT ItemName,CompanyName,AvailableQuantity,ReorderLevel FROM  GetAllCategoryView WHERE CategoryId = " + categoryId + " ";
            command = new SqlCommand(query, connection);
            connection.Open();
            reader = command.ExecuteReader();
            int slNumber = 0;
            List<GetAllCategoryView> itemList = new List<GetAllCategoryView>();
            while (reader.Read())
            {
                slNumber++;
                GetAllCategoryView item = new GetAllCategoryView();
                item.ItemName = reader["ItemName"].ToString();
                item.CompanyName = reader["CompanyName"].ToString();
                item.AvailableQuantity = Convert.ToInt32(reader["AvailableQuantity"]);
                item.ReorderLevel = Convert.ToInt32(reader["ReorderLevel"]);
                item.SlNumber = slNumber;
                itemList.Add(item);
            }
            reader.Close();
            connection.Close();
            return itemList;
        }
        //Exit
    }
}