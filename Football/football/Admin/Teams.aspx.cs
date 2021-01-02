using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Football.Admin
{
    public partial class Teams : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                panTable.Visible = false;
                btnHideTable.Visible = false;
            }

            if (Session["UserRoleSet"] == null)
            {
                Response.Write("<script type='text/javascript'>");
                Response.Write("alert('Please log in');");
                Response.Write("document.location.href='../Login.aspx';");
                Response.Write("</script>");
            }

            else
            {
                String GrabUserRoleID = Session["UserRoleSet"].ToString();
                Int32 ConvertedUserID = Convert.ToInt32(GrabUserRoleID);
            }

        }


        protected void showTable_Click(object sender, EventArgs e)
        {

            if (panTable.Visible == false)
            {
                panTable.Visible = true;
                btnShowTable.Visible = false;
                btnHideTable.Visible = true;
            }

        }

        protected void hideTable_Click(object sender, EventArgs e)
        {
            if (panTable.Visible == true)
            {
                panTable.Visible = false;
                btnHideTable.Visible = false;
                btnShowTable.Visible = true;
            }
        }


        protected void Logout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/login.aspx");
        }


    }
}