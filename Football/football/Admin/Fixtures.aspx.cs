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
    public partial class Fixtures : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            panAdd.Visible = false;
            panEdit.Visible = true;

            if (Session["TeamID"] == null)
            {
                Session["TeamID"] = "1";
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







        protected void chkSignUp_CheckedChanged(object sender, EventArgs e)
        {
            if (chkSignUp.Checked == true)
            {
                panAdd.Visible = true;
                panEdit.Visible = false;
            }
            else if (chkSignUp.Checked == false)
            {
                panAdd.Visible = false;
                panEdit.Visible = true;
            }

        }

        protected void ListTeams_SelectedIndexChanged(object sender, EventArgs e)
        {
            String GrabTeamID = ListTeams.SelectedItem.Value;
            String GrabTeamName = ListTeams.SelectedItem.Text;

            Session["TeamID"] = GrabTeamID;
            String LogoID = Session["TeamID"].ToString();
            Session["TeamName"] = GrabTeamName;




        }


        protected void CreateFixture_Click(object sender, EventArgs e)
        {
            String GrabGameWeek = SelectGameWeek.SelectedValue;
            String GrabHomeTeam = SelectHomeTeam.SelectedValue;
            String GrabAwayTeam = SelectAwayTeam.SelectedValue;
            String GrabDate = FixtureDate.Text.ToString(new CultureInfo("en-US"));
            String GrabHours = SelectHour.SelectedItem.Text;
            String GrabMinutes = SelectMinutes.SelectedItem.Text;
            String JoinTimeDate = GrabDate + " " + GrabHours + ":" + GrabMinutes + ":00";
            String ConvertDate = JoinTimeDate.ToString(new CultureInfo("en-gb"));


            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            conn.Open();
            String InsertFixture = "INSERT INTO Fixtures (GameWeek, HomeTeam, AwayTeam, Date) VALUES ('" + GrabGameWeek + "','" + GrabHomeTeam + "','" + GrabAwayTeam + "','" + ConvertDate + "')";
            SqlCommand runInsertFixture = new SqlCommand(InsertFixture, conn);
            runInsertFixture.ExecuteNonQuery();

            Response.Write("<script type='text/javascript'>");
            Response.Write("alert('Fixture Added');");
            Response.Write("document.location.href='Fixtures.aspx';");
            Response.Write("</script>");


        }

        protected void Logout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/login.aspx");
        }


    }
}