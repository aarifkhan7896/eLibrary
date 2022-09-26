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

        protected void addBtn_Click(object sender, EventArgs e)
        {
            if (checkIfBookExists())
            {
                Response.Write("<script>alert('Book Exists')</script>");
            }
            else
            {
                try
                {
                    SqlConnection sqlCon = new SqlConnection(dbconn);
                    if (sqlCon.State == ConnectionState.Closed)
                    {
                        sqlCon.Open();
                    }
                    SqlCommand cmd = new SqlCommand("INSERT into books(book_id,book_name,genre,author_name,publisher_name,publish_date,language,edition,description,total_stock,available_stock,cost) values(@id,@name,@genre,@authorname,@publishername,@publishdate,@language,@edition,@description,@totalstock,@availablestock,@cost)", sqlCon);
                    cmd.Parameters.AddWithValue("@id", bookId.Text.Trim());
                    cmd.Parameters.AddWithValue("@name", bookName.Text.Trim());
                    cmd.Parameters.AddWithValue("@genre", genre.Text.Trim());
                    cmd.Parameters.AddWithValue("@authorname", authorname.Text.Trim());
                    cmd.Parameters.AddWithValue("@publishername", publishername.Text.Trim());
                    cmd.Parameters.AddWithValue("@publishdate", date.Text.Trim());
                    cmd.Parameters.AddWithValue("@language", language.Text.Trim());
                    cmd.Parameters.AddWithValue("@edition", edition.Text.Trim());
                    cmd.Parameters.AddWithValue("@description", description.Text.Trim());
                    cmd.Parameters.AddWithValue("@totalstock", totalStock.Text.Trim());
                    cmd.Parameters.AddWithValue("@availablestock", availableStock.Text.Trim());
                    cmd.Parameters.AddWithValue("@cost", bookCost.Text.Trim());
                    cmd.ExecuteNonQuery();
                    sqlCon.Close();
                    Response.Write("<script>alert('Book added')</script>");
                }
                catch (Exception ex)
                {
                    Response.Write("<script>console.log('" + ex.Message + "')</script>");
                }
            }
        }

        bool checkIfBookExists()
        {
            try
            {
                SqlConnection sqlCon = new SqlConnection(dbconn);
                if (sqlCon.State == ConnectionState.Closed)
                {
                    sqlCon.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from books where book_id='" + bookId.Text.Trim() + "' or book_name='" + bookName.Text.Trim() + "'", sqlCon);
                SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
                DataTable dataTable = new DataTable();
                dataAdapter.Fill(dataTable);
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
    }
}