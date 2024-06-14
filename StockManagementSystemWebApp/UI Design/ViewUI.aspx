<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewUI.aspx.cs" Inherits="StockManagementSystemWebApp.UI_Design.ViewUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Sales Between Two Dates</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <link href="../Css/bootstrap.min.css" rel="stylesheet" />
    <link href="../Css/main.css" rel="stylesheet" />
    <link href="../Content/DataTables/css/jquery.dataTables.min.css" rel="stylesheet" />

    <link href="https://fonts.googleapis.com/css?family=Noto+Serif" rel="stylesheet"/>
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
                  <div class="row extra" >
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
                                       <h3 class="text-center">View Sales Between Two Dates</h3>
                                  </div>
                            </div>
                            
                             <div class="col-sm-12 text-center text-danger font-weight-bold">
                                     <asp:Label ID="outputLabel" runat="server" Text=""></asp:Label>
                            </div>

                                    <div class="tablesection col-sm-12">
                  
                                        <table>
                                            <tr>
                                                <th class="auto-style1">
                                                    <asp:Label ID="Label2" runat="server" Text="From Date" CssClass="part1"></asp:Label>
                                                </th>
                                                <th class="auto-style1">
                                                    <asp:TextBox ID="fromDateTextBox" runat="server" Width="328px"></asp:TextBox>
                                                    <asp:ImageButton ID="fromDateImageButton" runat="server" ImageUrl="~/Images/calendar-512.png" OnClick="fromDateImageButton_Click" />
                                                   
                                                </th>
                                            </tr>
                                            <tr>
                                                
                                                <th></th>
                                                <th>
                                                    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="Black" Font-Names="Times New Roman" Font-Size="10pt" ForeColor="Black" Height="220px" OnSelectionChanged="Calendar1_SelectionChanged" Width="400px" DayNameFormat="Shortest" NextPrevFormat="FullMonth" TitleFormat="Month">
                                                        <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" ForeColor="#333333" Height="10pt" />
                                                        <DayStyle Width="14%" />
                                                        <NextPrevStyle Font-Size="8pt" ForeColor="White" />
                                                        <OtherMonthDayStyle ForeColor="#999999" />
                                                        <SelectedDayStyle BackColor="#CC3333" ForeColor="White" />
                                                        <SelectorStyle BackColor="#CCCCCC" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt" ForeColor="#333333" Width="1%" />
                                                        <TitleStyle BackColor="Black" Font-Bold="True" Font-Size="13pt" ForeColor="White" Height="14pt" />
                                                        <TodayDayStyle BackColor="#CCCC99" />
                                                    </asp:Calendar> 
                                                </th>
                                            </tr>
                                            
                                              <tr>
                                                <th class="auto-style1">
                                                    <asp:Label ID="Label1" runat="server" Text="To Date" CssClass="part1"></asp:Label>
                                                </th>
                                                <th class="auto-style1">
                                                    <asp:TextBox ID="toDateTextBox" runat="server" Width="328px"></asp:TextBox>
                                                    <asp:ImageButton ID="toDateImageButton" runat="server" ImageUrl="~/Images/calendar-512.png" OnClick="toDateImageButton_Click" />
                                                </th>

                                            </tr>
                                             <tr>
                                                
                                                <th></th>
                                                <th>
                                                    <asp:Calendar ID="Calendar2" runat="server" BackColor="White" BorderColor="Black" Font-Names="Times New Roman" Font-Size="10pt" ForeColor="Black" Height="220px" OnSelectionChanged="Calendar2_SelectionChanged" Width="400px" DayNameFormat="Shortest" NextPrevFormat="FullMonth" TitleFormat="Month">
                                                        <DayHeaderStyle Font-Bold="True" BackColor="#CCCCCC" Height="10pt" Font-Size="7pt" ForeColor="#333333" />
                                                        <DayStyle Width="14%" />
                                                        <NextPrevStyle Font-Size="8pt" ForeColor="White" />
                                                        <OtherMonthDayStyle ForeColor="#999999" />
                                                        <SelectedDayStyle BackColor="#CC3333" ForeColor="White" />
                                                        <SelectorStyle BackColor="#CCCCCC" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt" ForeColor="#333333" Width="1%" />
                                                        <TitleStyle BackColor="Black" Font-Bold="True" Font-Size="13pt" ForeColor="White" Height="14pt" />
                                                        <TodayDayStyle BackColor="#CCCC99" />
                                                    </asp:Calendar> 
                                                </th>
                                            </tr>
                                
                                        </table>
                                    
                                    </div>
                                         <div class="col-sm-12 sbutton">
                                              <asp:Button ID="searchButton" runat="server" Text="Search" Width="126px" Height="47px" class="bg-success text-white font-weight-bold " OnClick="searchButton_Click"  />
                                         </div>
                            
                                          <div class="Gridview">
                                            <br />
                                            <asp:GridView ID="viewResultGridView" runat="server" Height="168px" Width="1011px" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                                                
                                                
                                                 <AlternatingRowStyle BackColor="White" />
                                                
                                                
                                                 <Columns>
                                                       
                                                       <asp:TemplateField HeaderText="SL" >
                                                                <ItemTemplate>
                                                                    <asp:Label runat="server" Width ="100px" Text='<% #Eval("SlNumber")  %>'/>
                                                            
                                                                </ItemTemplate>
                                                       </asp:TemplateField>
                                                       
                                                      <asp:TemplateField HeaderText="Compnay">
                                                              <ItemTemplate>
                                                                     <asp:Label  runat="server" Text='<% #Eval("CompanyName") %>'/>
                                                              </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Item">
                                                              <ItemTemplate>
                                                                     <asp:Label  runat="server" Text='<% #Eval("ItemName") %>'/>
                                                              </ItemTemplate>
                                                        </asp:TemplateField>
                                                       
                                                    <asp:TemplateField HeaderText="Sale Quantity">
                                                              <ItemTemplate>
                                                                     <asp:Label  runat="server" Text='<% #Eval("StockOutQuantity") %>'/>
                                                              </ItemTemplate>
                                                        </asp:TemplateField>
                                                 
                                                        
                                                   </Columns>
                                                 <EditRowStyle BackColor="#7C6F57" />
                                                 <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                                 <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                                 <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                                 <RowStyle BackColor="#E3EAEB" />
                                                 <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                                 <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                                 <SortedAscendingHeaderStyle BackColor="#246B61" />
                                                 <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                                 <SortedDescendingHeaderStyle BackColor="#15524A" />
                                            </asp:GridView>
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
    <script src="../Scripts/jquery-3.3.1.js"></script>
    <script src="../Scripts/DataTables/jquery.dataTables.min.js"></script>
    <script src="../Js/popper.min.js"></script>
    
   <%-- <script>
        $(document).ready(function () {
            $('#viewResultGridView').prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>--%>
</body>
</html>
