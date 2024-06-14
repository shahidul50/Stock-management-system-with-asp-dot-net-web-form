<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CategoryUpdateUI.aspx.cs" Inherits="StockManagementSystemWebApp.UI_Design.CategoryUpdateUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Category Update</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link href="../Css/bootstrap.min.css" rel="stylesheet" />
    <link href="../Css/main.css" rel="stylesheet" />


    <link href="https://fonts.googleapis.com/css?family=Noto+Serif" rel="stylesheet"/>

      <style>
        label.error {
            color: red;
        }
    </style>
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
                                     <li><a href="CategorySetupUI.aspx" >Category Setup</a></li>
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
                                        
                            <div class="row">
                                  <div class="mainsectionheader  col-sm-12 ">
                                       <h3 class="text-center">Category Update</h3>
                                  </div>
                            </div>
                                     
                            <div class="col-sm-12 text-center text-danger font-weight-bold">
                                 <asp:Label ID="outputLabel" runat="server" Text="" style="color: green;"></asp:Label>
                            </div>
                                 <div class="tablesection col-sm-12 ">
                  
                                            <table>
                                                <tr>
                                                    <th class="auto-style1">
                                                        <asp:Label for="nameTextBox" ID="Label1" runat="server" Text="Name" CssClass="part1"></asp:Label>
                                                    </th>
                                                    <th class="auto-style1">
                                                        <asp:TextBox ID="nameTextBox" runat="server" Width="340px" Height="40px"  class="part2" placeholder="Enter a Category Name" style="margin-right: 15px;"></asp:TextBox>
                                                        <asp:HiddenField ID="HiddenFieldId" runat="server" />
                                                    </th>
                                                </tr>
                                            </table>
                                         
                                           
                                  </div>
                                         <div class="col-sm-12 sbutton">
                                             <asp:Button ID="updateButton" runat="server" Text="Update" Width="126px" Height="47px" class="bg-success text-white font-weight-bold " OnClick="updateButton_OnClick"  />
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
