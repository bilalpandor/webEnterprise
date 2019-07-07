using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using webEnterprise.Models;

namespace webEnterprise.Views
{
    public partial class ViewIdea : System.Web.UI.Page
    {
        private User thisUser;

        protected void Page_Load(object sender, EventArgs e)
        {
            thisUser = (User)Session["User"];

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (GridView1.SelectedIndex >= 0) {
                ViewState["SelectedKey"] = GridView1.SelectedValue;
                int ideaID = Int32.Parse(GridView1.SelectedValue.ToString());
                Console.WriteLine(ideaID);
                Idea thisIdea = DBconnectivity.GetIdeaByID(ideaID);
                Session["User"] = thisUser;
                Session["Idea"] = thisIdea;
                Response.Redirect("SelectedIdea.aspx");
           }
            else {
                ViewState["SelectedKey"] = null;
            }
        }
    }
}