using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StockManagementSystemWebApp.UI_Design
{
    public partial class HomeUI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ID"] != null)
            {
               
                welcomeLabel.Text = Session["ID"].ToString();
            }
            else
            {
                Response.Redirect("IndexUI.aspx");
            }
        }

        protected void logoutButton_OnClick(object sender, EventArgs e)
        {
           Session.RemoveAll();
           Response.Redirect("IndexUI.aspx");
        }
    }
}