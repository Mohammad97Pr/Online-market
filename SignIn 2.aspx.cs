using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class SignIn : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("select * from companies where username='" + UserName.Text + "' and password='" + Password.Text + "'", con);
            cmd.Parameters.AddWithValue("@username", UserName.Text);
            cmd.Parameters.AddWithValue("@password", Password.Text);
            SqlDataReader r;
            con.Open();
            r = cmd.ExecuteReader();
            if (r.HasRows)
            {
                //string sql1 = "select prof_id,prof_fname,prof_lname from users where prof_username=@username and prof_password=@password";
                //SqlCommand cmd1 = new SqlCommand(sql1, con);

                Session["Sname"] = UserName.Text;



                Server.Transfer("~/AdminHomeAd.aspx");
            }
            else
            {
                lblError.Text = "Invalid Username or Password !";
            }
        }
    }

   
}