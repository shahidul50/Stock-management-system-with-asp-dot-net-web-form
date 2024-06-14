using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using StockManagementSystemWebApp.DAL.Models;

namespace StockManagementSystemWebApp.DAL.Gateway
{
    public class CategoryGateway : BaseGateway
    {
       
        public int Save(Category category)
        {
            string query = "INSERT INTO CategorySetup(name)VALUES(@Name)";
            command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@Name", category.Name);
            connection.Open();
            int rowAffect = command.ExecuteNonQuery();
            connection.Close();
            return rowAffect;
        }

        public List<Category> GetAllCategories()
        {
            string query = "SELECT * FROM CategorySetup";
            command = new SqlCommand(query, connection);
            connection.Open();
            reader = command.ExecuteReader();
            int slNumber = 0;
            List<Category> categoryList = new List<Category>();
            
            while (reader.Read())
            {
                slNumber++;
                Category category = new Category();
                category.Id = Convert.ToInt32(reader["Id"]);
                category.Name = reader["Name"].ToString();
                category.SerialNumber = slNumber;
                categoryList.Add(category);
            }
            reader.Close();
            connection.Close();
            return categoryList;
        }

        public bool IsExitsName(string name)
        {
            string query = "SELECT * FROM CategorySetup WHERE Name ='" + name + "'";
            command = new SqlCommand(query, connection);
            connection.Open();
            reader = command.ExecuteReader();
            bool isExists = reader.HasRows;
            connection.Close();
            return isExists;
        }

        public Category GetCategoryByID(int id)
        {
            string query = "SELECT * FROM CategorySetup WHERE Id =" + id + "";
            command = new SqlCommand(query, connection);
            connection.Open();
            Category category = null;
            reader = command.ExecuteReader();
            if (reader.HasRows)
            {
                category = new Category();
                reader.Read();
                category.Id = Convert.ToInt32(reader["Id"]);
                category.Name = reader["Name"].ToString();
            }
            reader.Close();
            connection.Close();
            return category;
        }

        public int Update(Category category)
        {
            string query = "Update CategorySetup SET Name = '"+category.Name+"' WHERE Id = "+category.Id+" ";
            command = new SqlCommand(query, connection);
            connection.Open();
            int rowAffect = command.ExecuteNonQuery();
            connection.Close();
            return rowAffect;
        }
        //Exit------
    }
}