using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Hosting;
using System.Web.UI;
using System.Web.UI.WebControls;
using StockManagementSystemWebApp.BLL.Manager;
using StockManagementSystemWebApp.DAL.Models;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using ListItem = System.Web.UI.WebControls.ListItem;


namespace StockManagementSystemWebApp.UI_Design
{
    public partial class SearchUI : System.Web.UI.Page
    {
        SearchManager searchManager = new SearchManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ID"] != null)
            {
                if (!IsPostBack)
                {
                    Cad();
                    categoryDropDownList.DataSource = searchManager.GetAllCategoryItem();
                    categoryDropDownList.DataValueField = "CategoryId";
                    categoryDropDownList.DataTextField = "CategoryName";
                    categoryDropDownList.DataBind();
                    categoryDropDownList.Items.Insert(0, new ListItem("-Select Category-", "0"));
                }
            }
            else
            {
                Response.Redirect("IndexUI.aspx");
            }
           
           
        }
        protected void companyDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(companyDropDownList.SelectedValue);
            categoryDropDownList.DataSource = searchManager.GetAllCompanyById(id);
            categoryDropDownList.DataTextField = "CategoryName";
            categoryDropDownList.DataValueField = "CategoryId";
            categoryDropDownList.DataBind();
            categoryDropDownList.Items.Insert(0, new ListItem("-Select Category-", "0"));
          
        }
        public void Cad()
        {
            companyDropDownList.DataSource = searchManager.GetAllCompany();
            companyDropDownList.DataTextField = "CompanyName";
            companyDropDownList.DataValueField = "CompanyId";
            companyDropDownList.DataBind();
            companyDropDownList.Items.Insert(0, new ListItem("-Select Company-", "0"));
        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            int companyId = Convert.ToInt32(companyDropDownList.SelectedValue);
            int categoryId = Convert.ToInt32(categoryDropDownList.SelectedValue);

            if (companyId == 0 && categoryId == 0)
            {
                searchResultGridView.DataSource = searchManager.GetAllCompanyItem();
                searchResultGridView.DataBind();
            }
            else if(companyId != 0)
            {
                searchResultGridView.DataSource = searchManager.GetAllItemById(companyId);
                searchResultGridView.DataBind();
            }
            else if (categoryId != 0)
            {
                searchResultGridView.DataSource = searchManager.GetCategoryById(categoryId);
                searchResultGridView.DataBind();
            }
            else if (companyId != 0 && categoryId != 0)
            {
                searchResultGridView.DataSource = searchManager.GetAllCompanyAndCategoryById(categoryId, companyId);
                searchResultGridView.DataBind();  
            }
        }

        protected void exportButton_Click(object sender, EventArgs e)
        {

            Response.ContentType = "application/pdf";
            Response.AppendHeader("content-disposition", "attachment;filename=Stock.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);

            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
          
            panelPDF.RenderControl(hw);
            StringReader sr = new StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 10f);
            HTMLWorker htmlWorker = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);

            pdfDoc.Open();
            htmlWorker.Parse(sr);
            pdfDoc.Close();

            Response.Write(pdfDoc);
            Response.End();
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            return;
        }

        protected void logoutButton_OnClick(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("IndexUI.aspx");
        }
        //Exit
    }
}