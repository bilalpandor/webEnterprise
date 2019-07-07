<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NewIdea.aspx.cs" Inherits="webEnterprise.Views.NewIdea" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <style>
        *{
            box-sizing:border-box;
        }
        body {
            background-color:white;
        }
          .navbar{
            margin-bottom:0px !important;
        }
       .full-width{
            margin-left:-44.33%;
            margin-right:-44.33%;

        }

    </style>
    
    <div class="container">
        <!--back-to-top arrow (start)-->
        <div id="backtotop" class="mcOut" style="display: none;">▲</div>
        <!--back-to-top arrow (end)-->
        

    <div class="full-width" style="padding:20px 20px;margin-bottom: 50px;  background-color: #4599CC;color:white">
        <h1>New Idea</h1>
    </div>
        <!--12 column system-->
        <!--row 1-->
<%--        <div class="row">
            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12"></div>

            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12" style="margin-bottom:50px">
                <div class="card radius shadowDepth1">
                    <div class="card__content card__padding">
                        <article class="card__article">
                            <div class="input-group input-group-lg">
                                <span class="input-group-addon" id="sizing-addon1"><span class="fa fa-at fa-fw"></span></span>
                                <input type="text" runat="server" id="ideaTitle" required class="form-control" placeholder="Idea Title" aria-describedby="sizing-addon1">
                            </div>
                            <br />
                            <div class="input-group input-group-lg">
                                <span class="input-group-addon" id="sizing-addon1"><span class="fa fa-unlock fa-fw"></span>
                                </span>
                                <input type="password" placeholder="Idea Descriprion" class="form-control" id="IdeaDesc" runat="server">

                            </div>
                            <br />
                            <asp:Label ID="errorLbl" runat="server" ForeColor="Red" Text="Wrong Email or Password. Try again." Visible="False"></asp:Label>
                            <br />
                            <br />
                            <asp:Button ID="loginBtn" runat="server" OnClick="Login_Click" runat="server" Text="Login" class="btn btn-secondary btn-lg" style="background-color:black" ForeColor="White" />
                            <br />
                            <div class="input-group">
                                 <p style="text-align: center">
                                &nbsp;</div>
                        </article>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12"></div>
        </div>--%>

      <div class="row">
            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12"></div>

            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12" style="margin-bottom:50px">
           
                        <article class="card__article">

                            <!--Forename field-->
                            <asp:Label ID="Label5" runat="server" ForeColor="Black" Text="Name"></asp:Label>

                            <div class="input-group input-group-lg">
                                <span class="input-group-addon" ></span>
                                <input type="text"  class="form-control" runat="server" placeholder="Name of your idea" id="IdeaTitle">
                            </div>  
							<br>

							<!--Category field-->
                            <asp:Label ID="Label3" runat="server" ForeColor="Black" Text="Category"></asp:Label>

                        
                            <asp:DropDownList ID="DropDownList1" runat="server" class="form-control input-lg" style="width:100%;border-color:#ccc;border-radius:6px;height:46px;" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="CategoryName" DataValueField="CategoryName" >
                                    <asp:ListItem Text="Architecure, Computing and Humanities" Value="1" />
                                    <asp:ListItem Text="Business" Value="2" />
                                    <asp:ListItem Text="Education and Health" Value="3" />
                                    <asp:ListItem Text="Engineering and Science" Value="4" />
                            </asp:DropDownList>
                            <br />
							<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString3 %>" ProviderName="<%$ ConnectionStrings:ConnectionString3.ProviderName %>" SelectCommand="SELECT [CategoryName], [CategoryID] FROM [Category]"></asp:SqlDataSource>

							<br />

                           	<asp:Label ID="Label4" runat="server" ForeColor="Black" Text="File Upload:"></asp:Label>
                             <br />
                            <asp:Label ID="_msg" runat="server" ForeColor="Black"></asp:Label>
                             <input id="uploadFile" runat="server" type="file"  />
                            <br>
                            <!--Description field--> 
                            <asp:Label ID="Label6" runat="server" ForeColor="Black" Text="Description of your idea"></asp:Label>
                            <textarea class="form-control" runat="server" id="IdeaDesc" rows="15"></textarea>
                            <br />
                            <asp:Label ID="Label1" runat="server" Text="Check Terms And Conditions     " ForeColor="Black"></asp:Label>
                            <asp:CheckBox ID="termCheck" runat="server" />
                            <br />				
                            <asp:Label ID="Label2" runat="server" ForeColor="Black" Text="Post Idea Anonymously             "></asp:Label>
                            <asp:CheckBox ID="anonCheck" runat="server" />
                            <br />
                            <br />
                            <asp:Button ID="Submit"  class="btn btn-warning btn-lg" runat="server" Text="Submit Idea" OnClick="Submit_Click" />
                            <br />
                            <br />
                            <asp:Label ID="errorlist" runat="server" ForeColor="#CC0000" Visible="false"></asp:Label>
                        </article>
                   
            </div>

     </div>

    </div>
</asp:Content>
