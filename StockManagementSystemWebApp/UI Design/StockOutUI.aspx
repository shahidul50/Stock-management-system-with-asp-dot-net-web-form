<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StockOutUI.aspx.cs" Inherits="StockManagementSystemWebApp.UI_Design.StockOutUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Stock Out</title>
     <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="../Css/bootstrap.min.css" rel="stylesheet" />
    <link href="../Css/main.css" rel="stylesheet" />
    <script src="../Js/bootstrap.min.js"></script>
    <script src="../Js/jquery-3.3.1.min.js"></script>
    <script src="../Js/popper.min.js"></script>
    
      <link href="https://fonts.googleapis.com/css?family=Noto+Serif" rel="stylesheet">
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
                 
                             <div class="row">
                                  <div class="mainsectionheader  col-sm-12 ">
                                       <h3 class="text-center">Stock Out</h3>
                                  </div>
                            </div>
                            
                             <div class="col-sm-12 text-center text-danger font-weight-bold">
                                     <asp:Label ID="outputLabel" runat="server" Text=""></asp:Label>
                            </div>

                                    <div class="tablesection col-sm-12">
                  
                                        <table>
                                            <tr>
                                                <th class="auto-style1">
                                                    <asp:Label ID="Label2" runat="server" Text="Company" CssClass="part1"></asp:Label>
                                                </th>
                                                <th class="auto-style1">
                                                    <asp:DropDownList ID="companyDropDownList" runat="server" Height="40px" Width="340px" AutoPostBack="True" OnSelectedIndexChanged="companyDropDownList_SelectedIndexChanged"></asp:DropDownList>
                                                </th>
                                            </tr>
                                            
                                              <tr>
                                                <th class="auto-style1">
                                                    <asp:Label ID="Label1" runat="server" Text="Item" CssClass="part1"></asp:Label>
                                                </th>
                                                <th class="auto-style1">
                                                    <asp:DropDownList ID="itemDropDownList" runat="server" Height="40px" Width="340px" AutoPostBack="True" OnSelectedIndexChanged="itemDropDownList_SelectedIndexChanged"></asp:DropDownList>
                                                </th>
                                            </tr>
                                            
                                              <tr>
                                                <th class="auto-style1">
                                                    <asp:Label ID="Label3" runat="server" Text="Recoder Level" CssClass="part1"></asp:Label>
                                                </th>
                                                <th class="auto-style1">
                                                    <asp:TextBox ID="recoderlevelTextBox" runat="server" Width="340px" Height="40px" class="part2"></asp:TextBox>
                                                </th>
                                            </tr>
                                            
                                              <tr>
                                                <th class="auto-style1">
                                                    <asp:Label ID="Label4" runat="server" Text="Available Quantity" CssClass="part1"></asp:Label>
                                                </th>
                                                <th class="auto-style1">
                                                    <asp:TextBox ID="avilablequantityTextBox" runat="server" Width="340px" Height="40px" class="part2"></asp:TextBox>
                                                </th>
                                            </tr>
                                            
                                             <tr>
                                                <th class="auto-style1">
                                                    <asp:Label ID="Label5" runat="server" Text="Stock Out Quantity" CssClass="part1"></asp:Label>
                                                </th>
                                                <th class="auto-style1">
                                                    <asp:TextBox ID="stockOutQuantityTextBox" runat="server" Width="340px" Height="40px" class="part2"></asp:TextBox>
                                                </th>
                                            </tr>
                                            
                                        </table>
                                    
                                    </div>
                                         <div class="col-sm-12 sbutton">
                                              <asp:Button ID="stockOutAddButton" runat="server" Text="Add" Width="126px" Height="47px" class="bg-success text-white font-weight-bold " OnClick="stockOutAddButton_Click"  />
                                         </div>
                            
                                          <div class="Gridview">
                                            <br />
                                            <asp:GridView ID="stockOutGridView" runat="server" Height="168px" Width="911px" AutoGenerateColumns="False"  CellPadding="4" ForeColor="#333333" GridLines="None">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="SL">
                                                        <ItemTemplate>
                                                            
                                                            <asp:Label ID="Label6" runat="server" Text='<% #Container.DataItemIndex +1 %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                     <asp:TemplateField HeaderText="CompanyName">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label7" runat="server" Text='<% #Eval("CompanyName")%>' ></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                     <asp:TemplateField HeaderText="ItemName">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label8" runat="server" Text='<% #Eval("ItemName")%>' ></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                     <asp:TemplateField HeaderText="Quantity">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label9" runat="server" Text='<% #Eval("StockOutQuantity")%>' ></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                
                                                

                                                <AlternatingRowStyle BackColor="White" />
                                                <EditRowStyle BackColor="#7C6F57" />
                                                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                                <RowStyle BackColor="#E3EAEB" />
                                                <SelectedRowStyle BackColor="#C5BBAF" ForeColor="#333333" Font-Bold="True" />
                                                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                                <SortedAscendingHeaderStyle BackColor="#246B61" />
                                                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                                <SortedDescendingHeaderStyle BackColor="#15524A" />
                                              </asp:GridView>
                                        </div>
                            <div class="buttongroup">
                                <asp:Button ID="sellButton" runat="server" Text="Sell" Width="100px" Height="40px" class="bg-success text-white" OnClick="sellButton_Click" />
                                <asp:Button ID="damageButton" runat="server" Text="Damage" Width="100px" Height="40px" class="bg-danger text-white" OnClick="damageButton_Click"/>
                                <asp:Button ID="lostButton" runat="server" Text="Lost" Width="100px" Height="40px" class="bg-dark text-white" OnClick="lostButton_Click"/>
                            </div>
                                   

                        </div>
                 </div>
          </div>
        

        <!-- Footer Section-->
          <div class="container-fluid">
                 <div class="row">
                           <div class="footer col-sm-12">
                                 <p>CopyRight &copy; 2018          
                          </div>
                     </div>
          </div>

    </form>
</body>
</html>
