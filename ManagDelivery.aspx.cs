using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ManagDelivery : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            fill();
        }
    }
    public void fill()
    {
        //if (Session["Sname"] != null)
        //{
        //    String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;

        //    SqlConnection con = new SqlConnection(CS);
        //    con.Open();
        //    SqlCommand cmd = new SqlCommand("select brandid from companies where username='" + Session["Sname"] + "'", con);
        //    SqlDataReader reader = cmd.ExecuteReader();

        //    reader.Read();
        //    string idbra = reader["brandid"].ToString();
        //    int x = Convert.ToInt32(idbra);
        //    //ddlBrands.SelectedItem.Value = x;
        //    //ddlBrands.SelectedIndex 
        //    string cmd2 = "select * from tblPurchase";
        //    //using (SqlCommand cmd = new SqlCommand("select A.*,B.*,C.*,D.*,E.* from tblSizes A inner join tblCategories B on B.CatID=A.CategoryID inner join tblBrands C on C.BrandID=A.BrandID inner join tblSubCategories D on D.SubCatID=A.SubCategoryID inner join tblGender E on E.GenderID=A.GenderID", con))
        //    SqlDataAdapter da = new SqlDataAdapter(cmd2, con);


        //    reader.Close();
        //    DataTable dtBrands = new DataTable();
        //    da.Fill(dtBrands);
        //    grid_Products.DataSource = dtBrands;
        //    grid_Products.DataBind();








        //}


        //else {
        String cs = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);
        string sql = "select * from tblPurchase order by PurchaseID desc";
        SqlDataAdapter da = new SqlDataAdapter(sql, con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        grid_Products.DataSource = dt;
        grid_Products.DataBind();

    }

    protected void grid_Products_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "view")
        {
            String cs = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            int j = Convert.ToInt32(e.CommandArgument);
          
            GridViewRow row = grid_Products.Rows[j + 1];
      
               Label file1 = (Label)row.FindControl("lbl01");
                string sql11 = "select PinCode from tblPurchase where PurchaseID='" + file1.Text + "'";
                SqlCommand com = new SqlCommand(sql11, con);

                con.Open();
                SqlDataReader read3 = com.ExecuteReader();

                read3.Read();
                int sc = Convert.ToInt32(read3["PinCode"].ToString());
                sc++;
                read3.Close();
                int j2 = Convert.ToInt32(e.CommandArgument);
                GridViewRow row2 = grid_Products.Rows[j2];
                Label file2 = (Label)row2.FindControl("lbl01");

                string sql = "UPDATE tblPurchase set PinCode ='" + sc + "' where PurchaseID='" + file2.Text + "'";
                SqlCommand cmd = new SqlCommand(sql, con);
                //cmd.Parameters.AddWithValue("@file", row.Cells[4].Text);
                cmd.ExecuteNonQuery();

                con.Close();
                fill();
        }
        if (e.CommandName == "del")
        {


            String cs = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);

            int j = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = grid_Products.Rows[j];
            Label file1 = (Label)row.FindControl("lbl01");
            SqlCommand cmd = new SqlCommand("delete from tblPurchase where PurchaseID='" + file1.Text + "'", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            fill();

        }

    }
}