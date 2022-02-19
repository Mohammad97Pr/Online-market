using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class company : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            BindMAinBrands();
        }
    }


    private void BindMAinBrands()
    {
        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("select * from tblBrands", con);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count != 0)
            {
                ddlbrand.DataSource = dt;
       
                ddlbrand.DataBind();
                ddlbrand.Items.Insert(0, new ListItem("-Select-", "0"));
            }
        }
    }

    protected void btnaddacc_Click(object sender, EventArgs e)
    {
        String cs = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);
        string sql = "insert into companies(username,password,company,email,phone,brandid,type) values(@col,@fname,@lname,@username,@password,@bra,@type)";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("@col", txtuser.Text);

        cmd.Parameters.AddWithValue("@fname", pass.Text);
        cmd.Parameters.AddWithValue("@lname", txtcompany.Text);
        cmd.Parameters.AddWithValue("@username", email.Text);
        cmd.Parameters.AddWithValue("@password", phone.Text);
        cmd.Parameters.AddWithValue("@bra", ddlbrand.SelectedItem.Value);
        cmd.Parameters.AddWithValue("@type", DropDownList1.SelectedItem.Value);


        con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Write("<script>alert('Account added successfully.');</script>");
    
    
    }
}