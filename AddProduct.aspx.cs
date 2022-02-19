using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

public partial class AddProduct : System.Web.UI.Page
{
    public static String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Sname"] != null)
            {
                SqlConnection con = new SqlConnection(CS);

              SqlCommand cmd = new SqlCommand("select * from companies where username='" + Session["Sname"] + "'", con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                reader.Read();
                string idbra = reader["type"].ToString();
                reader.Close();
                SqlDataReader Reader2 = cmd.ExecuteReader();

                Reader2.Read();
                string ids2 = Reader2["brandid"].ToString();
                Reader2.Close();
                if (idbra == "1")
                {
                    BindBrands();
                    BindCategory();
                    bindGender();
                    ddlSubCategory.Enabled = false;
                    ddlGender.Enabled = false;

                }

                else
                {
                    string sql = "select count(*)from  tblProducts where tblProducts.PBrandID='"+ids2+"'";
                    SqlCommand com = new SqlCommand(sql, con);



                   
                    Int32 count = (Int32)com.ExecuteScalar();

                    SqlDataReader read3 = com.ExecuteReader();

                    read3.Read();
                   string xcoun = count.ToString();
                    int xcount = Convert.ToInt32(xcoun);
                    read3.Close();
                    con.Close();
                    if (xcount <= 20)
                    {
                        BindBrands();
                        BindCategory();
                        bindGender();
                        ddlSubCategory.Enabled = false;
                        ddlGender.Enabled = false;
                    }
                    else
                    {
                        Session["ssss"] = "45";

                        Server.Transfer("~/AdminHomeAd.aspx");
             


                    }

                }
            }

            BindBrands();
            BindCategory();
            bindGender();
            ddlSubCategory.Enabled = false;
            ddlGender.Enabled = false;
        }
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


    private void bindGender()
    {
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
    private void BindCategory()
    {

        if (Session["Sname"] != null)
        {

            

            using (SqlConnection con = new SqlConnection(CS))
            {

                SqlCommand cmd = new SqlCommand("select * from tblCategories", con);
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                if (dt.Rows.Count != 0)
                {
                    ddlCategory.DataTextField = "CatName";
                    ddlCategory.DataValueField = "CatID";

                    SqlParameter sp = new SqlParameter("@BrandID", ddlBrands.SelectedValue);
                    ddlCategory.DataSource = GetData("catbybrands", sp);
                    ddlCategory.DataBind();
                    ddlCategory.Items.Insert(0, new ListItem("-Select-", "0"));
                }
            }
        }


        else {
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

    private void BindBrands()
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
                ddlBrands.DataSource = dt;
                ddlBrands.DataBind();
                ddlBrands.Items.Insert(0, new ListItem("-Select-", "0"));
            }


        }

        else {
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("select * from tblBrands", con);
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                if (dt.Rows.Count != 0)
                {
                    ddlBrands.DataSource = dt;
                    ddlBrands.DataBind();
                    ddlBrands.Items.Insert(0, new ListItem("-Select-", "0"));
                }
            }

        }
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("procInsertProducts", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@PName", txtPName.Text);
            cmd.Parameters.AddWithValue("@PPrice", txtPrice.Text);
            cmd.Parameters.AddWithValue("@PSelPrice", txtSelPrice.Text);
            cmd.Parameters.AddWithValue("@PBrandID", ddlBrands.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@PCategoryID", ddlCategory.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@PSubCatID", ddlSubCategory.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@PGender", ddlGender.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@PDescription", txtDesc.Text);
            cmd.Parameters.AddWithValue("@PProductDetails", txtPDetails.Text);
            cmd.Parameters.AddWithValue("@PMaterialCare", txtMatCare.Text);
            if (cbFD.Checked == true)
            {
                cmd.Parameters.AddWithValue("@FreeDelivery", 1.ToString());
            }
            else
            {
                cmd.Parameters.AddWithValue("@FreeDelivery", 0.ToString());
            }
            if (cb30Ret.Checked == true)
            {
                cmd.Parameters.AddWithValue("@30DayRet", 1.ToString());
            }
            else
            {
                cmd.Parameters.AddWithValue("@30DayRet", 0.ToString());
            }
            if (cbCOD.Checked == true)
            {
                cmd.Parameters.AddWithValue("@COD", 1.ToString());
            }
            else
            {
                cmd.Parameters.AddWithValue("@COD", 0.ToString());
            }
            con.Open();
            Int64 PID = Convert.ToInt64(cmd.ExecuteScalar());

            //Insert Size Quantity
            for (int i = 0; i < cblSize.Items.Count; i++)
            {
                if (cblSize.Items[i].Selected == true)
                {
                    Int64 SizeID = Convert.ToInt64(cblSize.Items[i].Value);
                    int Quantity = Convert.ToInt32(txtQuantity.Text);


                    SqlCommand cmd2 = new SqlCommand("insert into tblProductSizeQuantity values('" + PID + "','" + SizeID + "','" + Quantity + "')", con);
                    cmd2.ExecuteNonQuery();
                }
            }

            //Insert and upload Images
            if (fuImg01.HasFiles)
            {
                int j = 01;

                foreach (HttpPostedFile xxd in fuImg01.PostedFiles)
                {
                   string SavePath = Server.MapPath("~/Images/ProductImages/") + PID;
                    if (!Directory.Exists(SavePath))
                    {
                        Directory.CreateDirectory(SavePath);
                    }
                    string ext = System.IO.Path.GetExtension(fuImg01.FileName);

                    xxd.SaveAs(SavePath + "\\" + txtPName.Text.ToString().Trim() + j + ext);

                    SqlCommand cmd3 = new SqlCommand("insert into tblProductImages values('" + PID + "','" + txtPName.Text.ToString().Trim() + j + "','" + ext + "')", con);
                    cmd3.ExecuteNonQuery();
                    j++;
                }
            }

            //if (fuImg02.HasFile)
            //{
            //    string SavePath = Server.MapPath("~/Images/ProductImages/") + PID;
            //    if (!Directory.Exists(SavePath))
            //    {
            //        Directory.CreateDirectory(SavePath);
            //    }
            //    string Extention = Path.GetExtension(fuImg02.PostedFile.FileName);
            //    fuImg02.SaveAs(SavePath + "\\" + txtPName.Text.ToString().Trim() + "02" + Extention);

            //    SqlCommand cmd4 = new SqlCommand("insert into tblProductImages values('" + PID + "','" + txtPName.Text.ToString().Trim() + "02" + "','" + Extention + "')", con);
            //    cmd4.ExecuteNonQuery();
            //}
            //if (fuImg03.HasFile)
            //{
            //    string SavePath = Server.MapPath("~/Images/ProductImages/") + PID;
            //    if (!Directory.Exists(SavePath))
            //    {
            //        Directory.CreateDirectory(SavePath);
            //    }
            //    string Extention = Path.GetExtension(fuImg03.PostedFile.FileName);
            //    fuImg03.SaveAs(SavePath + "\\" + txtPName.Text.ToString().Trim() + "03" + Extention);

            //    SqlCommand cmd5 = new SqlCommand("insert into tblProductImages values('" + PID + "','" + txtPName.Text.ToString().Trim() + "03" + "','" + Extention + "')", con);
            //    cmd5.ExecuteNonQuery();
            //}
            //if (fuImg04.HasFile)
            //{
            //    string SavePath = Server.MapPath("~/Images/ProductImages/") + PID;
            //    if (!Directory.Exists(SavePath))
            //    {
            //        Directory.CreateDirectory(SavePath);
            //    }
            //    string Extention = Path.GetExtension(fuImg04.PostedFile.FileName);
            //    fuImg04.SaveAs(SavePath + "\\" + txtPName.Text.ToString().Trim() + "04" + Extention);

            //    SqlCommand cmd6 = new SqlCommand("insert into tblProductImages values('" + PID + "','" + txtPName.Text.ToString().Trim() + "04" + "','" + Extention + "')", con);
            //    cmd6.ExecuteNonQuery();
            //}
            //if (fuImg05.HasFile)
            //{
            //    string SavePath = Server.MapPath("~/Images/ProductImages/") + PID;
            //    if (!Directory.Exists(SavePath))
            //    {
            //        Directory.CreateDirectory(SavePath);
            //    }
            //    string Extention = Path.GetExtension(fuImg05.PostedFile.FileName);
            //    fuImg05.SaveAs(SavePath + "\\" + txtPName.Text.ToString().Trim() + "05" + Extention);

            //    SqlCommand cmd7 = new SqlCommand("insert into tblProductImages values('" + PID + "','" + txtPName.Text.ToString().Trim() + "05" + "','" + Extention + "')", con);
            //    cmd7.ExecuteNonQuery();
            //}
        }
    }

    protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        int MainCategoryID = Convert.ToInt32(ddlCategory.SelectedItem.Value);
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("select * from tblSubCategories where MainCatID='" + ddlCategory.SelectedItem.Value + "'", con);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count != 0)
            {
                ddlSubCategory.DataSource = dt;
                ddlSubCategory.DataTextField = "SubCatName";
                ddlSubCategory.DataValueField = "SubCatID";
                ddlSubCategory.DataBind();
                ddlSubCategory.Items.Insert(0, new ListItem("-Select-", "0"));
                ddlSubCategory.Enabled = true;
            }
        }
    }



    protected void ddlGender_SelectedIndexChanged(object sender, EventArgs e)
    {


        SqlConnection con = new SqlConnection(CS);
        SqlCommand cmd = new SqlCommand("select * from tblSizes where BrandID='" + ddlBrands.SelectedItem.Value + "' and CategoryID='" + ddlCategory.SelectedItem.Value + "'and SubCategoryID='" + ddlSubCategory.SelectedItem.Value + "'and GenderID='" + ddlGender.SelectedItem.Value + "'", con);
        con.Open();
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);

        if (dt.Rows.Count > 0)
        {

            cblSize.DataSource = dt;
            cblSize.DataTextField = "SizeName";
            cblSize.DataValueField = "SizeID";
            cblSize.DataBind();

        }
        else
        {
            cblSize.Items.Clear();
        }

    }

    protected void ddlSubCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlSubCategory.SelectedIndex != 0)
        {
            ddlGender.Enabled = true;
        }
    }

    protected void ddlBrands_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindCategory();
    }


}