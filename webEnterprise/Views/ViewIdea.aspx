<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewIdea.aspx.cs" Inherits="webEnterprise.Views.ViewIdea" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <html>
        <head>
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
          .pagination a {
            color: black;
            float: left;
            padding: 8px 16px;
            text-decoration: none;
            margin-top: 20px;
        }

            .pagination a.active {
                background-color: #f0ad4e;
                color: white;
                border-radius: 5px;
            }

            .pagination a:hover:not(.active) {
                background-color: #ddd;
                border-radius: 5px;
            }


            </style>
        </head>
        <body>

    <div class="container">
        <!--back-to-top arrow (start)-->
        <div id="backtotop" class="mcOut" style="display: none;">▲</div>
        <!--back-to-top arrow (end)-->
        <div class="full-width" style="padding:20px 20px;margin-bottom: 50px;  background-color: #4599CC;color:white">
            <h1>All Ideas</h1>
        </div>
        <!--12 column system-->
        <!--row 1-->
<%--        <div class="row">
            <div class="col-lg-3 col-md-1 col-sm-1 col-xs-12" style="margin-bottom:50px"></div>

            <div class="col-lg-6 col-md-10 col-sm-10 col-xs-12" style="margin-bottom:50px">
                <!-- Input sesrch-->
                <div class="input-group">
                    <input type="text" class="form-control input-lg" placeholder="Idea Name">
                    <span class="input-group-btn" role="button">
                        <span class="btn btn-default btn-lg" role="button">
                            <span class="fa fa-search fa-fw"></span> Search
                        </span>
                    </span>
                </div>
                <hr>
                <br>
                <span class="btn btn-warning btn-lg" role="button">
                    <span class="fa fa-arrow-down fa-fw"></span> Export Ideas
                </span>
                <!--
                <hr>
                <p><a href="#" class="btn-lg btn-primary" role="button" style="text-decoration: none">Add Category</a></p>
-->
                <br>
            </div>

        <div class="col-lg-3 col-md-1 col-sm-1 col-xs-12" style="margin-bottom:50px"></div>
        </div>--%>

        <!--row 2-->
        <div class="row">
            <div style="margin-bottom:50px">
                    <%--<div class="card__padding">
                        <h2>Category Name</h2>
                        <br>
                        <table>
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Idea</th>
                                    <th>Category</th>
                                    <th>Date</th>
                                    <th>Feedback</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tr>
                                <td>Aaron Kirson</td>
                                <td><strong>Idea A</strong></td>
                                <td>Teaching</td>
                                <td>DD/MM/YYYY</td>
                                <td>
                                    <span class="btn btn-default btn-file btn-lg">
                                            <span class="fa fa-plus fa-comments fa-2x"></span>
                                    </span>
                                    <br>
                                    <span class="btn btn-default btn-file btn-lg">
                                            <span class="fa fa-plus fa-thumbs-up fa-2x"></span>
                                    </span>
                                    <br>
                                    <span class="btn btn-default btn-file btn-lg">
                                            <span class="fa fa-plus fa-thumbs-down fa-2x"></span>
                                    </span>
                                </td>
                                <td>
                                    <span class="btn btn-default btn-lg">
                                        <span class="fa fa-plus fa-eye fa-fw"></span> View Idea
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <td>Bilal Pandor</td>
                                <td><strong>Idea B</strong></td>
                                <td>Teaching</td>
                                <td>DD/MM/YYYY</td>
                                <td>
                                    <span class="btn btn-default btn-file btn-lg">
                                            <span class="fa fa-plus fa-comments fa-2x"></span>
                                    </span>
                                    <br>
                                    <span class="btn btn-default btn-file btn-lg">
                                            <span class="fa fa-plus fa-thumbs-up fa-2x"></span>
                                    </span>
                                    <br>
                                    <span class="btn btn-default btn-file btn-lg">
                                            <span class="fa fa-plus fa-thumbs-down fa-2x"></span>
                                    </span>
                                </td>
                                <td>
                                    <span class="btn btn-default btn-lg">
                                        <span class="fa fa-plus fa-eye fa-fw"></span> View Idea
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <td>Bolaji Agbola</td>
                                <td><strong>Idea C</strong></td>
                                <td>Research</td>
                                <td>DD/MM/YYYY</td>
                                <td>
                                    <span class="btn btn-default btn-file btn-lg">
                                            <span class="fa fa-plus fa-comments fa-2x"></span>
                                    </span>
                                    <br>
                                    <span class="btn btn-default btn-file btn-lg">
                                            <span class="fa fa-plus fa-thumbs-up fa-2x"></span>
                                    </span>
                                    <br>
                                    <span class="btn btn-default btn-file btn-lg">
                                            <span class="fa fa-plus fa-thumbs-down fa-2x"></span>
                                    </span>
                                </td>
                                <td>
                                    <span class="btn btn-default btn-lg">
                                        <span class="fa fa-plus fa-eye fa-fw"></span> View Idea
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <td>Jonathan Odumanye</td>
                                <td><strong>Idea D</strong></td>
                                <td>Admin</td>
                                <td>DD/MM/YYYY</td>
                                <td>
                                    <span class="btn btn-default btn-file btn-lg">
                                            <span class="fa fa-plus fa-comments fa-2x"></span>
                                    </span>
                                    <br>
                                    <span class="btn btn-default btn-file btn-lg">
                                            <span class="fa fa-plus fa-thumbs-up fa-2x"></span>
                                    </span>
                                    <br>
                                    <span class="btn btn-default btn-file btn-lg">
                                            <span class="fa fa-plus fa-thumbs-down fa-2x"></span>
                                    </span>
                                </td>
                                <td>
                                    <span class="btn btn-default btn-lg">
                                        <span class="fa fa-plus fa-eye fa-fw"></span> View Idea
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <td>Louisa Thomas</td>
                                <td><strong>Idea E</strong></td>
                                <td>Research</td>
                                <td>DD/MM/YYYY</td>
                                <td>
                                    <span class="btn btn-default btn-file btn-lg">
                                            <span class="fa fa-plus fa-comments fa-2x"></span>
                                    </span>
                                    <br>
                                    <span class="btn btn-default btn-file btn-lg">
                                            <span class="fa fa-plus fa-thumbs-up fa-2x"></span>
                                    </span>
                                    <br>
                                    <span class="btn btn-default btn-file btn-lg">
                                            <span class="fa fa-plus fa-thumbs-down fa-2x"></span>
                                    </span>
                                </td>
                                <td>
                                    <span class="btn btn-default btn-lg">
                                        <span class="fa fa-plus fa-eye fa-fw"></span> View Idea
                                    </span>
                                </td>
                            </tr>
                        </table>

                        <!--paginator-->
                        <div class="text-center">
                            <ul class="pagination">
                                <li class="active"><a href="#" data-original-title="" title="">1</a></li>
                                <li><a href="#" data-original-title="" title="">2</a></li>
                                <li><a href="#" data-original-title="" title="">3</a></li>
                                <li><a href="#" data-original-title="" title="">4</a></li>
                                <li><a href="#" data-original-title="" title="">5</a></li>
                            </ul>
                        </div>--%>
                   
         <div style="margin-bottom:50px">
                <div class="card radius shadowDepth1">
                    <div class="card__padding">
                        <h2 style="color: #000000">Viewing All Ideas</h2>
                        <p style="color: #000000"></p>
                       <hr>  
                    <p style="color: #000000">&nbsp;</p>
                        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" datakeynames="IdeaID" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowPaging="True" PageSize="5" Width="100%">
                            <Columns>
<%--                                <asp:BoundField DataField="IdeaID" HeaderText="IdeaID" SortExpression="IdeaID" InsertVisible="False"></asp:BoundField>--%>
                                <asp:BoundField DataField="IdeaTitle" HeaderText="Idea Title" SortExpression="IdeaTitle" >
                                <HeaderStyle BorderColor="White" BorderStyle="None" BorderWidth="8px" HorizontalAlign="Center" />
                                <ItemStyle BorderColor="White" BorderStyle="None" BorderWidth="8px" HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="CategoryName" HeaderText="Category" SortExpression="CategoryName" >
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:BoundField>
                                <asp:BoundField DataField="DName" HeaderText="Department" SortExpression="DName" >
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:BoundField>
                                <asp:BoundField DataField="TimeOfPost" HeaderText="Posted On" SortExpression="TimeOfPost" >
                                <HeaderStyle Width="120px" Wrap="False" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:BoundField>
                                <asp:CommandField ShowSelectButton="True" ButtonType="Button" SelectText="View Idea" />

                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString3 %>" ProviderName="<%$ ConnectionStrings:ConnectionString3.ProviderName %>" SelectCommand="SELECT i.IdeaID, i.IdeaTitle, c.CategoryName, d.DName, i.TimeOfPost FROM ((((Idea i INNER JOIN [User] u ON i.UserID = u.UserID) INNER JOIN Category c ON i.CategoryID = c.CategoryID) INNER JOIN UserDepartment ud ON u.UserID = ud.UserID) INNER JOIN Department d ON ud.DepartmentID = d.DepartmentID) WHERE (u.Active = True) ORDER BY i.TimeOfPost Desc"></asp:SqlDataSource>

                    <div>
                    </div>
                        <h2 style="color: #000000">&nbsp;</h2>
                    </div>
                    </div>
            </div>
        </div>

      
<%--        <div style="text-align:center;">
            <div class="pagination">
                <a href="#">&laquo;</a>
                <a href="#" class="active">1</a>
                <a href="#">2</a>
                <a href="#">3</a>
                <a href="#">4</a>
                <a href="#">5</a>
                <a href="#">&raquo;</a></div>
        </div>--%>
        <!--back button-->
        <p><a href="#" class="btn-lg btn-default btn-huge" role="button" style="text-decoration: none;background-color:black;color:white;"><span class="fa fa-arrow-left fa-fw"></span> Back</a></p>
        <br>
</body>

</html>
    </div>
</div>
</asp:Content>
