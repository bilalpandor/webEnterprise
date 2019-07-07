using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webEnterprise.Views
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            DateTime selectedDate = Calendar1.SelectedDate;
            bool success = DBconnectivity.setClosureDate(selectedDate);
            if (success)
            {
                Response.Redirect("Welcome.aspx");
            }
            else
            {
                //print an error
            }
            
        }

        protected void Calendar2_SelectionChanged(object sender, EventArgs e)
        {
            DateTime selectedDate = Calendar1.SelectedDate;
            bool success = DBconnectivity.setFinalClosereDate(selectedDate);
            if (success)
            {
                Response.Redirect("Welcome.aspx");
            }
            else
            {
                //print an error
            }
        }

        protected void QA_Click(object sender, EventArgs e)
        {
            Response.Redirect("SetQAs.aspx");
        }
    }

  
}