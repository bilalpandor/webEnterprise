using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using webEnterprise.Models;

namespace webEnterprise.Views
{
    public partial class SelectedIdea : System.Web.UI.Page
    {
        private Idea thisIdea;
        private User thisUser;
        private Boolean rating;

        protected void Page_Load(object sender, EventArgs e)
        {
            thisUser = (User)Session["User"];
            thisIdea = (Idea)Session["Idea"];

            DBconnectivity.AddViewToIdea(thisIdea);

            SqlDataSource1.SelectCommand = "SELECT Comment.CommentID, Comment.CommentText, [User].Fname, Comment.TimeOfPost FROM [Idea], [User], [Comment] WHERE Idea.IdeaID = Comment.IdeaID AND Comment.UserID = USER.UserID AND (Idea.IdeaID = " + thisIdea.IdeaID + ") AND USER.Active = TRUE";
            SqlDataSource2.SelectCommand = "SELECT COUNT(ThumbRating) AS Expr1 FROM Rating r WHERE (IdeaID = " + thisIdea.IdeaID + ") AND (ThumbRating = TRUE)";
            SqlDataSource3.SelectCommand = "SELECT COUNT(ThumbRating) AS ThumbsDown FROM Rating r WHERE (IdeaID = " + thisIdea.IdeaID + ") AND (ThumbRating = false)";

            IdeaLbl.Text = thisIdea.IdeaTitle;
            IdeaID.Text = thisIdea.IdeaID.ToString();
            IdeaTitle.Text = thisIdea.IdeaTitle;
            IdeaText.Text = thisIdea.IdeaText;
            IdeaCategory.Text = thisIdea.Category.CategoryName;

            if (thisIdea.Anonymous)
            {
                User.Text = "This Post Is Anonymous";
            }
            else
            {
                User.Text = thisIdea.IdeaAuthor.FirstName + " " + thisIdea.IdeaAuthor.Surname;
            }

            DateTime finalDate = DBconnectivity.getFinalClosureDate();

            int result = DateTime.Compare(finalDate, DateTime.Now);

            if (result == 1)
            {
                if (thisUser.Active == false)
                {
                    CommentTxt.Visible = false;
                    LeaveComment.Visible = false;
                    bannedlbl.Text = "You are banned from commenting please contact the system admin if you have any enqurires";

                    //a label may need to be added to the user stating they are blocked from comments!! otherwise it looks weird
                }
            } else
            {
                CommentTxt.Visible = false;
                LeaveComment.Visible = false;
                bannedlbl.Text = "Closure Date For Ideas Has Passed.";
            }
        }

        protected void TextBox4_TextChanged(object sender, EventArgs e)
        {

        }

        protected void LeaveComment_Click(object sender, EventArgs e)
        {
            string comment = CommentTxt.Text;
            Comment thisComment = new Models.Comment(comment, DateTime.Now, thisUser, thisIdea);

            bool success = DBconnectivity.AddComment(thisComment);

            if (success)
            {
                //send an email to thisIdea.IdeaAuthor.Email

                MailMessage mail = new MailMessage();
                mail.From = new MailAddress("codingwarriorsideasystem@gmail.com");
                mail.To.Add(thisIdea.IdeaAuthor.Email);
                mail.Body = "A Comment Has Just Been Posted On Your Idea\n" + "     Idea title:" + thisIdea.IdeaTitle + "\n      Comment Posted: " + thisComment.CommentText +
                            "\n\n     User Details;" + "\n     Name: " + thisUser.FirstName + " " + thisUser.Surname + "\n     Email:" + thisUser.Email + "\n\n\n               THIS IS AN AUTOMATED EMAIL, DO NOT REPLY";
                mail.Subject = "Someone Has Commeneted On Your Idea";
                mail.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "Smtp.gmail.com"; //Or Your SMTP Server Address
                smtp.Credentials = new System.Net.NetworkCredential
                     ("codingwarriorsideasystem@gmail.com", "thispassword"); // ***use valid credentials*** add email + password
                smtp.Port = 587;
                smtp.EnableSsl = true;
                smtp.Send(mail);

                Response.Redirect("ViewIdea.aspx");
            }
            
        }

        protected void Thumbsup_Click(object sender, EventArgs e)
        {
            rating = true;
            Rating thisRating = new Rating(rating, thisUser, thisIdea);
            DBconnectivity.AddRating(thisRating);
        }

        protected void ThumbsDown_Click(object sender, EventArgs e)
        {
            rating = false;
            Rating thisRating = new Rating(rating, thisUser, thisIdea);
            DBconnectivity.AddRating(thisRating);
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {






        }

        protected void Flagged_Click(object sender, EventArgs e)
        {
            bool flagged = DBconnectivity.flagIdea(thisIdea);

            if (flagged)
            {
              
                    errorlbl.Text = "Succussfully flagged this idea. Admin will be notified";
                   // System.Text.StringBuilder sb = new System.Text.StringBuilder();
                    //sb.Append("alert('");
                  //  sb.Append(message);
                    //sb.Append("');");
                  //  ClientScript.RegisterOnSubmitStatement(this.GetType(), "alert", sb.ToString());
                
            } else
            {
                errorlbl.Text = "Error flagging this idea, try again";
                //System.Text.StringBuilder sb = new System.Text.StringBuilder();
                //sb.Append("alert('");
                //sb.Append(message);
                //sb.Append("');");
                //ClientScript.RegisterOnSubmitStatement(this.GetType(), "alert", sb.ToString());
            }
        }
    }
}