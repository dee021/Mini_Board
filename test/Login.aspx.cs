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
    public partial class Login : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                this.MultiView1.ActiveViewIndex = 0;

            if (Request.UrlReferrer != null)
            {
                if (Request.UrlReferrer.ToString() == "https://localhost:44325/Subscribe.aspx")
                {
                    Response.Write("<script>alert('가입이 완료되었습니다.')</script>");
                }
            }


        }


        protected void btnSubs_Click1(object sender, EventArgs e)
        {
            Response.Redirect("Subscribe.aspx");
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;
            con.Open();

            string seluser = "select memPW from member where memID = @memID";

            SqlCommand cmd = new SqlCommand(seluser, con);

            cmd.Parameters.AddWithValue("@memID", memID.Text);
            cmd.Parameters.AddWithValue("@memPW", memPW.Text);

            if ((string)cmd.ExecuteScalar() == memPW.Text)
            {
                con.Close();
                /*
                Response.Cookies["Member"]["Name"] = memID.Text;
                HttpCookie usercookie = new HttpCookie("Member");
                */

                HttpCookie usercookie = new HttpCookie("Member");
                usercookie.Value = memID.Text;

                Response.Cookies.Add(usercookie);

                FormsAuthentication.RedirectFromLoginPage(memID.Text, false);
                Response.Redirect("MemCal.aspx");

            }
            else
            {
                con.Close();
                Response.Write("<script>alert('아이디와 비밀번호를 확인해주세요.')</script>");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            this.MultiView1.ActiveViewIndex = 1;
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            DropDownList1.DataSource = SqlDataSource1;
            DropDownList1.DataBind();
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            this.MultiView1.ActiveViewIndex = 0;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;
            con.Open();

            string seluser = "select memAns from member where memName = @memName and memQues = @memQues";

            SqlCommand cmd = new SqlCommand(seluser, con);

            cmd.Parameters.AddWithValue("@memName", txtselID.Text);
            cmd.Parameters.AddWithValue("@memQues", DropDownList1.SelectedItem.Text);

            if ((string)cmd.ExecuteScalar() == txtAns.Text)
            {
               seluser = "select memID from member where memName = @memName and memAns = @memAns";
                cmd = new SqlCommand(seluser, con);
                cmd.Parameters.AddWithValue("@memName", txtselID.Text);
                cmd.Parameters.AddWithValue("@memAns", txtAns.Text);

                lblID.Text = txtselID.Text + "님의 아이디는" + (string)cmd.ExecuteScalar() + "입니다";

                con.Close();

            }
            else
            {
                con.Close();
                lblID.Text = "답변이 다릅니다";
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            this.MultiView1.ActiveViewIndex = 2;
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;
            con.Open();

            string seluser = "select memPW from member where memName = @memName and memID = @memID";

            SqlCommand cmd = new SqlCommand(seluser, con);

            cmd.Parameters.AddWithValue("@memName", txtselPW1.Text);
            cmd.Parameters.AddWithValue("@memID", txtselPW2.Text);

            if (cmd.ExecuteScalar() != null)
            {
                lblPW.Text = txtselPW1.Text + "님의 비밀번호는" + (string)cmd.ExecuteScalar() + "입니다";
                con.Close();

            }
            else
            {
                con.Close();
                lblPW.Text = "이름과 아이디를 확인해주세요";
            }
        }
    }
}