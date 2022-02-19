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
        if (!IsPostBack)
        {
            if(Session["ssss"] != null)
            {
                Response.Write("<script>alert('your free trail had ended.');</script>");
                Session["ssss"] = null;
            }
            if (Session["Sname"] == null)
            {
                Response.Redirect("~/SignIn 2.aspx");
            }
        }
    }

    protected void btnaddcat_Click(object sender, EventArgs e)
    {
        Server.Transfer("~/AddCategory.aspx");
    }

    protected void btnaddsub_Click(object sender, EventArgs e)
    {
        Server.Transfer("~/AddSubCategory.aspx");
    }

    protected void btnaddsize_Click(object sender, EventArgs e)
    {
        Server.Transfer("~/AddSize.aspx");
    }

    protected void btnaddpro_Click(object sender, EventArgs e)
    {
        Server.Transfer("~/AddProduct.aspx");
    }

    protected void btnmanapro_Click(object sender, EventArgs e)
    {
        Server.Transfer("~/ManageProducts.aspx");

    }
}