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
    public partial class publishermanagement : System.Web.UI.Page
    {
        string dbconn = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        protected void insert_Click(object sender, EventArgs e)
        {
            if (checkIfPublisherExists())
            {
                Response.Write("<script>alert('Publisher already exists')</script>");
            }
            else
            {
                addNewPublisher();
            }
        }

        bool checkIfPublisherExists()
        {
            try
            {
                SqlConnection sqlCon = new SqlConnection(dbconn);
                if (sqlCon.State == ConnectionState.Closed)
                {
                    sqlCon.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from publisher where publisher_id = '" + publisher.Text.Trim() + "'", sqlCon);
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

        void addNewPublisher()
        {
            try
            {
                SqlConnection sqlCon = new SqlConnection(dbconn);
                if (sqlCon.State == ConnectionState.Closed)
                {
                    sqlCon.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT into publisher(publisher_id,publisher_name) values(@id,@name)", sqlCon);
                cmd.Parameters.AddWithValue("@id", publisher.Text.Trim());
                cmd.Parameters.AddWithValue("@name", publishername.Text.Trim());
                cmd.ExecuteNonQuery();
                sqlCon.Close();
                Response.Write("<script>alert('Publisher Added')</script>");
                clearFields();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>console.log('" + ex.Message + "')</script>");
            }
        }

        protected void update_Click(object sender, EventArgs e)
        {
            if (checkIfPublisherExists())
            {
                updatePublisher();
            }
            else
            {
                Response.Write("<script>alert('Publisher does not exists')</script>");
            }
        }

        void updatePublisher()
        {
            try
            {
                SqlConnection sqlCon = new SqlConnection(dbconn);
                if (sqlCon.State == ConnectionState.Closed)
                {
                    sqlCon.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE publisher set publisher_name = @name where publisher_id='" + publisher.Text.Trim() + "'", sqlCon);
                cmd.Parameters.AddWithValue("@name", publishername.Text.Trim());
                cmd.ExecuteNonQuery();
                sqlCon.Close();
                Response.Write("<script>alert('Publisher Updated')</script>");
                clearFields();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>console.log('" + ex.Message + "')</script>");
            }
        }

        void clearFields()
        {
            publisher.Text = "";
            publishername.Text = "";
        }

        protected void delete_Click(object sender, EventArgs e)
        {
            if (checkIfPublisherExists())
            {
                deletePublisher();
            }
            else
            {
                Response.Write("<script>alert('Publisher does not exists')</script>");
            }
        }

        void deletePublisher()
        {
            try
            {
                SqlConnection sqlCon = new SqlConnection(dbconn);
                if (sqlCon.State == ConnectionState.Closed)
                {
                    sqlCon.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE from publisher where publisher_id='" + publisher.Text.Trim() + "'", sqlCon);
                cmd.ExecuteNonQuery();
                sqlCon.Close();
                Response.Write("<script>alert('Publisher Deleted')</script>");
                clearFields();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>console.log('" + ex.Message + "')</script>");
            }
        }
    }
}