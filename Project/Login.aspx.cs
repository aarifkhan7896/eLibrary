using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class Login : System.Web.UI.Page
    {
        string dbconn = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginBtn_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection sqlCon = new SqlConnection(dbconn);
                if(sqlCon.State == ConnectionState.Closed)
                {
                    sqlCon.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from members where email = '"+email.Text.Trim()+"' and password = '"+password.Text.Trim()+"'", sqlCon);
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        Response.Write("<script>alert('"+reader.GetValue(3)+"')</script>");
                        Session["email"] = reader.GetValue(3).ToString();
                        Session["name"] = reader.GetValue(1).ToString();
                        Session["role"] = "user";
                    }
                    Response.Redirect("~/UserProfile.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Invalid Credentials')</script>");
                }
            }
            catch(Exception ex)
            {
                Response.Write("<script>Console.log('"+ ex.Message + "')</script>");
            }
        }
    }
}