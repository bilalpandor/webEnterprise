<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="ManageCategories.aspx.cs" Inherits="webEnterprise.Views.ManageCategories" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <html lang="en">
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
<h1>QA Manager Dashboard</h1></div>

             <div style="margin-bottom:50px">
                <div class="card radius shadowDepth1">
                    <div class="card__padding">
                        <h2 style="color: #000000">Add A New Category</h2>
                        <p style="color: #000000"></p>
                       <hr>                       
                        <div>  
               
                    <input type="text" class="form-control input-lg" placeholder="New Category Name"  id="categoryTxt" runat="server" style="left: 0px; top: 0px; width: 100%">
                <div class="text-center">
                    <br />
                    <asp:Button ID="Category" class="btn btn-warning btn-file btn-lg" runat="server" Text="Add Category" OnClick="Category_Click" />
                </div>
                <br>
                   
            </div>
            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12"></div>
        </div>
                 </div>

             </div>

       <!--row 2-->
             <div style="margin-bottom:50px">
                <div class="card radius shadowDepth1">
                    <div class="card__padding">
                        <h2 style="color: #000000">Categories In Use</h2>
                        <p style="color: #000000"></p>
                       <hr>                       
                        <div>                      
                          
                        <asp:GridView ID="GridView1"  class="btn-lg btn-danger" runat="server" AutoGenerateColumns="False" DataKeyNames="CategoryID" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None"  Width="100%">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="CategoryID" HeaderText="Category ID" InsertVisible="False" ReadOnly="True" SortExpression="CategoryID" />
                                <asp:BoundField DataField="CategoryName" HeaderText="Category Name" SortExpression="CategoryName" />
                            </Columns>
                            <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EFF3FB" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                        </asp:GridView>
                        &nbsp;
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT DISTINCT [c.CategoryID] AS CategoryID, [c.CategoryName] AS CategoryName FROM (Category c INNER JOIN Idea i ON c.CategoryID = i.CategoryID)">
                                </asp:SqlDataSource>
                            </div>
                        </div>
                        
                        <hr>
                   
            </div>
            
            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12" style="margin-bottom:50px"></div>
        </div>

             <!--row 2-->
             <div style="margin-bottom:50px">
                <div class="card radius shadowDepth1">
                    <div class="card__padding">
                        <h2 style="color: #000000">Delete Categories (Not in Use)</h2>
                        <p style="color: #000000"></p>
                       <hr>                       
                        <div>  
                           
                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="CategoryID" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" Width="100%" AllowPaging="True" AllowSorting="True">
                                <Columns>
                                    <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" SortExpression="CategoryID" InsertVisible="False" ReadOnly="True" />
                                    <asp:BoundField DataField="CategoryName" HeaderText="CategoryName" SortExpression="CategoryName" />
                                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />
                                </Columns>
                            </asp:GridView>
                       &nbsp;
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString3 %>" ProviderName="<%$ ConnectionStrings:ConnectionString3.ProviderName %>" SelectCommand="SELECT c.CategoryID, c.CategoryName FROM (Category c LEFT OUTER JOIN Idea i ON i.CategoryID = c.CategoryID) WHERE (i.CategoryID IS NULL)" DeleteCommand="DELETE FROM [Category] WHERE CategoryID = @CategoryID" >

                              </asp:SqlDataSource></div>
                        </div>
                    </div>
                </div>

             <div style="margin-bottom:50px">
                <div class="card radius shadowDepth1">
                    <div class="card__padding">
                        <h2 style="color: #000000">Manage Users</h2>
                        <p style="color: #000000"></p>
                       <hr>                     
                        <div>  
                           
                           <asp:GridView ID="GridView3" Width="100%"  CellPadding="4" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" DataKeyNames="UserID">
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
                        </asp:SqlDataSource>
                       </div>                    
                    </div>
                </div>
        </div>

         <div style="margin-bottom:50px">
                <div class="card radius shadowDepth1">
                    <div class="card__padding">
                        <h2 style="color: #000000">Export All Data From Database</h2>
                        <p style="color: #000000">
                            <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataKeyNames="CommentID" DataSourceID="SqlDataSource5">
                                <Columns>
                                    <asp:BoundField DataField="CommentID" HeaderText="CommentID" InsertVisible="False" ReadOnly="True" SortExpression="CommentID" />
                                    <asp:BoundField DataField="IdeaID" HeaderText="IdeaID" SortExpression="IdeaID" />
                                    <asp:BoundField DataField="Expr1" HeaderText="Expr1" SortExpression="Expr1" />
                                    <asp:BoundField DataField="CommentText" HeaderText="CommentText" SortExpression="CommentText" />
                                    <asp:BoundField DataField="TimeOfPost" HeaderText="TimeOfPost" SortExpression="TimeOfPost" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString6 %>" ProviderName="<%$ ConnectionStrings:ConnectionString6.ProviderName %>" SelectCommand="SELECT CommentID, IdeaID, UserID AS Expr1, CommentText, TimeOfPost FROM Comment"></asp:SqlDataSource>
                        </p>
                        <p style="color: #000000">
                            <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" DataKeyNames="IdeaID" DataSourceID="SqlDataSource4">
                                <Columns>
                                    <asp:BoundField DataField="IdeaID" HeaderText="IdeaID" InsertVisible="False" ReadOnly="True" SortExpression="IdeaID" />
                                    <asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" />
                                    <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" SortExpression="CategoryID" />
                                    <asp:BoundField DataField="IdeaTitle" HeaderText="IdeaTitle" SortExpression="IdeaTitle" />
                                    <asp:BoundField DataField="IdeaText" HeaderText="IdeaText" SortExpression="IdeaText" />
                                    <asp:BoundField DataField="TimeOfPost" HeaderText="TimeOfPost" SortExpression="TimeOfPost" />
                                    <asp:BoundField DataField="ClosureDate" HeaderText="ClosureDate" SortExpression="ClosureDate" />
                                    <asp:CheckBoxField DataField="Anonymous" HeaderText="Anonymous" SortExpression="Anonymous" />
                                    <asp:BoundField DataField="IdeaViews" HeaderText="IdeaViews" SortExpression="IdeaViews" />
                                    <asp:CheckBoxField DataField="Flagged" HeaderText="Flagged" SortExpression="Flagged" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString7 %>" ProviderName="<%$ ConnectionStrings:ConnectionString7.ProviderName %>" SelectCommand="SELECT * FROM [Idea]"></asp:SqlDataSource>
                        </p>
                       <hr>                       
                        <div>  
                                            <div class="text-center">
                    <br />
                    <asp:Button ID="ExportButton" class="btn btn-warning btn-file btn-lg" runat="server" Text="Export Idea Data" OnClick="ExportButton_Click" />
                </div>
                <br>
                    </div>
                </div>
          </div>           
    </div>
</body>

</html>



 





 


    </div>



 





 


</div>



 





 


</asp:Content>
