using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Football.Admin
{
    public partial class AdminHome : System.Web.UI.Page
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
                Int32 AdminRoleValue = 3;
                Int32 GuestRole = 6;
                Int32 TeamRepRole = 2;



                if (ConvertedUserID == GuestRole)
                {
                    guest1.Visible = true;
                    teamrep1.Visible = false;
                    teamrep2.Visible = false;
                    admin1.Visible = false;
                    admin2.Visible = false;
                }
                else if (ConvertedUserID == TeamRepRole)
                {
                    guest1.Visible = true;
                    teamrep1.Visible = true;
                    teamrep2.Visible = true;
                    admin1.Visible = false;
                    admin2.Visible = false;
                }
                else if (ConvertedUserID == AdminRoleValue)
                {
                    guest1.Visible = true;
                    teamrep1.Visible = true;
                    teamrep2.Visible = true;
                    admin1.Visible = true;
                    admin2.Visible = true;
                }

            }
        }

        protected void Fixtures_Click(object sender, EventArgs e)
        {
            Response.Redirect("Fixtures.aspx");
        }

        protected void Booking_Click(object sender, EventArgs e)
        {
            Response.Redirect("Booking.aspx");
        }

        protected void AddResults_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddResults.aspx");
        }

        protected void User_Click(object sender, EventArgs e)
        {
            Response.Redirect("Users.aspx");
        }

         protected void Logout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/login.aspx");
        }
        
    }
}