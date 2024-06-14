<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ItemsSetupUI.aspx.cs" Inherits="StockManagementSystemWebApp.UI_Design.ItemsSetupUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Item Setup</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link href="../Css/bootstrap.min.css" rel="stylesheet" />
    <link href="../Css/main.css" rel="stylesheet" />
  

    <link href="https://fonts.googleapis.com/css?family=Noto+Serif" rel="stylesheet"/>
</head>
<body>
    <form id="ItemForm" runat="server">
   
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
                 
                             <div class="row">
                                  <div class="mainsectionheader  col-sm-12 ">
                                       <h3 class="text-center">Item Setup</h3>
                                  </div>
                            </div>
                            
                             <div class="col-sm-12 text-center text-danger font-weight-bold">
                                     <asp:Label ID="outputLabel" runat="server" Text="" style="color: green;"></asp:Label>
                            </div>

                                    <div class="tablesection col-sm-12">
                  
                                        <table>
                                            <tr>
                                                <th class="auto-style1">
                                                    <asp:Label ID="Label2" runat="server" Text="Category" CssClass="part1"></asp:Label>
                                                </th>
                                                <th class="auto-style1">
                                                    <asp:DropDownList ID="categoryDropDownList" runat="server" A Height="40px" Width="340px" AutoPostBack="True" AppendDataBoundItems="True">
                                                        
                                                        <asp:ListItem Text="-Select Category-" Value="0"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </th>
                                            </tr>
                                            
                                              <tr>
                                                <th class="auto-style1">
                                                    <asp:Label ID="Label1" runat="server" Text="Company" CssClass="part1"></asp:Label>
                                                </th>
                                                <th class="auto-style1">
                                                    <asp:DropDownList ID="companyDropDownList" runat="server" Height="40px" Width="340px" AutoPostBack="True" AppendDataBoundItems="True">
                                                       <asp:ListItem Text="-Select Company-" Value="0"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </th>
                                            </tr>
                                            
                                              <tr>
                                                <th class="auto-style1">
                                                    <asp:Label ID="Label3" runat="server" Text="Item Name" CssClass="part1"></asp:Label>
                                                </th>
                                                <th class="auto-style1">
                                                    <asp:TextBox ID="itemnameTextBox" runat="server" Width="340px" Height="40px" class="part2"></asp:TextBox>
                                                </th>
                                            </tr>
                                            
                                              <tr>
                                                <th class="auto-style1">
                                                    <asp:Label ID="Label4" runat="server" Text="Reorder Level" CssClass="part1"></asp:Label>
                                                </th>
                                                <th class="auto-style1">
                                                    <asp:TextBox ID="reorderlevelTextBox" runat="server" Width="340px" Height="40px" class="part2"></asp:TextBox>
                                                </th>
                                            </tr>
                                            
                                        </table>
                                    
                                    </div>
                                         <div class="col-sm-12 sbutton">
                                              <asp:Button ID="itemSaveButton" runat="server" Text="Save" Width="126px" Height="47px" class="bg-success text-white font-weight-bold " OnClick="itemSaveButton_Click"  />
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
    <script src="../Js/bootstrap.min.js"></script>
    <script src="../Js/jquery-3.3.1.min.js"></script>
    <script src="../Js/popper.min.js"></script>
     <script src="../Scripts/jquery.validate.js"></script>
   
</body>
</html>
