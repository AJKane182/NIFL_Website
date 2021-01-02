using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Football
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
    }
}