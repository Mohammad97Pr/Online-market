using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddGender : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindBrandsRptr();

    }
    private void BindBrandsRptr()
    {
        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("select * from tblGender", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtBrands = new DataTable();
                    sda.Fill(dtBrands);
                    grid_files.DataSource = dtBrands;
                    grid_files.DataBind();
                }

            }
        }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (txtGenderName.Text.Length > 0)
        {
            String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
            SqlConnection con = new SqlConnection(CS);

            SqlCommand cmd = new SqlCommand("insert into tblGender values('" + txtGenderName.Text + "')", con);
            con.Open();
            cmd.ExecuteNonQuery();
            txtGenderName.Text = string.Empty;

            BindBrandsRptr();
        }
    }

    protected void grid_files_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "del")
        {


            String cs = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
            int j = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = grid_files.Rows[j];
            SqlConnection con = new SqlConnection(cs);
            Label file1 = (Label)row.FindControl("lbl1");
            var c = Convert.ToInt32(BoundField.ThisExpression.Equals("f"));
            SqlCommand cmd = new SqlCommand("delete from tblGender where GenderID='" + file1.Text + "'", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            BindBrandsRptr();
        }

    }
}