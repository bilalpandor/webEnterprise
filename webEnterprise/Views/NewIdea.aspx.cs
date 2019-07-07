using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using webEnterprise.Models;

namespace webEnterprise.Views
{
    public partial class NewIdea : System.Web.UI.Page
    {
        private User thisUser;
        private bool terms = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            thisUser = (User)Session["User"];
        }

        protected void itemSelected(object sender, EventArgs e)
        {

        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            if (thisUser.Active)
            {   
                //if this user is active, and so is allowed to post a new idea, continue


                terms = termCheck.Checked;
                if (!Page.IsValid)
                {
                    errorlist.Text = "Please complete all fields!";
                    //System.Text.StringBuilder sb = new System.Text.StringBuilder();
                    //sb.Append("alert('");
                    //sb.Append(message);
                    //sb.Append("');");
                    //ClientScript.RegisterOnSubmitStatement(this.GetType(), "alert", sb.ToString());
                }
                else if (Page.IsValid && terms == false)
                {
                    errorlist.Text = "You must agree to our Terms and Conditions before uploading!";
                    errorlist.Visible = true;
                }
                else if (Page.IsValid && terms == true)
                {

                    string cat = DropDownList1.SelectedItem.Value;
                    Category thisCategory = DBconnectivity.GetCategory(cat);
                    Category d = new Category(DropDownList1.SelectedIndex, DropDownList1.SelectedValue);

                    DateTime ideaDate = DBconnectivity.getIdeaClosureDate();

                    int result = DateTime.Compare(ideaDate, DateTime.Now);

                    if (result == 1)
                    {

                        Idea thisIdea = new Idea(IdeaTitle.Value, IdeaDesc.Value, DateTime.Now, thisCategory, DateTime.Now.AddMonths(1), thisUser, anonCheck.Checked);
  
                        //File upload - optional to the user
                        if (uploadFile.PostedFile != null && uploadFile.PostedFile.ContentLength > 0)
                        {

                            string fileName = Path.GetFileName(uploadFile.PostedFile.FileName);
                            string folder = Server.MapPath("~/uploads/");
                            Directory.CreateDirectory(folder);
                            uploadFile.PostedFile.SaveAs(Path.Combine(folder, fileName));
                            try
                            {
                                _msg.Text = "Success,images saved";
                                Response.Write("Uploaded: " + fileName);
                            }
                            catch
                            {
                                _msg.Text = "Operation Failed!!!";
                            }
                        }

                        bool success = thisIdea.SubmitIdea();

                        if (success)
                        {

                            //get department QA Coor, send an email.
                            User QACoor = DBconnectivity.getQACoorForDept(thisUser.Department.Id);

                            MailMessage mail = new MailMessage();
                            mail.From = new MailAddress("codingwarriorsideasystem@gmail.com");
                            mail.To.Add(QACoor.Email);
                            mail.Body = "An Idea Has Been Posted By A Member Of Your Department\n" + "Idea title:" + IdeaTitle.Value + "\n Description of idea: " + IdeaDesc.Value + "\n Idea Category: " + thisCategory.CategoryName +
                                        "\n\nUser Details;" + "\nName: " + thisUser.FirstName + " " + thisUser.Surname + "\nEmail:" + thisUser.Email + "\n\n\nTHIS IS AN AUTOMATED EMAIL, DO NOT REPLY";
                            mail.Subject = "Idea Submission For Your Department";
                            mail.IsBodyHtml = true;
                            SmtpClient smtp = new SmtpClient();
                            smtp.Host = "Smtp.gmail.com"; //Or Your SMTP Server Address
                            smtp.Credentials = new System.Net.NetworkCredential
                                 ("codingwarriorsideasystem@gmail.com", "thispassword"); // ***use valid credentials*** add email + password
                            smtp.Port = 587;
                            smtp.EnableSsl = true;
                            smtp.Send(mail);

                            Session["User"] = thisUser;
                            Response.Redirect("Welcome.aspx");
                        }
                        else
                        {
                            errorlist.Visible = true;
                            errorlist.Text = "An error has occured, please try again";
                        }
                    }
                    else
                    {
                        errorlist.Visible = true;

                        //past final closure date, display an error
                        errorlist.Text = "Closure Date For Ideas Has Passed, Sorry!";
                        //System.Text.StringBuilder sb = new System.Text.StringBuilder();
                        //sb.Append("alert('");
                        //sb.Append(message);
                        //sb.Append("');");
                        //ClientScript.RegisterOnSubmitStatement(this.GetType(), "alert", sb.ToString());
                    }
                }
            } else
            {
                errorlist.Visible = true;

                //if the user is not active, display a message explaining this
                errorlist.Text = "Your Account Has Been Disabled! Please Contact Your Department Cooridnator For Furhter Details";
                //System.Text.StringBuilder sb = new System.Text.StringBuilder();
                //sb.Append("alert('");
                //sb.Append(message);
                //sb.Append("');");
                //ClientScript.RegisterOnSubmitStatement(this.GetType(), "alert", sb.ToString());
            }
        }
    }
}