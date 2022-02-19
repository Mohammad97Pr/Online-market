using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddSubCategory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindMainCategory();
            BindBrandsRptr();
        }
    }

    private void BindBrandsRptr()
    {
        if (Session["Sname"] != null)
        {
            String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("select * from tblSubCategories where MainCatID='" + ddlCategory.SelectedValue + "'", con))
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
        else {

            String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("select A.*,B.* from tblSubCategories A inner join tblCategories B on B.CatID=A.MainCatID", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dtBrands = new DataTable();
                        sda.Fill(dtBrands);
                        grid_files.DataSource = dtBrands;
                        grid_files.DataBind();
                    }

                }
            }   }
    }
    private DataSet GetData(string getname, SqlParameter para)
    {//هنا قمنا بعغمل بعض العلاقات و التوابع ىمن أجل استدعاء او عمل اتصال بين البرانامج(دروب ليست) ......
        //الخ

        String cs = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);
        SqlDataAdapter da = new SqlDataAdapter(getname, con);
        da.SelectCommand.CommandType = CommandType.StoredProcedure;
        if (para != null)
        {
            da.SelectCommand.Parameters.Add(para);
        }
        DataSet ds = new DataSet();
        da.Fill(ds);
        return ds;


    }

    private void BindMainCategory()
    {

        if (Session["Sname"] != null)
        {
            String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;

            SqlConnection con = new SqlConnection(CS);
            con.Open();
            SqlCommand cmd = new SqlCommand("select brandid from companies where username='" + Session["Sname"] + "'", con);
            SqlDataReader reader = cmd.ExecuteReader();

            reader.Read();
            string idbra = reader["brandid"].ToString();
            int x = Convert.ToInt32(idbra);
            //ddlBrands.SelectedItem.Value = x;
            //ddlBrands.SelectedIndex 
            reader.Close();
            SqlCommand cmd2 = new SqlCommand("select * from tblCategories where BrandID='" + idbra + "'", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd2);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count != 0)
            {
                ddlCategory.DataTextField = "CatName";
                ddlCategory.DataValueField = "CatID";

                SqlParameter sp = new SqlParameter("@BrandID",x);
                ddlCategory.DataSource = GetData("catbybrands", sp);
                ddlCategory.DataBind();
                ddlCategory.Items.Insert(0, new ListItem("-Select-", "0"));
            }
              }

             else {


            String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("select * from tblCategories", con);
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                if (dt.Rows.Count != 0)
                {
                    ddlCategory.DataSource = dt;
                    ddlCategory.DataTextField = "CatName";
                    ddlCategory.DataValueField = "CatID";
                    ddlCategory.DataBind();
                    ddlCategory.Items.Insert(0, new ListItem("-Select-", "0"));
                }
            }
        }
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (txtSubCatName.Text.Length > 0)
        {
            String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
            SqlConnection con = new SqlConnection(CS);

            SqlCommand cmd = new SqlCommand("insert into tblSubCategories values('" + txtSubCatName.Text + "','" + ddlCategory.SelectedItem.Value + "')", con);
            con.Open();
            cmd.ExecuteNonQuery();
            txtSubCatName.Text = string.Empty;
            ddlCategory.ClearSelection();
            ddlCategory.Items.FindByValue("0").Selected = true;

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
            SqlCommand cmd = new SqlCommand("delete from tblSubCategories where SubCatID='" + file1.Text + "'", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            BindBrandsRptr();
        }
    }

    protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindBrandsRptr();
    }
}