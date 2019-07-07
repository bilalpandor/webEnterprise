using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using webEnterprise.Models;

namespace webEnterprise
{
    public partial class Login : System.Web.UI.Page
    {
        private bool firstLogin;

        protected void Page_Load(object sender, EventArgs e)
        {

            //User user = (User)Session["User"];
            //user = null;
        }

        protected void Login_Click(object sender, EventArgs e)
        {
            string email = emailAddress.Value;
            string password = pwd.Value;

            if (email == "" || password == "")
            {
                errorLbl.Visible = true;
                errorLbl.Text = "Please enter login details";


            }
            else
            {
                User thisUser = DBconnectivity.LoginWithDept(email, password);

                if (thisUser == null)
                {
                    errorLbl.Visible = true;
                }
                else
                {
                    DateTime t1 = DateTime.Parse("2012/12/12 15:00:00.000");
                    int same = TimeSpan.Compare(thisUser.LastLogin.TimeOfDay, t1.TimeOfDay);
                    if (same == 0)
                    {
                        firstLogin = true;
                        Session["FirstLogin"] = firstLogin;
                        Session["User"] = thisUser;
                        DBconnectivity.updateLastLogin(DateTime.Now, thisUser);
                        Response.Redirect("Welcome.aspx");
                    }
                    else
                    {
                        firstLogin = false;
                        Session["FirstLogin"] = firstLogin;
                        Session["User"] = thisUser;
                        DBconnectivity.updateLastLogin(DateTime.Now, thisUser);
                        Response.Redirect("Welcome.aspx");
                    }

                }
            }
            
        }

        protected void Register_Click(object sender, EventArgs e)
        {
            Console.WriteLine("Register Clicked");
            Response.Redirect("Register.aspx");
        }

    }
}