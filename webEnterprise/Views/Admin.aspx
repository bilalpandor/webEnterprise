<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="webEnterprise.Views.Admin" %>
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
        <div id="backtotop" class="mcOut" style="display: none;">&#8677;</div>
        <!--back-to-top arrow (end)-->

         <div class="container">
        <!--back-to-top arrow (start)-->
        <div id="backtotop" class="mcOut" style="display: none;">▲</div>
        <!--back-to-top arrow (end)-->
        <div class="full-width" style="padding:20px 20px;margin-bottom: 50px;  background-color: #4599CC;color:white">
            <h1>Admin Page</h1>
        </div>     
             <p>&nbsp;</p>

              <div style="margin-bottom:50px">
                <div class="card radius shadowDepth1">
                    <div class="card__padding">
                        <h2 style="color: #000000">Set Idea Closure Date</h2>
                       <hr>
                            <asp:Calendar ID="Calendar1" runat="server" BackColor="White" OnClientDateSelectionChanged="dateSelectionChanged" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="100%" OnSelectionChanged="Calendar1_SelectionChanged">
                                <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                                <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                                <OtherMonthDayStyle ForeColor="#999999" />
                                <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                                <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                                <TodayDayStyle BackColor="#CCCCCC" />
                        </asp:Calendar>
                    </div>
                </div>
            </div>

             
              <div style="margin-bottom:50px">
                <div class="card radius shadowDepth1">
                    <div class="card__padding">
                        <h2 style="color: #000000">&nbsp;</h2>
                        <h2 style="color: #000000">&nbsp;Set Final Closure Date</h2>
                       <hr>
                            <asp:Calendar ID="Calendar2" runat="server" BackColor="White" OnClientDateSelectionChanged="dateSelectionChanged" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="100%" OnSelectionChanged="Calendar2_SelectionChanged">
                                <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                                <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                                <OtherMonthDayStyle ForeColor="#999999" />
                                <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                                <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                                <TodayDayStyle BackColor="#CCCCCC" />
                        </asp:Calendar>
                    </div>
                </div>
            </div>

             <p>&nbsp;</p>

              <div style="margin-bottom:50px">
                <div class="card radius shadowDepth1">
                    <div class="card__padding">
                        <h2 style="color: #000000">Review Uploaded Ideas</h2>
                       <hr>
                            <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                                <Columns>
                                    <asp:BoundField DataField="Fname" HeaderText="Fname" SortExpression="Fname" />
                                    <asp:BoundField DataField="Sname" HeaderText="Sname" SortExpression="Sname" />
                                    <asp:BoundField DataField="IdeaTitle" HeaderText="IdeaTitle" SortExpression="IdeaTitle" />
                                    <asp:BoundField DataField="IdeaText" HeaderText="IdeaText" SortExpression="IdeaText" />
                                    <asp:BoundField DataField="IdeaViews" HeaderText="IdeaViews" SortExpression="IdeaViews" />
                                    <asp:BoundField DataField="CategoryName" HeaderText="CategoryName" SortExpression="CategoryName" />
                                    <asp:CheckBoxField DataField="Anonymous" HeaderText="Anonymous" SortExpression="Anonymous" />
                                    <asp:BoundField DataField="TimeOfPost" HeaderText="TimeOfPost" SortExpression="TimeOfPost" />
                                    <asp:CheckBoxField DataField="Flagged" HeaderText="Flagged" SortExpression="Flagged" />
                                </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString5 %>" ProviderName="<%$ ConnectionStrings:ConnectionString5.ProviderName %>" SelectCommand="SELECT [User].Fname, [User].Sname, Idea.IdeaTitle, Idea.IdeaText, Idea.IdeaViews, Category.CategoryName, Idea.Anonymous, Idea.TimeOfPost, Idea.Flagged FROM ((Idea INNER JOIN [User] ON Idea.UserID = [User].UserID) INNER JOIN Category ON Idea.CategoryID = Category.CategoryID)"></asp:SqlDataSource>
                            </p>

             <p>&nbsp;</p>

    
                           <p>
                        </p>
                        <!--                        <p><a href="#" class="btn-lg btn-primary" role="button" style="text-decoration: none">See More</a></p>-->
                    </div>
                </div>
            </div>

              <div style="margin-bottom:50px">
                <div class="card radius shadowDepth1">
                    <div class="card__padding">
                        <h2 style="color: #000000">Flagged Ideas </h2>
                        <p style="color: #000000">
                       <hr>
                            <asp:GridView ID="GridView4" Width="100%" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource4">
                        <Columns>
                            <asp:BoundField DataField="Fname" HeaderText="User" SortExpression="Fname" >
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Sname" HeaderText=" " SortExpression="Sname" >
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                            </asp:BoundField>
                            <asp:BoundField DataField="IdeaTitle" HeaderText="Idea Titile" SortExpression="IdeaTitle" >
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                            </asp:BoundField>
                            <asp:BoundField DataField="IdeaText" HeaderText="Idea Description" SortExpression="IdeaText" >
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                            </asp:BoundField>
                            <asp:BoundField DataField="CategoryName" HeaderText="Category" SortExpression="CategoryName" >
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TimeOfPost" HeaderText="Posted At" SortExpression="TimeOfPost" >
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                            </asp:BoundField>
                        </Columns>
                         </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString3 %>" ProviderName="<%$ ConnectionStrings:ConnectionString3.ProviderName %>" SelectCommand="SELECT [User].Fname, [User].Sname, Idea.IdeaTitle, Idea.IdeaText, Category.CategoryName,  Idea.TimeOfPost FROM ((Idea INNER JOIN [User] ON Idea.UserID = [User].UserID) INNER JOIN Category ON Idea.CategoryID = Category.CategoryID) WHERE Idea.Flagged = True"></asp:SqlDataSource>     
                        </p>
                    </div>
                </div>
            </div>

                           <div style="margin-bottom:50px">
                <div class="card radius shadowDepth1">
                    <div class="card__padding">
                        <h2 style="color: #000000">Review Uploaded Comments</h2>
                        <p style="color: #000000">
                       <hr>
                            <asp:GridView ID="GridView2" Width="100%" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
            <Columns>
                <asp:BoundField DataField="Sname" HeaderText="Sname" SortExpression="Sname" />
                <asp:BoundField DataField="Fname" HeaderText="Fname" SortExpression="Fname" />
                <asp:BoundField DataField="CommentText" HeaderText="CommentText" SortExpression="CommentText" />
                <asp:BoundField DataField="TimeOfPost" HeaderText="TimeOfPost" SortExpression="TimeOfPost" />
                 <asp:CommandField ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString3 %>" DeleteCommand="DELETE FROM [Comment] WHERE [CommentID] = @CommentID" ProviderName="<%$ ConnectionStrings:ConnectionString3.ProviderName %>" SelectCommand="SELECT [User].Sname, [User].Fname, Comment.CommentText, Comment.TimeOfPost FROM ([User] INNER JOIN Comment ON [User].UserID = Comment.UserID)"></asp:SqlDataSource>
   
                        &nbsp;</p>
                    </div>
                </div>
            </div>

             <div style="margin-bottom:50px">
                <div class="card radius shadowDepth1">
                    <div class="card__padding">
                        <h2 style="color: #000000">Manage QA Coordinators</h2>
                        <p style="color: #000000">
                       <hr>
                            <%--<asp:GridView ID="GridView3" Width="100%" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" DataKeyNames="UserID" OnSelectedIndexChanged="GridView3_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="Fname" HeaderText="Fname" SortExpression="Fname" />
                <asp:BoundField DataField="Sname" HeaderText="Sname" SortExpression="Sname" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                <asp:CheckBoxField DataField="Active" HeaderText="Active" SortExpression="Active" />
                 <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            </Columns>
        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString3 %>" DeleteCommand="DELETE FROM [User] WHERE [UserID] = ?" InsertCommand="INSERT INTO [User] ([UserID], [Fname], [Sname], [Email], [Password], [Active]) VALUES (?, ?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:ConnectionString3.ProviderName %>" SelectCommand="SELECT * FROM [User]" UpdateCommand="UPDATE [User] SET [Fname] = ?, [Sname] = ?, [Email] = ?, [Password] = ?, [Active] = ? WHERE [UserID] = ?">
                            <DeleteParameters>
                                <asp:Parameter Name="UserID" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="UserID" Type="Int32" />
                                <asp:Parameter Name="Fname" Type="String" />
                                <asp:Parameter Name="Sname" Type="String" />
                                <asp:Parameter Name="Email" Type="String" />
                                <asp:Parameter Name="Password" Type="String" />
                                <asp:Parameter Name="Active" Type="Boolean" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="Fname" Type="String" />
                                <asp:Parameter Name="Sname" Type="String" />
                                <asp:Parameter Name="Email" Type="String" />
                                <asp:Parameter Name="Password" Type="String" />
                                <asp:Parameter Name="Active" Type="Boolean" />
                                <asp:Parameter Name="UserID" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>--%>

                        <asp:Button ID="QA" runat="server" class="btn btn-warning btn-file btn-lg" Text="Manage QA Coordinators" OnClick="QA_Click" />

                       </p>
                    </div>
                </div>
            </div>

<%--        <div class="row">
            <div class="col-lg-3 col-md-1 col-sm-1 col-xs-12" style="margin-bottom:50px"></div>
            <div class="col-lg-6 col-md-10 col-sm-10 col-xs-12" style="margin-bottom:50px">
                <div class="card shadowDepth1">
                    <div class="card__padding">
                        <h2 style="color: #000000">Review Ideas </h2>
                        <hr>
                        <asp:GridView ID="ideaGrid" Width="100%" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" CellPadding="4" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="Fname" HeaderText="Fname" SortExpression="Fname" />
                <asp:BoundField DataField="Sname" HeaderText="Sname" SortExpression="Sname" />
                <asp:BoundField DataField="CategoryName" HeaderText="CategoryName" SortExpression="CategoryName" />
                <asp:BoundField DataField="IdeaTitle" HeaderText="IdeaTitle" SortExpression="IdeaTitle" />
                <asp:BoundField DataField="TimeOfPost" HeaderText="TimeOfPost" SortExpression="TimeOfPost" />
                <asp:BoundField DataField="ClosureDate" HeaderText="ClosureDate" SortExpression="ClosureDate" />
                <asp:CheckBoxField DataField="Anonymous" HeaderText="Anonymous" SortExpression="Anonymous" />
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString3 %>" ProviderName="<%$ ConnectionStrings:ConnectionString3.ProviderName %>" SelectCommand="SELECT [User].Fname, [User].Sname, Category.CategoryName, Idea.IdeaTitle, Idea.TimeOfPost, Idea.ClosureDate, Idea.Anonymous FROM ((Idea INNER JOIN [User] ON Idea.UserID = [User].UserID) INNER JOIN Category ON Idea.CategoryID = Category.CategoryID)"></asp:SqlDataSource>
                        <br>
                    </div>
                </div>
            </div>
            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12"></div>
        </div>--%>

<%--             <div class="row">
            <div class="col-lg-3 col-md-1 col-sm-1 col-xs-12" style="margin-bottom:50px"></div>
            <div class="col-lg-6 col-md-10 col-sm-10 col-xs-12" style="margin-bottom:50px">
                <div class="card shadowDepth1">
                    <div class="card__padding">
                        <h2 style="color: #000000">Review Comments </h2>
                        <hr>
                        <asp:GridView ID="commentGrid" Width="100%" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" CellPadding="4" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="Sname" HeaderText="Sname" SortExpression="Sname" />
                <asp:BoundField DataField="Fname" HeaderText="Fname" SortExpression="Fname" />
                <asp:BoundField DataField="CommentText" HeaderText="CommentText" SortExpression="CommentText" />
                <asp:BoundField DataField="TimeOfPost" HeaderText="TimeOfPost" SortExpression="TimeOfPost" />
                 <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            </Columns>
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString3 %>" ProviderName="<%$ ConnectionStrings:ConnectionString3.ProviderName %>" SelectCommand="SELECT [User].Sname, [User].Fname, Comment.CommentText, Comment.TimeOfPost FROM ([User] INNER JOIN Comment ON [User].UserID = Comment.UserID)"></asp:SqlDataSource>
   
                        <br>
                    </div>
                </div>
            </div>
            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12"></div>
        </div>--%>

<%--             <div class="row">
            <div class="col-lg-3 col-md-1 col-sm-1 col-xs-12" style="margin-bottom:50px"></div>
            <div class="col-lg-6 col-md-10 col-sm-10 col-xs-12" style="margin-bottom:50px">
                <div class="card shadowDepth1">
                    <div class="card__padding">
                        <h2 style="color: #000000">Review Users </h2>
                        <hr>
                        <asp:GridView ID="UserGrid" Width="100%" runat="server" AutoGenerateColumns="False" DataKeyNames="UserID" DataSourceID="users" CellPadding="4" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="UserID" HeaderText="UserID" InsertVisible="False" ReadOnly="True" SortExpression="UserID" />
                <asp:BoundField DataField="Fname" HeaderText="Fname" SortExpression="Fname" />
                <asp:BoundField DataField="Sname" HeaderText="Sname" SortExpression="Sname" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:CheckBoxField DataField="Active" HeaderText="Active" SortExpression="Active" />
                 <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            </Columns>
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:SqlDataSource ID="users" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString3 %>" DeleteCommand="DELETE FROM [User] WHERE [UserID] = ?" InsertCommand="INSERT INTO [User] ([UserID], [Fname], [Sname], [Email], [Password], [Active]) VALUES (?, ?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:ConnectionString3.ProviderName %>" SelectCommand="SELECT UserID, Fname, Sname, Email, Active FROM [User]" UpdateCommand="UPDATE [User] SET [Fname] = ?, [Sname] = ?, [Email] = ?, [Password] = ?, [Active] = ? WHERE [UserID] = ?">
            <DeleteParameters>
                <asp:Parameter Name="UserID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="UserID" Type="Int32" />
                <asp:Parameter Name="Fname" Type="String" />
                <asp:Parameter Name="Sname" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Password" Type="String" />
                <asp:Parameter Name="Active" Type="Boolean" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Fname" Type="String" />
                <asp:Parameter Name="Sname" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Password" Type="String" />
                <asp:Parameter Name="Active" Type="Boolean" />
                <asp:Parameter Name="UserID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
                        <br>
                    </div>
                </div>
            </div>
            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12"></div>
        </div>--%>

    </div>
    </div>
        </body>
</asp:Content>
