using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class authormanagement : System.Web.UI.Page
    {
        string dbconn = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void search_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection sqlCon = new SqlConnection(dbconn);
                if (sqlCon.State == ConnectionState.Closed)
                {
                    sqlCon.Open();
                }
                SqlCommand cmd = new SqlCommand("", sqlCon);
            }
            catch (Exception ex)
            {
                Response.Write("<script>console.log('" + ex.Message + "')</script>");
            }
        }

        protected void insert_Click(object sender, EventArgs e)
        {
            if (checkIfAuthorExists())
            {
                Response.Write("<script>alert('Author already exists')</script>");
            }
            else
            {
                addnewAuthor();
            }
        }

        protected void update_Click(object sender, EventArgs e)
        {

        }

        protected void delete_Click(object sender, EventArgs e)
        {

        }

        bool checkIfAuthorExists()
        {
            try
            {
                SqlConnection sqlCon = new SqlConnection(dbconn);
                if (sqlCon.State == ConnectionState.Closed)
                {
                    sqlCon.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from author where author_name = '" + authorname.Text.Trim() + "'", sqlCon);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);
                if (dataTable.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>console.log('" + ex.Message + "')</script>");
                return false;
            }
        }
        void addnewAuthor()
        {
            try
            {
                SqlConnection sqlCon = new SqlConnection(dbconn);
                if (sqlCon.State == ConnectionState.Closed)
                {
                    sqlCon.Open();
                }
                if (authorname.Text == null || authorname.Text == "")
                {
                    Response.Write("<script>alert('Author Name is Required')</script>");
                }
                else
                {
                    SqlCommand cmd = new SqlCommand("INSERT INTO author(author_name) values(@author_name)", sqlCon);
                    cmd.Parameters.AddWithValue("@author_name", authorname.Text.Trim());
                    cmd.ExecuteNonQuery();
                    sqlCon.Close();
                    Response.Write("<script>alert('Author Added')</script>");
                    authorname.Text = "";
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>console.log('" + ex.Message + "')</script>");
            }
        }
    }
}