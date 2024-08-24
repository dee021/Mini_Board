using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace test
{
    public partial class MemBlog : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string memID = Request.Cookies["Member"].Value;

            if (!IsPostBack)
            {
                // 게시판 목록 생성
                string connectionString = WebConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(connectionString);
                con.Open();

                string selectSql = "SELECT board FROM BlogList WHERE memID = @memID order by createTime";
                SqlCommand cmd = new SqlCommand(selectSql, con);
                cmd.Parameters.AddWithValue("@memID", memID);

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    ListBox1.Items.Add(dr["board"].ToString());
                }

                dr.Close();
                con.Close();

                ListBox1.Items[0].Selected = true;
            }
            
        }
    

        protected void Button1_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("Login.aspx");
        }

        protected void btnBlog_Click(object sender, EventArgs e)
        {
            Response.Redirect("MemCal.aspx");
        }

       
    }
}