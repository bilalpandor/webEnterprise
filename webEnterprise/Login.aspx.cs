﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webEnterprise
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string email = emailAddress.Value;
            string password = pwd.Value;
            DBconnectivity.Login(email, password);
            Console.WriteLine("Register Clicked");
        }

        protected void Register_Click(object sender, EventArgs e)
        {
            Console.WriteLine("Register Clicked");
            
        }
    }
}