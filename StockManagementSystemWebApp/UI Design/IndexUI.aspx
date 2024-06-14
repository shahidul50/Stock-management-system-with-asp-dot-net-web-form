<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IndexUI.aspx.cs" Inherits="StockManagementSystemWebApp.UI_Design.IndexUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Stock Management System</title>
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
    <form id="logform" runat="server">
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

                        </div>
                        <div class="mainsection col-sm-9 float-right">
                            <div class="output">
                                <asp:Label ID="outputLabel" runat="server" Text=""></asp:Label>
                            </div>
                             <div class="loginsections">
                                 <h2 class="logintitle">Login Here</h2>
                                 <asp:Label ID="Label1" class="loginlabel" runat="server" Text="Username"></asp:Label>
                                 <asp:TextBox ID="usernameTextBox" style="margin-right: 15px;" runat="server" class="loguser"></asp:TextBox>
                                 <br/>
                                  <asp:Label ID="Label2" class="loginlabel" runat="server" Text="Password" ></asp:Label>
                                 <asp:TextBox ID="passwordTextBox" style="margin-right: 15px;" runat="server" TextMode="Password" class="logpass"></asp:TextBox>
                                 <br/>
                                 <asp:Button ID="loginButton" runat="server" Text="Login" OnClick="loginButton_Click" class="logbtn" />
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
        $('#logform').validate({
            rules: {
                usernameTextBox: "required",
                passwordTextBox: "required"

            },
            messages: {
                usernameTextBox: "Please enter your Username",
                passwordTextBox: "Please enter your Password"
            }
        });
    </script>
</body>
</html>
