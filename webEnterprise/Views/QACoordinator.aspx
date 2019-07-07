<%@ Page Language="C#"  MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QACoordinator.aspx.cs" Inherits="webEnterprise.Views.QACoordinator" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<!DOCTYPE html>

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
<h1>QA Coordinator Page</h1></div>
             <div style="margin-bottom:50px">
                <div class="card radius shadowDepth1">
                    <div class="card__padding">
                        <h2 style="color: #000000">Your Department</h2>
                        <p style="color: #000000"></p>
                       <hr>                       
                        <div>   
               
                    
                <div class="text-center">
                    <asp:Label ID="DeptLabel" runat="server" Text="Label"></asp:Label>
                    <br />
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
                        <h2 style="color: #000000">Ideas From Your Department</h2>
                        <p style="color: #000000"></p>
                       <hr>                       
                        <div>                         
                          
                        <asp:GridView ID="GridView1"  class="btn-lg btn-danger" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None"  Width="100%">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                                <asp:BoundField DataField="CategoryName" HeaderText="CategoryName" SortExpression="CategoryName" />
                                <asp:BoundField DataField="IdeaTitle" HeaderText="IdeaTitle" SortExpression="IdeaTitle" />
                                <asp:BoundField DataField="IdeaText" HeaderText="IdeaText" SortExpression="IdeaText" />
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
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString3 %>" ProviderName="<%$ ConnectionStrings:ConnectionString3.ProviderName %>" SelectCommand="SELECT [User].Email, Category.CategoryName, Idea.IdeaTitle, Idea.IdeaText FROM (((([User] INNER JOIN UserDepartment ON [User].UserID = UserDepartment.UserID) INNER JOIN Idea ON [User].UserID = Idea.UserID) INNER JOIN Category ON Idea.CategoryID = Category.CategoryID) INNER JOIN Department ON UserDepartment.DepartmentID = Department.DepartmentID) WHERE (Department.DepartmentID = 4)">
                                </asp:SqlDataSource>                  
            </div>
            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12" style="margin-bottom:50px"></div>
        </div>
</div>

            
    </div>

        <div style="margin-bottom:50px">
                <div class="card radius shadowDepth1">
                    <div class="card__padding">
                        <h2 style="color: #000000">Send Emails to Staff In Your Department to Encourage Contribution</h2>
                        <p style="color: #000000"></p>
                       <hr>                       
                        <div>                         
                          
                      <asp:Button ID="Encourage" class="btn btn-warning btn-file btn-lg" runat="server" Text="Send Emails" OnClick="Encourage_Click" />

                   
            </div>
            
            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12" style="margin-bottom:50px"></div>
        </div>
</div>

            
    </div>
</body>

</html>



 





 


    </div>



              </div>

    </div>





 


</asp:Content>
