<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="webEnterprise.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<body>

    <div class="container">
        <!--back-to-top arrow (start)-->
        <div id="backtotop" class="mcOut" style="display: none;">▲</div>
        <!--back-to-top arrow (end)-->

        <h1>Login</h1>

        <!--12 column system-->
        <!--row 1-->
        <div class="row">
            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12"></div>

            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12" style="margin-bottom:50px">
                <div class="card radius shadowDepth1">
                    <div class="card__content card__padding">
                        <article class="card__article">
                            <div class="input-group input-group-lg">
                                <span class="input-group-addon" id="sizing-addon1"><span class="fa fa-at fa-fw"></span></span>
                                <input type="text" runat="server" id="emailAddress" required class="form-control" placeholder="email address" aria-describedby="sizing-addon1">
                            </div>
                            <br />
                            <div class="input-group input-group-lg">
                                <span class="input-group-addon" id="sizing-addon1"><span class="fa fa-unlock fa-fw"></span>
                                </span>
                                <input type="password" placeholder="password" class="form-control" id="pwd" runat="server">

                            </div>
                            <br />
                            <div class="input-group">
                                 <p style="text-align: center">
                                <asp:Button ID="loginBtn" runat="server" OnClick="Button1_Click" runat="server" Text="Button" />
                            </div>

                            <!--
<div class="checkbox">
  <label style="color:black"><input type="checkbox" value="">Remember me</label>
</div>
-->

                        </article>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12"></div>
        </div>

        <p style="text-align: center">Not registered?<button type="button" class="btn btn-secondary btn-lg" style="background-color:black" onserverclick="Register_Click">Create an account</button></p>
        <br />
        <p style="text-align: center">
           

    </div>
</body>

</html>

</asp:Content>
