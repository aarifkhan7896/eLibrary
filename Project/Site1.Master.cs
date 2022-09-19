using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
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
                Author.Visible=false;
                Publisher.Visible=false;
                User.Visible=false;
            }
            else if (Session["role"].Equals("user"))
            {
                WelcomeUser.Visible=true;
                WelcomeUser.Text = "Hi," + Session["name"].ToString();
                LogoutBtn.Visible=true;
                Author.Visible = false;
                Publisher.Visible = false;
                User.Visible = false;
            }
            else if (Session["role"].Equals("admin"))
            {
                WelcomeUser.Visible = true;
                WelcomeUser.Text = "Hi," + Session["name"].ToString();
                LogoutBtn.Visible = true;
                Author.Visible = true;
                Publisher.Visible = true;
                User.Visible = true;
            }
        }

        protected void LogoutBtn_Click(object sender, EventArgs e)
        {
            Session["role"] = "";
            Session["name"] = "";
            WelcomeUser.Visible = false;
            LogoutBtn.Visible = false;
            Author.Visible = false;
            Publisher.Visible = false;
            User.Visible = false;
            Session.Clear();
            Response.Redirect("~/Login.aspx");
        }

        protected void User_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/usermanagement.aspx");
        }

        protected void Author_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/authormanagement.aspx");
        }

        protected void Publisher_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/publishermanagement.aspx");
        }
    }
}