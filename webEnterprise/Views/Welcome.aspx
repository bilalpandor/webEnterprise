<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Welcome.aspx.cs" Inherits="webEnterprise.Views.Welcome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
         <style>
               .navbar{
            margin-bottom:0px !important;
        }

             {
    box-sizing: border-box;
}

body {
    padding-bottom: 20px;
    background-color: white;
    color:black;
}

/* Set padding to keep content from hitting the edges */
.body-content {
    padding-left: 15px;
    padding-right: 15px;
}

/* Override the default bootstrap behavior where horizontal description lists 
   will truncate terms that are too long to fit in the left column 
*/
.dl-horizontal dt {
    white-space: normal;
}

/* Set width on the form input elements since they're 100% wide by default */

.btn-primary {
    //background-color: #0099CC !important;
}

.panel-primary header {
    background-color: #0099CC !important;
}

input[type=text], select, textarea {
    width: 100%;
    padding: 15px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-sizing: border-box;
}

label {
    padding: 15px 15px 15px 0;
    display: inline-block;
}

input[type=submit] {
    color: white;
    width: 100%;
    padding: 15px 20px;
    border: none;
    border-radius: 5px;
    margin: 8px 0;
    cursor: pointer;
}

    input[type=submit]:hover {
        background-color: #4599CC;
    }

.div-form {
    border-radius: 5px;
    background-color: #f2f2f2;
    padding: 20px;
}

.row:after {
    content: "";
    display: table;
    clear: both;
}


.div-center {
    margin-left: auto;
    margin-right: auto;
    max-width: 500px;
}

.div-table {
    margin-left: auto;
    margin-right: auto;
    max-width: 820px;
    padding-left: 10px;
    padding-right: 10px;
}

  .full-width{
            margin-left:-44.33%;
            margin-right:-44.33%;

        }

@media (max-width: 300px) {

    input[type=submit] {
        width: 100%;
        margin-top: 0;
    }

  
}


        </style>
    
<div class="full-width" style="text-align: center;padding-top: 100px; padding-bottom: 100px; background-image:url(../../Content/Images/pexels-photo-262669.jpeg);">
    <div style="max-width:100px; padding:20px;">
        </div><h3 style="color:white; padding-bottom:25px;">Welcome to Idea Center
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></h3>
        <div style="margin-left:40px;margin-right:40px;">
    <div>
        <asp:Button ID="NewIdea" runat="server" Text="New Ideas" class="btn btn-warning btn-lg" style="width:190px !important;" OnClick="NewIdea_Click" />
        <asp:Button ID="viewIdeas" runat="server" Text="View All Ideas" class="btn btn-info btn-lg"  style="width:190px !important;" OnClick="ViewIdeas_Click" />
        <br />
            <asp:Button ID="AdminPage" runat="server" Text="Go To Admin Page" class="btn btn-link" style="width:190px !important;text-decoration:  none;" OnClick="AdminPage_Click"/>
            <asp:Button ID="QAManagerPage" runat="server" Text="Go To QA Manager Page" class="btn btn-link" style="width:190px !important;text-decoration:  none;" OnClick="QAManagerPage_Click"/>
            <asp:Button ID="QACoorPage" runat="server" Text="Go To QA Coordinator Page" class="btn btn-link" style="width:190px !important;text-decoration:  none;" OnClick="QACoorPage_Click"/>
            </div>
    </div>
</div>


<div style="padding:20px;">
</div>

<div class="container">
    <div class="row">
        <div class="col-md-3">
            <div class="panel panel-primary">
                <div class="panel-heading"><h3>Most Popular Ideas</h3></div>
                <div class="panel-body">
                   <p style="color: #000000">
                           
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" AllowPaging="True">
                                <Columns>
                                    <asp:BoundField DataField="Expr1" HeaderText="Upvotes" SortExpression="Expr1" >
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="IdeaTitle" HeaderText=" - Idea" SortExpression="IdeaTitle" >
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString3 %>" ProviderName="<%$ ConnectionStrings:ConnectionString3.ProviderName %>" SelectCommand="SELECT COUNT(r.ThumbRating) AS Expr1, i.IdeaTitle FROM ((Rating r INNER JOIN Idea i ON r.IdeaID = i.IdeaID) INNER JOIN [User] u ON i.UserID = u.UserID) WHERE (u.Active = True) AND r.ThumbRating = true GROUP BY i.IdeaTitle, u.Fname, i.TimeOfPost ORDER BY COUNT(r.ThumbRating) DESC"></asp:SqlDataSource>
                        </p>

                        <!--<p><a href="#" class="btn-lg btn-primary" role="button" style="text-decoration: none">See More</a></p>-->
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="panel panel-primary">
                <div class="panel-heading"><h3>Most Viewed Ideas</h3></div>
                <div class="panel-body">
                     <p style="color: #000000">
                            <asp:GridView ID="GridView2" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataSourceID="SqlDataSource4" Width="100%">
                                <Columns>
                                    <asp:BoundField DataField="IdeaViews" HeaderText="Views" SortExpression="Expr1" >
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="IdeaTitle" HeaderText=" - Idea" SortExpression="IdeaTitle" >
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString3 %>" ProviderName="<%$ ConnectionStrings:ConnectionString3.ProviderName %>" SelectCommand="SELECT Idea.IdeaViews, Idea.IdeaTitle FROM (Idea INNER JOIN [User] ON Idea.UserID = [User].UserID) WHERE USER.Active = true ORDER BY Idea.IDeaViews DESC"></asp:SqlDataSource>
                        </p>

                        <!--<p><a href="#" class="btn-lg btn-primary" role="button" style="text-decoration: none">See More</a></p>-->
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="panel panel-primary">
                <div class="panel-heading"><h3>Latest Ideas</h3></div>
                <div class="panel-body">
                              <p style="color: #000000">

                            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" Width="100%">
                                <Columns>
                                    <asp:BoundField DataField="IdeaTitle" HeaderText="Idea" SortExpression="IdeaTitle" >
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="CategoryName" HeaderText="Category" SortExpression="Fname" >
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString3 %>" ProviderName="<%$ ConnectionStrings:ConnectionString3.ProviderName %>" SelectCommand="SELECT Idea.IdeaTitle, Category.CategoryName FROM ((Idea INNER JOIN Category ON Idea.CategoryID = Category.CategoryID) INNER JOIN [User] ON Idea.UserID = [User].UserID) WHERE ([User].Active = true) ORDER BY Idea.TimeOfPost DESC"></asp:SqlDataSource>
                        </p>
                        <!--                        <p><a href="#" class="btn-lg btn-primary" role="button" style="text-decoration: none">See More</a></p>-->
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="panel panel-primary">
                <div class="panel-heading"><h3>Latest Comments</h3></div>
                <div class="panel-body">
                     <p style="color: #000000">

                            <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" Width="100%">
                                <Columns>
                                    <asp:BoundField DataField="CommentText" HeaderText="Comment" SortExpression="CommentText" >
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="IdeaTitle" HeaderText="Idea" SortExpression="IdeaTitle" >
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString3 %>" ProviderName="<%$ ConnectionStrings:ConnectionString3.ProviderName %>" SelectCommand="SELECT c.CommentText, i.IdeaTitle FROM ((Comment c INNER JOIN [User] u ON c.UserID = u.UserID) INNER JOIN Idea i ON c.IdeaID = i.IdeaID) WHERE u.Active = true ORDER BY c.TimeOfPost DESC"></asp:SqlDataSource>
                        </p>
                        <!--                        <p><a href="#" class="btn-lg btn-primary" role="button" style="text-decoration: none">See More</a></p>-->
                </div>
            </div>
        </div>
    </div>
</div>
</asp:Content>