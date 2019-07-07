using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webEnterprise.Views
{
    public partial class ManageCategories : System.Web.UI.Page
    {
        private string conSTR;

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Category_Click(object sender, EventArgs e)
        {
            string newCategory = categoryTxt.Value;
            DBconnectivity.AddCategory(newCategory);
            Response.Redirect("ManageCategories.aspx");
        }

        protected void ExportButton_Click(object sender, EventArgs e)
        {
            //export to csvfunctionality
            Response.Clear();
            Response.AddHeader("content-disposition", "attachment; filename=Ideas.xls");
            Response.Charset = "";
            Response.ContentType = "application/vnd.xls";
            StringWriter stringWriter = new StringWriter();
            HtmlTextWriter htmlWriter = new HtmlTextWriter(stringWriter);
            GridView1.RenderControl(htmlWriter);
            GridView4.RenderControl(htmlWriter);
            GridView2.RenderControl(htmlWriter);
            GridView3.RenderControl(htmlWriter);
            GridView5.RenderControl(htmlWriter);
            Response.Write(stringWriter.ToString());

            Response.End();
        }

        public override void VerifyRenderingInServerForm(Control control)
        { }

     

  

    }
}