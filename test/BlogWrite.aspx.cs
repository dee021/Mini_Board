using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace test
{
    public partial class BlogWirte : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;
            con.Open();

            string inssql = "insert into memBlog values (@memID, @board, getdate(), @title, @contents)";

            SqlCommand cmd = new SqlCommand(inssql, con);
            string memID = Request.Cookies["Member"].Value;
            
            cmd.Parameters.AddWithValue("@memID", memID);
            cmd.Parameters.AddWithValue("@board", ddlBoard.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@title", txtTitle.Text);
            cmd.Parameters.AddWithValue("@contents", txtCon.Text);

            cmd.ExecuteNonQuery();
            con.Close();

            Response.Redirect("memBlog.aspx");
        }
    }
}