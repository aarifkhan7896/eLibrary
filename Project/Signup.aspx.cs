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
    public partial class Signup : System.Web.UI.Page
    {
        //Connection string to sql server
        string dbconn = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void signUpBtn_Click(object sender, EventArgs e)
        {
            if (checkUserExists())
            {
                Response.Write("<script>alert('User already exist.')</script>");
            }
            else
            {
                signUpMember();
            }
        }

        bool checkUserExists()
        {
            try
            {
                SqlConnection sqlCon = new SqlConnection(dbconn);
                if(sqlCon.State == ConnectionState.Closed)
                {
                    sqlCon.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from members where email = '"+email.Text.Trim()+"'", sqlCon);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);
                if(dataTable.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch(Exception ex)
            {
                Response.Write(ex.Message);
                return false;
            }
        }

        void signUpMember()
        {
            try
            {
                SqlConnection sqlCon = new SqlConnection(dbconn);
                if (sqlCon.State == ConnectionState.Closed)
                {
                    sqlCon.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO members(first_name,last_name,email,contact,address,pincode,password,status) values(@fname,@lname,@email,@contact,@address,@pin,@password,@status)", sqlCon);

                cmd.Parameters.AddWithValue("@fname", fname.Text.Trim());
                cmd.Parameters.AddWithValue("@lname", lname.Text.Trim());
                cmd.Parameters.AddWithValue("@email", email.Text.Trim());
                cmd.Parameters.AddWithValue("@contact", contact.Text.Trim());
                cmd.Parameters.AddWithValue("@address", address.Text.Trim());
                cmd.Parameters.AddWithValue("@pin", pincode.Text.Trim());
                cmd.Parameters.AddWithValue("@password", password.Text.Trim());
                cmd.Parameters.AddWithValue("@status", "Pending");
                cmd.ExecuteNonQuery();
                sqlCon.Close();
                Response.Write("<script>alert('Signup Successfull')</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>Console.log('"+ ex.Message + "')</script>");
            }
        }
    }
}