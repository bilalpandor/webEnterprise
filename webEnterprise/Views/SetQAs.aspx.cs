using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using webEnterprise.Models;

namespace webEnterprise.Views
{
    public partial class SetQAs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<User> QAs = DBconnectivity.getQACoors();

                foreach (User u in QAs)
                {
                    int dept = u.Department.Id;

                    if (dept == 3)
                    {
                        FACHDropDown.SelectedValue = u.Email;
                    }
                    else if (dept == 4)
                    {
                        BSDropDown.SelectedValue = u.Email;
                    }
                    else if (dept == 5)
                    {
                        FEHDropDown.SelectedValue = u.Email;
                    }
                    else if (dept == 6)
                    {
                        FEHDropDown.SelectedValue = u.Email;
                    }
                }
            }
        }


        protected void FACH_Click(object sender, EventArgs e)
        {
            string clicked = FACHDropDown.SelectedValue;
            User thisUser = DBconnectivity.getUserByEmail(clicked);
            Boolean success = DBconnectivity.SetQACoor(thisUser.IdNumber, 3);

            if (success == false)
            {
                //errorlbl.Text = "error";
            }
            else
            {
                //errorlbl.Text = "succuss";
            }
        }

        protected void FEH_Click(object sender, EventArgs e)
        {
            string clicked = FACHDropDown.SelectedValue;
            User thisUser = DBconnectivity.getUserByEmail(clicked);
            Boolean success = DBconnectivity.SetQACoor(thisUser.IdNumber, 5);

            if (success == false)
            {
                //errorlbl.Text = "error";
            }
            else
            {
                //errorlbl.Text = "succuss";
            }
        }

        protected void FES_Click(object sender, EventArgs e)
        {
            string clicked = FACHDropDown.SelectedValue;
            User thisUser = DBconnectivity.getUserByEmail(clicked);
            Boolean success = DBconnectivity.SetQACoor(thisUser.IdNumber, 6);

            if (success == false)
            {
                //errorlbl.Text = "error";
            }
            else
            {
                //errorlbl.Text = "succuss";
            }
        }

        protected void BS_Click(object sender, EventArgs e)
        {
            string clicked = FACHDropDown.SelectedValue;
            User thisUser = DBconnectivity.getUserByEmail(clicked);
            Boolean success = DBconnectivity.SetQACoor(thisUser.IdNumber, 4);

            if (success == false)
            {
                //errorlbl.Text = "error";
            }
            else
            {
                //errorlbl.Text = "succuss";
            }
        }
    }
}