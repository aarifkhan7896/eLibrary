using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"] == null)
            {
                WelcomeUser.Visible=false;
                LogoutBtn.Visible=false;
            }
            else if (Session["role"].Equals("user"))
            {
                WelcomeUser.Visible=true;
                WelcomeUser.Text = "Hi," + Session["name"].ToString();
                LogoutBtn.Visible=true;
            }
            else if (Session["role"].Equals("admin"))
            {
                WelcomeUser.Visible = true;
                WelcomeUser.Text = "Hi," + Session["name"].ToString();
                LogoutBtn.Visible = true;
            }
        }

        protected void LogoutBtn_Click(object sender, EventArgs e)
        {
            Session["role"] = "";
            Session["name"] = "";
            Session.Clear();
            Response.Redirect("~/Login.aspx");
        }
    }
}