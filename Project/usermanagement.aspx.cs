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
    public partial class usermanagement : System.Web.UI.Page
    {
        string dbconn = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        protected void Search_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection sqlCon = new SqlConnection(dbconn);
                if (sqlCon.State == ConnectionState.Closed)
                {
                    sqlCon.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from members where user_id='" + searchBox.Text.Trim() + "'", sqlCon);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);
                if (dataTable.Rows.Count >= 1)
                {
                    fname.Text = dataTable.Rows[0][1].ToString();
                    lname.Text = dataTable.Rows[0][2].ToString();
                    email.Text = dataTable.Rows[0][3].ToString();
                    contact.Text = dataTable.Rows[0][4].ToString();
                    address.Text = dataTable.Rows[0][5].ToString();
                    pincode.Text = dataTable.Rows[0][6].ToString();
                    status.Text = dataTable.Rows[0][8].ToString();
                }
                else
                {
                    Response.Write("<script>alert('User does not exists')</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>console.log('" + ex.Message + "')</script>");
            }
        }

        protected void deleteBtn_Click(object sender, EventArgs e)
        {
            if (checkIfUserExists())
            {
                deleteUser();
            }
            else
            {
                Response.Write("<script>alert('User does not exists')</script>");
            }

        }

        bool checkIfUserExists()
        {
            try
            {
                SqlConnection sqlCon = new SqlConnection(dbconn);
                if (sqlCon.State == ConnectionState.Closed)
                {
                    sqlCon.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from members where user_id='" + searchBox.Text.Trim() + "'", sqlCon);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                if (dt.Rows.Count >= 1)
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

        void deleteUser()
        {
            try
            {
                SqlConnection sqlCon = new SqlConnection(dbconn);
                if (sqlCon.State == ConnectionState.Closed)
                {
                    sqlCon.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE from members where user_id='" + searchBox.Text.Trim() + "'", sqlCon);
                cmd.ExecuteNonQuery();
                sqlCon.Close();
                Response.Write("<script>alert('User Deleted')</script>");
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
            searchBox.Text = "";
            fname.Text = "";
            lname.Text = "";
            email.Text = "";
            address.Text = "";
            contact.Text = "";
            pincode.Text = "";
        }
    }
}