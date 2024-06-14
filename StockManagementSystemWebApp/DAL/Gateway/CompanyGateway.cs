using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using StockManagementSystemWebApp.DAL.Models;

namespace StockManagementSystemWebApp.DAL.Gateway
{
    public class CompanyGateway: BaseGateway
    {
        public int Save(Company company)
        {
            string query = "INSERT INTO CompanySetup(name)values(@Name)";
            command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@Name", company.Name);
            connection.Open();
            int rowAffect = command.ExecuteNonQuery();
            connection.Close();
            return rowAffect;
        }

        public List<Company> GetAllCategories()
        {
            string query = "SELECT * FROM CompanySetup";
            command = new SqlCommand(query, connection);
            connection.Open();
            reader = command.ExecuteReader();
            int slNumber = 0;
            List<Company> companyList = new List<Company>();
            while (reader.Read())
            {
                slNumber++;
                Company company = new Company();
                company.Id = Convert.ToInt32(reader["Id"]);
                company.Name = reader["Name"].ToString();
                company.SerialNumber = slNumber;
                companyList.Add(company);
            }
            reader.Close();
            connection.Close();
            return companyList;
        }

        public bool IsExitsName(string name)
        {
            string query = "SELECT * FROM CompanySetup WHERE Name ='" + name + "'";
            command = new SqlCommand(query, connection);
            connection.Open();
            reader = command.ExecuteReader();
            bool isExists = reader.HasRows;
            connection.Close();
            return isExists;
        }

        //Exit------
    }
}