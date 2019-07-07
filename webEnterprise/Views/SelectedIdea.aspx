<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SelectedIdea.aspx.cs" Inherits="webEnterprise.Views.SelectedIdea" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <head>
        <style>
             <style>
                   *{
            box-sizing:border-box;
        }
        body {
            background-color:white;
            color:black;
        }
          .navbar{
            margin-bottom:0px !important;
        }
       .full-width{
            margin-left:-44.33%;
            margin-right:-44.33%;

        }
        </style>
    </head>
    <body>
     <div class="container">
        <!--back-to-top arrow (start)-->
        <div id="backtotop" class="mcOut" style="display: none;">▲</div>
        <!--back-to-top arrow (end)-->
        <div class="full-width" style="padding:20px 20px;margin-bottom: 50px;  background-color: #4599CC;color:white">
            <h1>
                <asp:Label ID="IdeaLbl" runat="server" Text="SelectedIdea"></asp:Label>
            </h1>
        </div>
        <!--12 column system-->
        <!--row 1-->
        <div class="row">
            <div class="col-lg-3 col-md-1 col-sm-1 col-xs-12" style="margin-bottom:50px"></div>

            <div class="col-lg-6 col-md-10 col-sm-10 col-xs-12" style="margin-bottom:50px">
                <div class="card shadowDepth1">
                    <div class="card__padding">
                        <h2 style="color: #000000">Idea Info</h2>
                        <hr>
                        <div class="input-group" style="color: #000000">                        
                            Idea ID&nbsp;&nbsp; 
                            -&nbsp;&nbsp;
                            <asp:Label ID="IdeaID" runat="server" Text="Label"></asp:Label>
                            <br />
                            Idea Title&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="IdeaTitle" runat="server" Text="Label"></asp:Label>
                            <br />
                            Idea Text&nbsp;&nbsp;&nbsp;
                            -&nbsp;&nbsp;
                            <asp:Label ID="IdeaText" runat="server"></asp:Label>
                            <br />
                            Idea Category&nbsp;&nbsp;
                            -&nbsp;&nbsp;
                            <asp:Label ID="IdeaCategory" runat="server"></asp:Label>
                            <br />
                            User Info&nbsp;&nbsp; -&nbsp;&nbsp;
                            <asp:Label ID="User" runat="server" Text="Label"></asp:Label>
                        </div>
                        <br />
                        <br>
                        <hr>
                        <div style="align-content:center">
                                <asp:Button ID="Flagged" runat="server" Text="Flag Idea"  class="btn-lg btn-danger" OnClick="Flagged_Click" />

                                <br />
                                <asp:Label ID="errorlbl" runat="server"></asp:Label>

                        </div>
                        <%--                        <span class="btn btn-default btn-lg" role="button">
                            <span class="fa fa-arrow-down fa-fw"></span> Export Ideas&nbsp;
                        </span>--%>
                        <!--
                        <hr>
                        <p><a href="#" class="btn-lg btn-primary" role="button" style="text-decoration: none">Add Category</a></p>
-->
                        &nbsp;
                        &nbsp;
                         &nbsp;
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-1 col-sm-1 col-xs-12" style="margin-bottom:50px"></div>
        </div>

        <!--row 2-->
        <div class="row">
            <div style="margin-bottom:50px">
         
                        <h2 style="color: #000000">Comments</h2>
                        <p style="color: #000000">
                           
                            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                            <Columns>
                                    <asp:BoundField DataField="CommentID" HeaderText="ID" SortExpression="CommentID" InsertVisible="False" />
                                    <asp:BoundField DataField="CommentText" HeaderText="Comment" SortExpression="CommentText" />
                                    <asp:BoundField DataField="Fname" HeaderText="User" SortExpression="Fname" />
                                    <asp:BoundField DataField="TimeOfPost" HeaderText="Time Of Post" SortExpression="TimeOfPost" />
                            </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString3 %>" ProviderName="<%$ ConnectionStrings:ConnectionString3.ProviderName %>" SelectCommand="SELECT Comment.CommentID, Comment.CommentText, [User].Fname, Comment.TimeOfPost FROM ((Comment INNER JOIN [User] ON Comment.UserID = [User].UserID) INNER JOIN [User] User_1 ON Comment.UserID = User_1.UserID)"></asp:SqlDataSource>
                        </p>
                        <div class="text-center">
                        </div>
                    </div>
               
        </div>

        <!--row 3-->
        <div class="row">
            <div style="margin-bottom:50px">
               
                        <h2 style="color: #000000">Leave a Comment</h2>
                                                <hr>
                        <asp:TextBox ID="CommentTxt" runat="server" class="form-control input-lg"  placeholder="Leave your comments here"></asp:TextBox>
                <div style="align-content:center"> <asp:Label ID="bannedlbl" runat="server" ForeColor="Red"></asp:Label></div>
                <div style="text-align:center">
                        <asp:Button ID="LeaveComment" runat="server" Text="Leave Comment"  class="btn btn-warning btn-lg" OnClick="LeaveComment_Click" />
                    </div>
                        <br>
                        <div class="text-center">
                        </div>
                    </div>
              
        </div>

         <div class="row">
            <div style="margin-bottom:50px">
              
                <h2 style="color: #000000">Ratings</h2>
                <hr>

                <div class="col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading"><h3>Ideas Thumbs Up</h3></div>
                        <div class="panel-body">
                                      <p style="color: #000000">
                                     
                                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None">
                                        <Columns>
                                            <asp:BoundField DataField="Expr1" HeaderText="Thumbs Up" SortExpression="Expr1" />
                                        </Columns>
                                    </asp:GridView>
                                </p>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading"><h3>Ideas Thumbs Down</h3></div>
                        <div class="panel-body">
                                      <p style="color: #000000">
                                         
                                        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None">
                                    <Columns>
                                        <asp:BoundField DataField="ThumbsDown" HeaderText="Thumbs Down" SortExpression="ThumbsDown" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString3 %>" ProviderName="<%$ ConnectionStrings:ConnectionString3.ProviderName %>" SelectCommand="SELECT COUNT(ThumbRating) AS ThumbsDown FROM Rating r WHERE (IdeaID = 3) AND (ThumbRating = false)"></asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString3 %>" ProviderName="<%$ ConnectionStrings:ConnectionString3.ProviderName %>" SelectCommand="SELECT COUNT(ThumbRating) AS Expr1 FROM Rating r WHERE (IdeaID = 3) AND (ThumbRating = TRUE)"></asp:SqlDataSource>
              
                                </p>
                        </div>
                    </div>
            </div>

     
                <div class="text-center">
                    <asp:Button ID="Thumbsup" runat="server" Text="Thumbs Up"  class="btn-lg btn-success" OnClick="Thumbsup_Click"/>

                    <asp:Button ID="ThumbsDown" runat="server" Text="Thumbs Down"  class="btn-lg btn-danger" OnClick="ThumbsDown_Click"/>
     
                </div>
            </div> 
        </div>
        <!--back button-->
        <br>

        <hr>
    </div>
</body>
</asp:Content>
