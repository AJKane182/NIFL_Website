using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;

namespace Football.Admin
{
    public partial class Booking : System.Web.UI.Page
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
        } 

        protected void Send_Email(object sender, EventArgs e)
        {
            string txtEmail = "info.nifl.pil@gmail.com";
            string txtEmail2 = "info.nifl.pil@gmail.com";

            using (MailMessage mm = new MailMessage(txtEmail, txtEmail2))
            {

                string txtEmail3 = "info.nifl.pil@gmail.com";
                string txtPassword = "password13125";
                string GQ = "NEW BOOKING: "+ ClubDD.Text + " on the " + BookingDate.SelectedDate.ToShortDateString() + "@" + timeDD.Text;
                string breakTag = "<br>";
                string emailPlaceHolder = "Email: ";
                string namePlaceHolder = "Name: ";
                string emailbody = "Booking Details: ";

                string EmailBuilder = emailPlaceHolder + txtEmailAddress.Text + breakTag + namePlaceHolder + txtName.Text + breakTag + emailbody + breakTag + ClubDD.Text + breakTag + facilityDD.Text + breakTag + txtOtherRequest.Text + breakTag + BookingDate.SelectedDate.ToShortDateString() + breakTag + timeDD.Text + breakTag + txtBody.Text + breakTag + txtContactNo.Text + breakTag;
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
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Email Sent. \n Booking Pending, you will recieve an email on aproval within 24 hours \n Many Thanks');", true);
            }
    }
        protected void Logout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/login.aspx");
        }

    }
    
}