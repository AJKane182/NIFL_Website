using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace Football.Admin
{
    public partial class AddResultsPt2 : System.Web.UI.Page
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

        protected void CreateResult_Click(object sender, EventArgs e)
        {

            String GrabHomeScore = SelectHome.SelectedValue;
            String GrabAwayScore = SelectAway.SelectedValue;

            String GrabFixtureID = Session["FixtureID"].ToString();


            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("Update Fixtures set HomeScore = '" + GrabHomeScore + "', AwayScore = '" + GrabAwayScore + "' WHERE FixtureID='" + GrabFixtureID + "'", conn);
            cmd.ExecuteNonQuery();
            conn.Close();

            Response.Write("<script type='text/javascript'>");
            Response.Write("alert('Result Added');");
            Response.Write("document.location.href='AddResults.aspx';");
            Response.Write("</script>");
        }

        protected void Logout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/login.aspx");
        }


    }
}