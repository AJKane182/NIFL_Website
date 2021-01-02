using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.Security;
using System.Globalization;

namespace Football.Admin
{
    public partial class Users : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            panAdd.Visible = false;
            panEdit.Visible = true;

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

                if (ConvertedUserID != AdminRoleValue)
                {
                    Response.Write("<script type='text/javascript'>");
                    Response.Write("alert('Invalid Credentials, Admin only');");
                    Response.Write("document.location.href='AdminHome.aspx';");
                    Response.Write("</script>");

                }
            }
        }



        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection connect1 = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            connect1.Open();
            Session["GrabUserID001"] = GridView1.SelectedRow.Cells[2].Text;
            String UseUserID = Session["GrabUserID001"].ToString();
            string deleteUser = "DELETE FROM UserDetails WHERE UserID = '" + UseUserID + "'";


            SqlCommand myCommand = new SqlCommand(deleteUser, connect1);
            myCommand.ExecuteNonQuery();




            // close connection
            connect1.Close();

            Response.Write("<script type='text/javascript'>");
            Response.Write("alert('User Deleted');");
            Response.Write("document.location.href='Users.aspx';");
            Response.Write("</script>");
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






        protected void CreateUser_Click(object sender, EventArgs e)
        {
            String GrabFullName = SetFullName.Text;
            String GrabUsername = SetUsername.Text;
            String GrabPassword = SetPassword.Text;
            String GrabEmail = SetEmail.Text;
            string GrabNumber = SetNumber.Text.ToString();
            String GrabRole = SetRole.SelectedValue;
            String GrabTeam = SetTeam.SelectedValue;

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            conn.Open();
            String InsertFixture = "INSERT INTO UserDetails (Username, Password, FullName, UserRole, TeamName, ContactNo, emailAdd) VALUES ('" + GrabUsername + "','" + GrabPassword + "','" + GrabFullName + "','" + GrabRole + "','" + GrabTeam + "','" + GrabNumber + "','" + GrabEmail + "')";
            SqlCommand runInsertFixture = new SqlCommand(InsertFixture, conn);
            runInsertFixture.ExecuteNonQuery();

            Response.Write("<script type='text/javascript'>");
            Response.Write("alert('User Added');");
            Response.Write("document.location.href='Users.aspx';");
            Response.Write("</script>");

        }





        protected void Logout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/login.aspx");
        }
    }
}