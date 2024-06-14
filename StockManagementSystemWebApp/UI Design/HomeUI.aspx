<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomeUI.aspx.cs" Inherits="StockManagementSystemWebApp.UI_Design.HomeUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="../Css/bootstrap.min.css" rel="stylesheet" />
    <link href="../Css/main.css" rel="stylesheet" />
    <script src="../Js/bootstrap.min.js"></script>
    <script src="../Js/jquery-3.3.1.min.js"></script>
    <script src="../Js/popper.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
   
          <div class="container-fluid">
                 <div class="row">
                          <div class="header col-sm-12">
                                <h2 class="text-center text-white">Stock Management System</h2>
                          </div>
                </div>
          </div>
         <!--Slider Section-->
          <div class="container-fluid">
                 <div class="row">
                         <div class="slider col-sm-12">
                               <img src="../Images/slider.jpg" alt="Img"  class="img-responsive" />
                         </div>
                 </div>
          </div>
          
		<!--main section-->
          <div class="container-fluid">
                  <div class="row extra">
                        <div class="Sidebar col-sm-3 float-left ">
                                <h2>MENU</h2>
                                 <ul>
                                     <li><a href="CategorySetupUI.aspx">Category Setup</a></li>
                                     <li><a href="CompanySetupUI.aspx">Company Setup</a></li>
                                     <li><a href="ItemsSetupUI.aspx">Item Setup</a></li>
                                     <li><a href="StockInUI.aspx">Stock In</a></li>
                                     <li><a href="StockOutUI.aspx">Stock Out</a></li>
                                     <li><a href="SearchUI.aspx">Search</a></li>
                                     <li><a href="ViewUI.aspx">View Sales</a></li>
                                     <li>
                                         <asp:Button ID="logoutButton" class="logout" runat="server" Text="Logout" OnClick="logoutButton_OnClick"/> 
                                     </li>
                               </ul>
                        </div>
                        <div class="mainsection col-sm-9 float-right">
                             <div class="welcomecs">
                                <h2>Welcome <asp:Label ID="welcomeLabel" runat="server" Text="Label" class="welcometext"></asp:Label></h2>
                             </div>
                        </div>
                 </div>
          </div>

        <!-- Footer Section-->
          <div class="container-fluid">
                 <div class="row">
                           <div class="footer col-sm-12">
                                 <p>CopyRight &copy; 2018</p>
                           </div>
                 </div>
          </div>
    </form>
</body>
</html>
