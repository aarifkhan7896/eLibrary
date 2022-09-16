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
            GridView.DataBind();
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
                SqlCommand cmd = new SqlCommand("select * from author where author_id = '"+author.Text.Trim()+"';", sqlCon);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                if(dt.Rows.Count >= 1)
                {
                    authorname.Text = dt.Rows[0][1].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Author does not exists')</script>");
                }
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
            if (checkIfAuthorExists())
            {
                updateAuthor();
            }
            else
            {
                Response.Write("<script>alert('Author Does Not Exists')</script>");
            }
        }

        protected void delete_Click(object sender, EventArgs e)
        {
            if (checkIfAuthorExists())
            {
                deleteAuthor();
            }
            else
            {
                Response.Write("<script>alert('Author Does Not Exists')</script>");
            }
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
                SqlCommand cmd = new SqlCommand("SELECT * from author where author_id='"+author.Text.Trim()+"'", sqlCon);
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
                if (authorname.Text == null || authorname.Text == "" || author.Text == null || author.Text == "")
                {
                    Response.Write("<script>alert('Author Details are Required')</script>");
                }
                else
                {
                    SqlCommand cmd = new SqlCommand("INSERT INTO author(author_id,author_name) values(@author_id,@author_name)", sqlCon);
                    cmd.Parameters.AddWithValue("@author_id", author.Text.Trim());
                    cmd.Parameters.AddWithValue("@author_name", authorname.Text.Trim());
                    cmd.ExecuteNonQuery();
                    sqlCon.Close();
                    Response.Write("<script>alert('Author Added')</script>");
                    clearFields();
                    GridView.DataBind();
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>console.log('" + ex.Message + "')</script>");
            }
        }

        void updateAuthor()
        {
            try
            {
                SqlConnection sqlCon = new SqlConnection(dbconn);
                if(sqlCon.State == ConnectionState.Closed)
                {
                    sqlCon.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE author set author_name=@author_name where author_id='"+author.Text.Trim()+"'; ", sqlCon);
                cmd.Parameters.AddWithValue("@author_name", authorname.Text.Trim());
                cmd.ExecuteNonQuery();
                sqlCon.Close();
                Response.Write("<script>alert('Author Updated')</script>");
                clearFields();
                GridView.DataBind();
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        void deleteAuthor()
        {
            try
            {
               SqlConnection sqlCon = new SqlConnection(dbconn);
                if(sqlCon.State == ConnectionState.Closed)
                {
                    sqlCon.Open();
                }
                SqlCommand cmd = new SqlCommand(" DELETE from author where author_id = '"+author.Text.Trim()+"';", sqlCon);
                cmd.ExecuteNonQuery();
                sqlCon.Close();
                Response.Write("<script>alert('Author Deleted')</script>");
                clearFields();
                GridView.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        void clearFields()
        {
            author.Text = "";
            authorname.Text = "";
        }
    }
}