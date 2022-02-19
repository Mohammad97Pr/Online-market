using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GeneralLayout : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindCartNumber();
        BindCategories();
        if (Session["USERNAME"] != null)
        {
            btnSignup.Visible = false;
            btnSignin.Visible = false;
            btnSignOut.Visible = true;
        }
        else
        {
            btnSignup.Visible = true;
            btnSignin.Visible = true;
            btnSignOut.Visible = false;
        }
    }

    public void BindCartNumber()
    {
        if (Request.Cookies["CartPID"] != null)
        {
            string CookiePID = Request.Cookies["CartPID"].Value.Split('=')[1];
            string[] ProductArray = CookiePID.Split(',');
            int ProductCount = ProductArray.Length;
            pCount.InnerText = ProductCount.ToString();
        }
        else
        {
            pCount.InnerText = 0.ToString();
        }
    }

    protected void btnSignOut_Click(object sender, EventArgs e)
    {
        Session["USERNAME"] = null;
        Response.Redirect("~/Default.aspx");
    }

    public void BindCategories()
    {
        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("select * from tblCategories", con))
            {
                cmd.CommandType = CommandType.Text;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtBrands = new DataTable();
                    sda.Fill(dtBrands);
                    rptCategory.DataSource = dtBrands;
                    rptCategory.DataBind();
                }

            }
        }
    }

    protected void OnItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            string catId = (e.Item.FindControl("hfCatId") as HiddenField).Value;
            Repeater rptSubCategories = e.Item.FindControl("rptSubCategories") as Repeater;

            String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand(string.Format("SELECT * FROM tblSubCategories WHERE MainCatID='{0}'", catId), con))
                {
                    cmd.CommandType = CommandType.Text;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dtBrands = new DataTable();
                        sda.Fill(dtBrands);
                        //rptSubCategories.DataSource = dtBrands;
                        //rptSubCategories.DataBind();
                    }

                }
            }
        }
    }
    protected void btn_sub_Click(object sender, EventArgs e)
    {
        try
        {
            MailMessage mailMessage = new MailMessage();
            mailMessage.From = new MailAddress("aboalmajd805@gmail.com");
            mailMessage.To.Add("aboalmajd805@gmail.com");
            mailMessage.Subject = " submit ";


            mailMessage.Body = "<b>Sender Name : </b>" + txt_fname.Text + "<br/>"
                + "<b>Sender Email : </b>" + TextBox2.Text + "<br/>"
                + "<b>Comments : </b>" + TextBox3.Text;
            mailMessage.IsBodyHtml = true;


            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
            smtpClient.EnableSsl = true;
            smtpClient.Credentials = new System.Net.NetworkCredential("aboalmajd805@gmail.com", "engmo_1520_engmoo");
            smtpClient.Send(mailMessage);

            label1.Text = "Thank you for contacting us";

            txt_fname.Enabled = false;
            TextBox2.Enabled = false;
            TextBox3.Enabled = false;

        }

        catch (Exception ex)
        {
            // Log the exception information to 
            // database table or event viewer
            label1.ForeColor = System.Drawing.Color.Red;
            label1.Text = "There is an unkwon problem. Please try later";
        }
    }


    protected void btnsearch_Click(object sender, EventArgs e)
    {
        if (txtsearch.Text != null)
        {
            try
            {

                    try
                    {

                        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
                        SqlConnection con = new SqlConnection(CS);
                        SqlCommand cmd = new SqlCommand("SELECT * FROM tblProducts WHERE PName ='" + txtsearch.Text + "'", con);
                        con.Open();


                        SqlDataReader reader = cmd.ExecuteReader();

                        reader.Read();
                        string s1 = reader["PID"].ToString();
                        Session["K2"] = s1;
                        Server.Transfer("~/Products.aspx");
                        con.Close();



                    }
                    catch (Exception ex)
                    {
                        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
                        SqlConnection con = new SqlConnection(CS);
                        SqlCommand cmd = new SqlCommand("SELECT *,(select PBrandID from tblProducts where tblProducts.PBrandID = BrandID) as PBrandID FROM tblBrands WHERE Name ='" + txtsearch.Text + "'", con);
                        con.Open();


                        SqlDataReader reader = cmd.ExecuteReader();

                        reader.Read();
                        string s2 = reader["PBrandID"].ToString();
                        Session["K123"] = s2;
                        Server.Transfer("~/Products.aspx");
                        con.Close();


                    }
            
                }
            catch (Exception ex3)
            {
                return;
            }
        }
        else
        {
            return;
        }


    }

    protected void linkcompany_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/joincompany.aspx");
    }

    protected void SignIn2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/SignIn 2.aspx");

    }

  
}
