using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Football.Admin
{
    public partial class Team_Profile : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {

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

            Session["TeamID"] = Request.QueryString["ID"];
            String TeamName = Request.QueryString["Team"];

            if (Session["TeamID"] == null)
            {
                Session["TeamID"] = "1";
            }

            if (TeamName == null)
            {
                TeamName = "Annagh United";
            }

            if (!IsPostBack)
            {
                ListTeams.SelectedValue = Session["TeamID"].ToString();
                ShowTeamName.Text = TeamName;
                String LogoID = Session["TeamID"].ToString();
                TeamLogo.ImageUrl = "~/Images/Badges/" + LogoID + ".jpg";
            }
        }

        protected void ListTeams_SelectedIndexChanged(object sender, EventArgs e)
        {
            String GrabTeamID = ListTeams.SelectedItem.Value;
            String GrabTeamName = ListTeams.SelectedItem.Text;

            Session["TeamID"] = GrabTeamID;
            String LogoID = Session["TeamID"].ToString();
            Session["TeamName"] = GrabTeamName;
            ShowTeamName.Text = GrabTeamName;
            TeamLogo.ImageUrl = "~/Images/Badges/" + LogoID + ".jpg";



        }

        protected void Logout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/login.aspx");
        }


    }
}