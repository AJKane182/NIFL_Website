using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;

namespace Football
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            panSignUp.Visible = false;
            panLogin.Visible = true;
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
             // grab username and password from textfields
            String grabUserName = UsernameEnter.Text;
            String grabPassword = PasswordEnter.Text;

            //opensql connection
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            conn.Open();
            // Select Statement to grab User ID where Username and Password 
            string selectUserIDString = "SELECT UserID FROM UserDetails WHERE Username = '" + grabUserName+ "' AND Password = '" + grabPassword + "'";
            // runs select query
            SqlCommand UserIDsql = new SqlCommand(selectUserIDString, conn);
            SqlDataReader UserIDOutput = UserIDsql.ExecuteReader();

            

            if (UserIDOutput.Read())
            {
                
                Session["username"] = grabUserName;
                Int32 GrabUser = UserIDOutput.GetInt32(0);
                Session["loggedInUser"] = GrabUser.ToString();

                SqlConnection conn2 = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
                conn2.Open();
                string selectUserRoleString = "SELECT UserRole FROM UserDetails WHERE UserID = '" + GrabUser + "'";
                SqlCommand UserRolesql = new SqlCommand(selectUserRoleString, conn2);
                SqlDataReader UserRoleOutput = UserRolesql.ExecuteReader();
                UserRoleOutput.Read();
                Int32 GrabUserRoleID = UserRoleOutput.GetInt32(0);
                Session["UserRoleSet"] = GrabUserRoleID;

                Response.Redirect("Admin/AdminHome.aspx");               

                

                
            }
            else
            {

                Response.Write("<script type='text/javascript'>");
                Response.Write("alert('Invalid Credentials');");
                Response.Write("document.location.href='Login.aspx';");
                Response.Write("</script>");
            }
        }

        protected void Send_Email(object sender, EventArgs e)
        {
            string txtEmail = "info.nifl.pil@gmail.com";
            string txtEmail2 = "info.nifl.pil@gmail.com";

            using (MailMessage mm = new MailMessage(txtEmail, txtEmail2))
            {

                string txtEmail3 = "info.nifl.pil@gmail.com";
                string txtPassword = "password13125";
                string GQ = "NEW USER REQUEST: ";
                string breakTag = "<br>";
                string emailPlaceHolder = "Email: ";
                string namePlaceHolder = "Name: ";
                string passwordPlaceHolder = "Password: ";
                string emailbody = "Booking Details: ";

                string EmailBuilder = emailPlaceHolder + txtEmailAddress.Text + breakTag + passwordPlaceHolder + txtPasswordReq.Text + breakTag + namePlaceHolder + txtName.Text + breakTag + emailbody + breakTag + ClubDD.Text + breakTag + roleDD.Text + breakTag + txtOtherRole.Text + breakTag + txtContactNo.Text + breakTag;
                mm.Subject = GQ;
                mm.Body = EmailBuilder;
                mm.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.EnableSsl = true;
                NetworkCredential NetworkCred = new NetworkCredential(txtEmail3, txtPassword);
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = NetworkCred;
                smtp.Port = 587;
                smtp.Send(mm);
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Email Sent.  Request Pending, you will recieve an email on aproval within 24 hours  Many Thanks');", true);
            }
        }

        protected void chkSignUp_CheckedChanged(object sender, EventArgs e)
        {
            if (chkSignUp.Checked == true)
            {
                panSignUp.Visible = true;
                panLogin.Visible = false;
            }
            else if (chkSignUp.Checked == false)
            {
                panSignUp.Visible = false;
                panLogin.Visible = true;
            }

        }
    }
}