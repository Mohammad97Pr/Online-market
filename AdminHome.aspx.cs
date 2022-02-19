using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminHome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_profadd_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AddBrand.aspx");
    }

    protected void btn_addcat_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AddCategory.aspx");
    }

    protected void btnaddsub_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AddSubCategory.aspx");
    }

    protected void btnaddgend_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AddGender.aspx");
    }

    protected void btnaddsize_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AddSize.aspx");

    }

    protected void btnaddpro_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AddProduct.aspx");

    }

    protected void btnmanpro_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ManageProducts.aspx");

    }

    protected void btnaddacc_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/company.aspx");
    }

    protected void btnmanacc_Click(object sender, EventArgs e)
    {
        //Response.Redirect("~/AddBrand.aspx");
    }
}