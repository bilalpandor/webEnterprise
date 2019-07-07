using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using webEnterprise.Models;

namespace webEnterprise.Views
{
    public partial class QACoordinator : System.Web.UI.Page
    {
        private User thisUser;

        protected void Page_Load(object sender, EventArgs e)
        {

            thisUser = (User)Session["user"];
            DeptLabel.Text = thisUser.Department.DepartmentName;
            //SqlDataSource1.SelectCommand = "SELECT [User].Email, Category.CategoryName, Idea.IdeaTitle, Idea.IdeaText FROM(((([User] INNER JOIN UserDepartment ON[User].UserID = UserDepartment.UserID) INNER JOIN " +
            //                                "Idea ON[User].UserID = Idea.UserID) INNER JOIN Category ON Idea.CategoryID = Category.CategoryID) INNER Department ON UserDepartment.DepartmentID = Department.DepartmentID)" +
            //                                " WHERE(Department.DepartmentID = " + thisUser.Department.Id + ")";
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Encourage_Click(object sender, EventArgs e)
        {
            List<User> deptUsers = DBconnectivity.getUserByDept(thisUser.Department.Id);

            foreach (User u in deptUsers){
                MailMessage mail = new MailMessage();
                mail.From = new MailAddress("codingwarriorsideasystem@gmail.com");
                mail.To.Add(u.Email);
                mail.Body = "This Is An Email Pertaining To The Universities New Staff Idea SUbmission System.   -   Just a little message to remind you to think up and upload your own ideas of how we can improve our department and uni. " +
                    "\n\n\nSent By The " + thisUser.Department.DepartmentName + "'s QA Coordinator     -      THIS IS AN AUTOMATED EMAIL, DO NOT REPLY";
                mail.Subject = "Reminder To Add Contributions To The Idea System";
                mail.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "Smtp.gmail.com"; //Or Your SMTP Server Address
                smtp.Credentials = new System.Net.NetworkCredential
                     ("codingwarriorsideasystem@gmail.com", "thispassword"); // ***use valid credentials*** add email + password
                smtp.Port = 587;
                smtp.EnableSsl = true;
                smtp.Send(mail);
            }
        }
    }
}