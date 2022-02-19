using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ManageProducts : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            fill();
            //fillIM();
        }
    }
    protected string GetActiveClass(int ItemIndex)
    {
        if (ItemIndex == 0)
        {
            return "active";
        }
        else
        {
            return "";
        }
    }

    public void fill()
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
            string cmd2 = "select *,(select Name from tblBrands where BrandID=tblProducts.PBrandID) as Name, (select CatName from tblCategories where CatID=tblProducts.PCategoryID) as CatName, (select SubCatName from tblSubCategories where SubCatID=tblProducts.PSubCatID) as SubCatName, (select GenderName from tblGender where GenderID=tblProducts.PGender) as GenderName  from tblProducts where PBrandID='"+idbra+"'  ";
            //using (SqlCommand cmd = new SqlCommand("select A.*,B.*,C.*,D.*,E.* from tblSizes A inner join tblCategories B on B.CatID=A.CategoryID inner join tblBrands C on C.BrandID=A.BrandID inner join tblSubCategories D on D.SubCatID=A.SubCategoryID inner join tblGender E on E.GenderID=A.GenderID", con))
            SqlDataAdapter da = new SqlDataAdapter(cmd2, con);


            reader.Close();
            DataTable dtBrands = new DataTable();
            da.Fill(dtBrands);
            grid_Products.DataSource = dtBrands;
            grid_Products.DataBind();








        }


        else {
            String cs = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            string sql = "select *,(select Name from tblBrands where BrandID=tblProducts.PBrandID) as Name, (select CatName from tblCategories where CatID=tblProducts.PCategoryID) as CatName, (select SubCatName from tblSubCategories where SubCatID=tblProducts.PSubCatID) as SubCatName, (select GenderName from tblGender where GenderID=tblProducts.PGender) as GenderName  from tblProducts ";
            SqlDataAdapter da = new SqlDataAdapter(sql, con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            grid_Products.DataSource = dt;
            grid_Products.DataBind();
        }
    }


    protected void grid_Products_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        if (e.CommandName == "del")
        {


            String cs = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
            int j = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = grid_Products.Rows[j];
            SqlConnection con = new SqlConnection(cs);
            Label file1 = (Label)row.FindControl("lbl01");
            var c = Convert.ToInt32(BoundField.ThisExpression.Equals("f"));
            SqlCommand cmd = new SqlCommand("delete from tblProducts where PID='" + file1.Text + "'", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            fill();
        }
        if (e.CommandName == "view")
        {


            String cs = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
            int j = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = grid_Products.Rows[j];
            SqlConnection con = new SqlConnection(cs);
            Label file1 = (Label)row.FindControl("lbl01");
            Session["kipid"] = file1.Text;
            Server.Transfer("~/photoviewradminpro.aspx");

        }


    }
}