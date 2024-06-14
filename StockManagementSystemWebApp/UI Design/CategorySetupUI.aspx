<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CategorySetupUI.aspx.cs" Inherits="StockManagementSystemWebApp.UI_Design.CategorySetupUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Category Setup</title>
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
    <form id="categoryForm" runat="server">
   
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
                                     <li><a id="active" href="CategorySetupUI.aspx" >Category Setup</a></li>
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
                                       <h3 class="text-center">Category Setup</h3>
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
                                                    </th>
                                                </tr>
                                            </table>
                                         
                                           
                                  </div>
                                         <div class="col-sm-12 sbutton">
                                             <asp:Button ID="saveButton" runat="server" Text="Save" Width="126px" Height="47px" class="bg-success text-white font-weight-bold " OnClick="saveButton_Click"  />
                                         </div>
                                        <div class="Gridview">
                                            <br />
                                            <asp:GridView ID="categoryGridView" runat="server" AutoGenerateColumns="False" Height="168px" Width="704px" CellPadding="4" ForeColor="#333333" GridLines="None">
                                                
                                                   <AlternatingRowStyle BackColor="White" />
                                                
                                                   <Columns>
                                                       
                                                       <asp:TemplateField HeaderText="SL">
                                                                <ItemTemplate>
                                                                    <asp:Label runat="server" Text='<% #Eval("SerialNumber") %>'/>
                                                                    <asp:HiddenField ID="idHiddenField" runat="server" Value='<% #Eval("Id") %>'/>                            
                                                                </ItemTemplate>
                                                       </asp:TemplateField>
                                                       
                                                        <asp:TemplateField HeaderText="Category Name">
                                                              <ItemTemplate>
                                                                     <asp:Label  runat="server" Text='<% #Eval("Name") %>'/>
                                                              </ItemTemplate>
                                                        </asp:TemplateField>
                                                       
                                                        <asp:TemplateField HeaderText="Action">
                                                              <ItemTemplate>
                                                                  <asp:LinkButton ID="updateLinkButton" runat="server" OnClick="updateLinkButton_OnClick">Update</asp:LinkButton>
                                                              </ItemTemplate>
                                                        </asp:TemplateField>
                                                   </Columns>
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
    <script>
        $('#categoryForm').validate({
            rules: {
                nameTextBox: "required"

            },
            messages: {
                nameTextBox: "Please enter your category"
            }
        });
    </script>
</body>
</html>
