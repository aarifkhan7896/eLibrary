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
    public partial class booksmanagement : System.Web.UI.Page
    {
        string dbconn = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            loadAuthorName();
            loadPublisherName();
            GridView1.DataBind();
        }

        void loadPublisherName()
        {
            try
            {
                SqlConnection sqlCon = new SqlConnection(dbconn);
                if (sqlCon.State == ConnectionState.Closed)
                {
                    sqlCon.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT publisher_name from publisher", sqlCon);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                publishername.DataSource = dt;
                publishername.DataValueField = "publisher_name";
                publishername.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>console.log('" + ex.Message + "')</script>");
            }
        }

        void loadAuthorName()
        {
            try
            {
                SqlConnection sqlCon = new SqlConnection(dbconn);
                if (sqlCon.State == ConnectionState.Closed)
                {
                    sqlCon.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT author_name from author", sqlCon);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                authorname.DataSource = dt;
                authorname.DataValueField = "author_name";
                authorname.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>console.log('" + ex.Message + "')</script>");
            }

        }
    }
}