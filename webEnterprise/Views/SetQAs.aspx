<%@ Page Language="C#"  MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SetQAs.aspx.cs" Inherits="webEnterprise.Views.SetQAs" %>
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
<h1>Set QA Coordinator For Each Department</h1>
             </div>

             <div style="margin-bottom:50px">
                <div class="card radius shadowDepth1">
                    <div class="card__padding">
                        <h2 style="color: #000000">Faculty of Architecture, Computing and Humanities</h2>
                        <p style="color: #000000"></p>
                       <hr>                       
                        <div>              
                            <asp:DropDownList ID="FACHDropDown" runat="server" AutoPostBack="True" class="form-control input-lg" DataSourceID="SqlDataSource1" DataTextField="Email" DataValueField="Email" >

                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString3 %>" ProviderName="<%$ ConnectionStrings:ConnectionString3.ProviderName %>" SelectCommand="SELECT [Email] FROM [User]"></asp:SqlDataSource>
&nbsp;<div class="text-center">
                    <br />
                    <asp:Button ID="FACH" class="btn btn-warning btn-file btn-lg" runat="server" Text="Set As QA-Coordinator For This Department" OnClick="FACH_Click"  />
                </div>
                <br>
                   
            </div>
            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12"></div>
        </div>
        </div>
    </div>

             <div style="margin-bottom:50px">
                <div class="card radius shadowDepth1">
                    <div class="card__padding">
                        <h2 style="color: #000000">Faculty Of Education And Health</h2>
                        <p style="color: #000000"></p>
                       <hr>                       
                        <div>                
                            <asp:DropDownList ID="FEHDropDown" runat="server" AutoPostBack="True" class="form-control input-lg" DataSourceID="SqlDataSource1" DataTextField="Email" DataValueField="Email" >

                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString3 %>" ProviderName="<%$ ConnectionStrings:ConnectionString3.ProviderName %>" SelectCommand="SELECT [Email] FROM [User]"></asp:SqlDataSource>
&nbsp;<div class="text-center">
                    <br />
                    <asp:Button ID="FEH" class="btn btn-warning btn-file btn-lg" runat="server" Text="Set As QA-Coordinator For This Department" OnClick="FEH_Click" />
                </div>
                <br>
                   
            </div>
            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12"></div>
        </div>
        </div>
    </div>

             <div style="margin-bottom:50px">
                <div class="card radius shadowDepth1">
                    <div class="card__padding">
                        <h2 style="color: #000000">Faculty OF Engineering And Science</h2>
                        <p style="color: #000000"></p>
                       <hr>                       
                        <div>                 
                            <asp:DropDownList ID="FESDropwDown" runat="server" AutoPostBack="True" class="form-control input-lg" DataSourceID="SqlDataSource1" DataTextField="Email" DataValueField="Email" >

                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString3 %>" ProviderName="<%$ ConnectionStrings:ConnectionString3.ProviderName %>" SelectCommand="SELECT [Email] FROM [User]"></asp:SqlDataSource>
&nbsp;<div class="text-center">
                    <br />
                    <asp:Button ID="FES" class="btn btn-warning btn-file btn-lg" runat="server" Text="Set As QA-Coordinator For This Department" OnClick="FES_Click" />
                </div>
                <br>
                   
            </div>
            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12"></div>
        </div>
        </div>
    </div>

             <div style="margin-bottom:50px">
                <div class="card radius shadowDepth1">
                    <div class="card__padding">
                        <h2 style="color: #000000">Business School</h2>
                        <p style="color: #000000"></p>
                       <hr>                       
                        <div>                 
                            <asp:DropDownList ID="BSDropDown" runat="server" AutoPostBack="True" class="form-control input-lg" DataSourceID="SqlDataSource1" DataTextField="Email" DataValueField="Email" >

                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString3 %>" ProviderName="<%$ ConnectionStrings:ConnectionString3.ProviderName %>" SelectCommand="SELECT [Email] FROM [User]"></asp:SqlDataSource>
&nbsp;<div class="text-center">
                    <br />
                    <asp:Button ID="BS" class="btn btn-warning btn-file btn-lg" runat="server" Text="Set As QA-Coordinator For This Department" OnClick="BS_Click" />
                </div>
                <br>
                   
            </div>
            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12"></div>
        </div>
        </div>
    </div>  
    </div>
</body>

</html>
    </div>
</asp:Content>
