using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using webEnterprise.Models;

namespace webEnterprise.Views
{
    public partial class Welcome : System.Web.UI.Page
    {
        private User thisUser;
        private Boolean firstLogin;

        protected void Page_Load(object sender, EventArgs e)
        {
            AdminPage.Visible = false;
            QACoorPage.Visible = false;
            QAManagerPage.Visible = false;


            firstLogin = (bool)Session["FirstLogin"];
            thisUser = (User)Session["User"];

            if (firstLogin)
            {
                Label1.Text = "<br> This is your first login";
            } else
            {
                Label1.Text = "<br>Your last login was on " + thisUser.LastLogin.DayOfWeek + ", " + thisUser.LastLogin.Date;
            }

            if (thisUser.Admin)
            {
                AdminPage.Visible = true;
            }

            if (thisUser.QaCoor)
            {
                QACoorPage.Visible = true;
            }

            if (thisUser.QaMan)
            {
                QAManagerPage.Visible = true;
            }
        }

        protected void ViewIdeas_Click(object sender, EventArgs e)
        {
            Session["User"] = thisUser;
            Response.Redirect("ViewIdea.aspx");
        }

        protected void AdminPage_Click(object sender, EventArgs e)
        {
            Session["User"] = thisUser;
            Response.Redirect("Admin.aspx");
        }

        protected void NewIdea_Click(object sender, EventArgs e)
        {
            Session["User"] = thisUser;
            Response.Redirect("NewIdea.aspx");
        }

        protected void QAManagerPage_Click(object sender, EventArgs e)
        {
            Session["User"] = thisUser;
            Response.Redirect("ManageCategories.aspx");
        }

        protected void QACoorPage_Click(object sender, EventArgs e)
        {
            Session["User"] = thisUser;
            Response.Redirect("QACoordinator.aspx");
        }
    }
}