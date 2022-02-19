using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Products : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

              
            BindProductRepeater();
        }
    }
    private void BindProductRepeater()
    {

        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
        Int64 CatId = Request.QueryString["cat"] == null ? 0 : Convert.ToInt64(Request.QueryString["cat"]);
        Int64 SubCatId = Request.QueryString["subcat"] == null ? 0 : Convert.ToInt64(Request.QueryString["subcat"]);
        Int64 PID = Request.QueryString["PID"] == null ? 0 : Convert.ToInt64(Request.QueryString["PID"]);
        Int64 PBrandID = Request.QueryString["PBrandID"] == null ? 0 : Convert.ToInt64(Request.QueryString["PBrandID"]);

        //if (Session["K1"] != null)
        //{
        //    CatId = Convert.ToInt64(Session["K1"]);
        //    Session["K1"] = null;
        //}
        if (Session["K2"] != null)
        {
            PID = Convert.ToInt64(Session["K2"]);
            Session["K2"] = null;
        }
        //if (Session["K123"] != null)
        //{
        //    PBrandID = Convert.ToInt64(Session[""]);
        //    Session["K123"] = null;
        //}


        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("procBindAllProducts", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                if (CatId > 0)
                {
                    cmd.Parameters.AddWithValue("@PCategoryID", CatId);
                }
                if (SubCatId > 0)
                {
                    cmd.Parameters.AddWithValue("@PSubCatID", SubCatId);
                }
                if (PID > 0)
                {
                    cmd.Parameters.AddWithValue("@PID", PID);
                }

                if (PBrandID > 0)
                {
                    cmd.Parameters.AddWithValue("@PBrandID", PBrandID);
                }

                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtBrands = new DataTable();
                    sda.Fill(dtBrands);
                    rptrProducts.DataSource = dtBrands;
                    rptrProducts.DataBind();
                }

            }
        }
    }
}