using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddSize : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindBrand();
            BindMainCategory();
            BindBrandsRptr();
            bindGender();
        }
    }
    private void BindBrandsRptr()
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
            SqlCommand cmd2 = new SqlCommand("select*,(select Name from tblBrands where BrandID=tblSizes.BrandID) as Name ,(select CatName from tblCategories where CatID=tblSizes.CategoryID) as CatName,(select SubCatName from tblSubCategories where SubCatID=tblSizes.SubCategoryID) as SubCatName ,(select GenderName from tblGender where GenderID=tblSizes.GenderID) as GenderName  from tblSizes where BrandID='"+idbra+"' ", con);
            //using (SqlCommand cmd = new SqlCommand("select A.*,B.*,C.*,D.*,E.* from tblSizes A inner join tblCategories B on B.CatID=A.CategoryID inner join tblBrands C on C.BrandID=A.BrandID inner join tblSubCategories D on D.SubCatID=A.SubCategoryID inner join tblGender E on E.GenderID=A.GenderID", con))

            SqlDataAdapter sda1 = new SqlDataAdapter(cmd2);


            reader.Close();
            DataTable dtBrands = new DataTable();
            sda1.Fill(dtBrands);
            grid_files.DataSource = dtBrands;
            grid_files.DataBind();








        }


        else {


            String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {


                SqlCommand cmd = new SqlCommand("select*,(select Name from tblBrands where BrandID=tblSizes.BrandID) as Name ,(select CatName from tblCategories where CatID=tblSizes.CategoryID) as CatName,(select SubCatName from tblSubCategories where SubCatID=tblSizes.SubCategoryID) as SubCatName ,(select GenderName from tblGender where GenderID=tblSizes.GenderID) as GenderName  from tblSizes ", con);
                //using (SqlCommand cmd = new SqlCommand("select A.*,B.*,C.*,D.*,E.* from tblSizes A inner join tblCategories B on B.CatID=A.CategoryID inner join tblBrands C on C.BrandID=A.BrandID inner join tblSubCategories D on D.SubCatID=A.SubCategoryID inner join tblGender E on E.GenderID=A.GenderID", con))

                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtBrands = new DataTable();
                    sda.Fill(dtBrands);
                    grid_files.DataSource = dtBrands;
                    grid_files.DataBind();
                }


            }
        }   }
    private void bindGender()
    {
        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("select * from tblgender", con);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count != 0)
            {
                ddlGender.DataSource = dt;
                ddlGender.DataTextField = "Gendername";
                ddlGender.DataValueField = "genderid";
                ddlGender.DataBind();
                ddlGender.Items.Insert(0, new ListItem("-Select-", "0"));
            }
        }
    }

    private void BindBrand()
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
            SqlCommand cmd2 = new SqlCommand("select * from tblBrands where BrandID='" + idbra + "'", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd2);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count != 0)
            {
                ddlBrand.DataSource = dt;
                ddlBrand.DataTextField = "Name";
                ddlBrand.DataValueField = "BrandID";
                ddlBrand.DataBind();
                ddlBrand.Items.Insert(0, new ListItem("-Select-", "0"));
            }


        }

        else {

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
                    ddlBrand.DataSource = dt;
                    ddlBrand.DataTextField = "Name";
                    ddlBrand.DataValueField = "BrandID";
                    ddlBrand.DataBind();
                    ddlBrand.Items.Insert(0, new ListItem("-Select-", "0"));
                }
            }     }
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

                SqlParameter sp = new SqlParameter("@BrandID", x);
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
                }      }
        }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("insert into tblSizes values('" + txtSizeName.Text + "','" + ddlBrand.SelectedItem.Value + "','" + ddlCategory.SelectedItem.Value + "','" + ddlSubCat.SelectedItem.Value + "','" + ddlGender.SelectedItem.Value + "')", con);
            con.Open();
            cmd.ExecuteNonQuery();
            txtSizeName.Text = string.Empty;
            ddlBrand.ClearSelection();
            ddlBrand.Items.FindByValue("0").Selected = true;
            ddlCategory.ClearSelection();
            ddlCategory.Items.FindByValue("0").Selected = true;
            ddlSubCat.ClearSelection();
            ddlSubCat.Items.FindByValue("0").Selected = true;
            ddlGender.ClearSelection();
            ddlGender.Items.FindByValue("0").Selected = true;
        }
        BindBrandsRptr();

    }

    protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
    {



        int MainCategoryID = Convert.ToInt32(ddlCategory.SelectedItem.Value);

        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("select * from tblSubCategories where MainCatID='" + ddlCategory.SelectedItem.Value + "'", con);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count != 0)
            {
                ddlSubCat.DataSource = dt;
                ddlSubCat.DataTextField = "SubCatName";
                ddlSubCat.DataValueField = "SubCatID";
                ddlSubCat.DataBind();
                ddlSubCat.Items.Insert(0, new ListItem("-Select-", "0"));
            }
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
            SqlCommand cmd = new SqlCommand("delete from tblSizes where SizeID='" + file1.Text + "'", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            BindBrandsRptr();
        }


    }
}