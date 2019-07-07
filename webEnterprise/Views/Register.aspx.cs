using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using webEnterprise.Models;

namespace webEnterprise
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CreateBtn_Click(object sender, EventArgs e)
        {
            string email = emailAddress.Value;
            string password = pwd.Value;
            string passwordConfirm = pwdConfirm.Value;
            Department userDept = null;

            if (DropDownList1.SelectedIndex == 0)
            {
                 userDept = new Department(3,DropDownList1.SelectedItem.ToString());
            } else if (DropDownList1.SelectedIndex == 1)
            {
                 userDept = new Department(4, DropDownList1.SelectedItem.ToString());

            }
            else if (DropDownList1.SelectedIndex == 2)
            {
                 userDept = new Department(5, DropDownList1.SelectedItem.ToString());


            }
            else if (DropDownList1.SelectedIndex == 3)
            {
                 userDept = new Department(6, DropDownList1.SelectedItem.ToString());


            }

            string fName = Fname.Value;
            string lName = Lname.Value;


            Console.WriteLine("CHOSEN VALUES " + email + " " + password + " " + fName + " " + lName);

            if (fName == "" || lName == "" || email == "" || password == "" || passwordConfirm == "")
            {
                errorLbl.Visible = true;
                errorLbl.Text = "Please Complete All Fields";
  
            }
            else
            {
                    if (password == passwordConfirm)
                    {
                        Boolean success = DBconnectivity.Register(email, password, fName, lName, userDept);
                        if (success)
                        {
                            Console.WriteLine("USER SUCCESSFULLY REGISTERED");
                            Response.Redirect("Login.aspx");
                        }
                        else
                        {
                            Console.WriteLine("ERROR REGISTERING USER");
                        }
                    }
                    else
                    {
                        errorLbl.Visible = true;
                        errorLbl.Text = "Passwords Do Not Match";
                        Console.WriteLine("PASSWORDS ARE NOT THE SAME");
                    }
            }
        }

        protected void Login_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void itemSelected(object sender, EventArgs e)
        {
           //Response.Write("Getting clicked; " + sender.GetType().ToString());
            Console.WriteLine("CHOSEN VALUES " + DropDownList1.SelectedIndex + " " + DropDownList1.SelectedValue);
        }
    }
}