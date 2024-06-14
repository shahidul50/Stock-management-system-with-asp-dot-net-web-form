using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StockManagementSystemWebApp.BLL.Manager;

namespace StockManagementSystemWebApp.UI_Design
{
    public partial class ViewUI : System.Web.UI.Page
    {
        ViewManager viewManager = new ViewManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ID"] != null)
            {
                if (!IsPostBack)
                {
                    Calendar1.Visible = false;
                    Calendar2.Visible = false;
                }
                fromDateTextBox.Enabled = false;
                toDateTextBox.Enabled = false;
            }
            else
            {
                Response.Redirect("IndexUI.aspx");
            }
          
        }

        protected void fromDateImageButton_Click(object sender, ImageClickEventArgs e)
        {
            if (Calendar1.Visible)
            {
                Calendar1.Visible = false;
            }
            else
            {
                Calendar1.Visible = true;
            }
           
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            fromDateTextBox.Text = Calendar1.SelectedDate.ToString("dd/MM/yyyy");
            Calendar1.Visible = false;
        }

        protected void toDateImageButton_Click(object sender, ImageClickEventArgs e)
        {
            if (Calendar2.Visible)
            {
                Calendar2.Visible = false;
            }
            else
            {
                Calendar2.Visible = true;
            }
        }

        protected void Calendar2_SelectionChanged(object sender, EventArgs e)
        {
            toDateTextBox.Text = Calendar2.SelectedDate.ToString("dd/MM/yyyy");
            Calendar2.Visible = false;
        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            CultureInfo myCultureInfo = new CultureInfo("de-DE");
            string fromDate = fromDateTextBox.Text;
            string toDate = toDateTextBox.Text;
           
           
            if (fromDate == "" && toDate == "")
            {
                outputLabel.Text = "Please Select Date";
            }
            else
            {
                DateTime dt1 = DateTime.Parse(fromDate, myCultureInfo);
                DateTime dt2 = DateTime.Parse(toDate, myCultureInfo);
               
                if (dt1.Date > dt2.Date)
                {
                    outputLabel.Text = "From Date is Larger Then To Date";
                    viewResultGridView.DataSource = null;
                    viewResultGridView.DataBind();
                }
                else
                {
                    outputLabel.Text = "";
                    viewResultGridView.DataSource = viewManager.GetDataBtnDate(fromDate, toDate);
                    viewResultGridView.DataBind();
                }
            }
           
            
        }

        protected void logoutButton_OnClick(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("IndexUI.aspx");
        }
    }
}