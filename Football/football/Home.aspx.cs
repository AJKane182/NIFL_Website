using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Football
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["TeamID"] = "0";


            if(IsPostBack==false)
            {
                panEdit.Visible = true;
                panAdd.Visible = false;
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

        protected void Submit_Click(object sender, EventArgs e)
        {
            int score = 0;
            if (q1.SelectedItem.Value == "1")
            {
                score = score + 1;
                q1.Attributes["class"] = "correct";
            }
            else
            {
                q1.Attributes["class"] = "wrong";
            }

            if (q2.SelectedItem.Value == "2")
            {
                score = score + 1;
                q2.Attributes["class"] = "correct";
            }
            else
            {
                q2.Attributes["class"] = "wrong";
            }

            if (q3.SelectedItem.Value == "3")
            {
                score = score + 1;
                q3.Attributes["class"] = "correct";
            }
            else
            {
                q3.Attributes["class"] = "wrong";
            }

            if (q4.SelectedItem.Value == "1")
            {
                score = score + 1;
                q4.Attributes["class"] = "correct";
            }
            else
            {
                q4.Attributes["class"] = "wrong";
            }

            if (q5.SelectedItem.Value == "3")
            {
                score = score + 1;
                q5.Attributes["class"] = "correct";
            }
            else
            {
                q5.Attributes["class"] = "wrong";
            }

            string rate;

            if (score < 2)
            { rate = "Needs to Improve"; }
            else if (score < 3)
            { rate = "Getting there"; }
            else { rate = "Well Done"; }

            results.Text = "Your score is : " + score.ToString() + " / 5   " +rate.ToString();


        }
    }
}