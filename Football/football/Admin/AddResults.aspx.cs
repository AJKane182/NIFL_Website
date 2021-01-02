using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Globalization;

namespace Football.Admin
{
    public partial class AddResults : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserRoleSet"] == null)
            {
                Response.Write("<script type='text/javascript'>");
                Response.Write("alert('Please Login');");
                Response.Write("document.location.href='../Login.aspx';");
                Response.Write("</script>");
            }

            else
            {
                String GrabUserRoleID = Session["UserRoleSet"].ToString();
                Int32 ConvertedUserID = Convert.ToInt32(GrabUserRoleID);
                Int32 GuestValue = 2;


                if (ConvertedUserID == GuestValue)
                {
                    Response.Write("<script type='text/javascript'>");
                    Response.Write("alert('Invalid Credentials, Admin & Team Rep only');");
                    Response.Write("document.location.href='AdminHome.aspx';");
                    Response.Write("</script>");

                }
            }
        }


        protected void ShowFixtures_SelectedIndexChanged(object sender, EventArgs e)
        {

            Session["FixtureID"] = ShowFixtures.SelectedRow.Cells[1].Text;
            Session["HomeTeamID"] = ShowFixtures.SelectedRow.Cells[7].Text;
            Session["AwayTeamID"] = ShowFixtures.SelectedRow.Cells[6].Text;
            Response.Redirect("AddResultsPt2.aspx");
        }

        protected void Logout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/login.aspx");
        }
    }
}