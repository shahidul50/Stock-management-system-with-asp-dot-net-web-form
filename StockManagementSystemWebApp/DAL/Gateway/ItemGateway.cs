using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Security.AccessControl;
using System.Web;
using StockManagementSystemWebApp.DAL.Models;

namespace StockManagementSystemWebApp.DAL.Gateway
{
    public class ItemGateway: BaseGateway
    {
        public List<Category> GetAllCategories()
        {
            string query = "SELECT* FROM CategorySetup";
            command = new SqlCommand(query,connection);
            connection.Open();
            reader = command.ExecuteReader();
            List<Category> categoryList = new List<Category>();
            while (reader.Read())
            {
                Category category = new Category();
                category.Id = Convert.ToInt32(reader["Id"]);
                category.Name = reader["Name"].ToString();
                categoryList.Add(category);
            }
            reader.Close();
            connection.Close();
            return categoryList;
        }

        public List<Company> GetAllCompanys()
        {
            string query = "SELECT* FROM CompanySetup";
            command = new SqlCommand(query, connection);
            connection.Open();
            reader = command.ExecuteReader();
            List<Company> companyList = new List<Company>();
            while (reader.Read())
            {
                Company company = new Company();
                company.Id = Convert.ToInt32(reader["Id"]);
                company.Name = reader["Name"].ToString();
                companyList.Add(company);
            }
            reader.Close();
            connection.Close();
            return companyList;
        }


        public int Save(Item item)
        {
            string query = "INSERT INTO Item VALUES(@CategoryId,@CompanyId,@ItemName,@ReorderLevel)";
            command = new SqlCommand(query,connection);
            command.Parameters.AddWithValue("@CategoryId", item.CategoryId);
            command.Parameters.AddWithValue("@CompanyId", item.CompanyId);
            command.Parameters.AddWithValue("@ItemName", item.ItemName);
            command.Parameters.AddWithValue("@ReorderLevel", item.ReorderLevel);
            connection.Open();
            int rowAffect = command.ExecuteNonQuery();
            connection.Close();
            return rowAffect;
        }

        public bool IsItemNameExits(string itemname,int companyId)
        {
            string query = "SELECT * FROM Item WHERE ItemName ='" + itemname + "' and CompanyId="+companyId+"";
            command = new SqlCommand(query, connection);
            connection.Open();
            reader = command.ExecuteReader();
            bool isExists = reader.HasRows;
            connection.Close();
            return isExists;
        }
       //Exit   
    }
}