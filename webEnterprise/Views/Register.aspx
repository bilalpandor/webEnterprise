<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="webEnterprise.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!DOCTYPE html>
<html lang="en">

<body>


    <div class="container">
        <!--back-to-top arrow (start)-->
        <div id="backtotop" class="mcOut" style="display: none;">&#8677;</div>
        <!--back-to-top arrow (end)-->

       <%-- <h1>Register</h1>
        <!--12 column system-->
        <!--row 1-->
        <div class="row">
            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12"></div>

            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12" style="margin-bottom:50px">
                <div class="card radius shadowDepth1">
                    <div class="card__content card__padding">
                        <article class="card__article">
                            <!--Email adress field-->
                            <div class="input-group input-group-lg">
                                <span class="input-group-addon" id="sizing-addon1"><span class="glyphicon glyphicon-envelope"></span></span>
                                <input type="text" runat="server" class="form-control" placeholder="email address" id="emailAddress" aria-describedby="sizing-addon1">
                            </div>
                            <br/>
                            <!--Password-->
                            <div class="input-group input-group-lg">
                                <span class="input-group-addon" id="sizing-addon1"><span class="glyphicon glyphicon-lock"></span></span>
                                <input type="password" runat="server" placeholder="password" class="form-control" id="pwd">
                            </div>
                            <br/>
                            <!--Password-->
                            <div class="input-group input-group-lg">
                                <span class="input-group-addon" id="sizing-addon1"><span class="glyphicon glyphicon-lock"></span></span>
                                <input type="password" runat="server" placeholder="confirm password" class="form-control" id="pwdConfirm">
                            </div>
                            <br/>
                            <asp:Button ID="RegisterBtn" runat="server" OnClick="Register_Click" Text="Register" />
                            </p>
    </div>--%>

        <h1>Register</h1>
        <!--12 column system-->
        <!--row 1-->
        <div class="row">
            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12"></div>

            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12" style="margin-bottom:50px">
                <div class="card radius shadowDepth1" style="border-radius:10px;">
                    <div class="card__content card__padding" style="padding-top: 40px;padding-left:40px;padding-right:40px;">
                        <article class="card__article">

                            <!--Forename field-->
                            <div class="input-group input-group-lg">
                                <span class="input-group-addon" ></span>
                                <input type="text" class="form-control" runat="server" placeholder="Forename" id="Fname">
                            </div>  
							<br>

							<!--Surname field-->
                            <div class="input-group input-group-lg">
                                <span class="input-group-addon" ><span class="glyphicon glyphicon-user"></span></span>
                                <input type="text" class="form-control" runat="server" placeholder="Surname" id="Lname">
                            </div>  
							<br>

							<!--Department field-->
                            <asp:DropDownList ID="DropDownList1" runat="server" class="form-control input-lg" AutoPostBack="True"  onselectedindexchanged="itemSelected">
                                            <asp:ListItem Text="Architecure, Computing and Humanities" Value="1" />
                                            <asp:ListItem Text="Business" Value="2" />
                                            <asp:ListItem Text="Education and Health" Value="3" />
                                            <asp:ListItem Text="Engineering and Science" Value="4" />
                            </asp:DropDownList>

							<br>
                            <div class="input-group input-group-lg">
                                <span class="input-group-addon" ><span class="glyphicon glyphicon-envelope"></span></span>
                                <input type="text" class="form-control" runat="server" id="emailAddress" placeholder="Email address">
                            </div>
                            <br/>
                            <!--Password-->
                            <div class="input-group input-group-lg">
                                <span class="input-group-addon" ><span class="glyphicon glyphicon-lock"></span></span>
                                <input type="password" placeholder="Password" runat="server" class="form-control" id="pwd">
                            </div>
                            <br/>
                            <!--Confirm password-->
                            <div class="input-group input-group-lg">
                                <span class="input-group-addon" id="sizing-addon1"><span class="glyphicon glyphicon-lock"></span></span>
                                <input type="password" placeholder="Confirm password" runat="server" class="form-control" id="pwdConfirm">
                            </div>
                            <br/>
                            <asp:Label ID="errorLbl" runat="server" ForeColor="Red" Visible="False"></asp:Label>
                        
                            <asp:Button ID="CreateBtn"  class="btn btn-warning btn-lg" runat="server" Text="Create Account" OnClick="CreateBtn_Click" />
                        </article>
                    </div>
                </div>
            </div>


            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12"></div>
        </div>

        <p style="text-align: center">Already have an account?
            <asp:Button ID="Login" runat="server" Text="Sign In"  class="btn btn-secondary btn-lg" style="background-color:black" OnClick="Login_Click"/>
        </p>
        <hr>

        <footer>
            <p style="text-align: center">&copy; 2018 Coding Warriors</p>
        </footer>
    </div>
</body>

</html>
</asp:Content>
