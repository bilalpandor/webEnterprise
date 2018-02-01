<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="webEnterprise.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!DOCTYPE html>
<html lang="en">


<body>


    <div class="container">
        <!--back-to-top arrow (start)-->
        <div id="backtotop" class="mcOut" style="display: none;">&#8677;</div>
        <!--back-to-top arrow (end)-->

        <h1>Register</h1>
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
                                <input type="text" class="form-control" placeholder="email address" aria-describedby="sizing-addon1">
                            </div>
                            <br/>
                            <!--Password-->
                            <div class="input-group input-group-lg">
                                <span class="input-group-addon" id="sizing-addon1"><span class="glyphicon glyphicon-lock"></span></span>
                                <input type="password" placeholder="password" class="form-control" id="pwd">
                            </div>
                            <br/>
                            <!--Password-->
                            <div class="input-group input-group-lg">
                                <span class="input-group-addon" id="sizing-addon1"><span class="glyphicon glyphicon-lock"></span></span>
                                <input type="password" placeholder="confirm password" class="form-control" id="pwd">
                            </div>
                            <br/>
                            <button type="button" class="btn btn-primary btn-lg" "</button>
                        </article>
                    </div>
                </div>
            </div>


            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12"></div>
        </div>

        <p style="text-align: center">Already have an account? <button type="button" class="btn btn-secondary btn-lg" style="background-color:black" id="loginBtn">Login now</button></p>
    </div>
</body>

</html>


</asp:Content>
