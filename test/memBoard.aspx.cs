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
    public partial class memBoard : System.Web.UI.Page
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
            }
        }

        protected void btnDel_Click(object sender, EventArgs e)
        {
            string memID = Request.Cookies["Member"].Value;

            if (ListBox1.SelectedItem.Text != "기본게시판")
            {
                string connectionString = WebConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(connectionString);
                con.Open();

                string delSql = "delete BlogList where memID=@memID and board=@board ";
                SqlCommand cmd = new SqlCommand(delSql, con);
                cmd.Parameters.AddWithValue("@memID", memID);
                cmd.Parameters.AddWithValue("@board", ListBox1.SelectedItem.Text);

                cmd.ExecuteNonQuery();

                string udtSql = "update memBlog set board=N'기본게시판' where memID=@memID and board=@board ";
                cmd = new SqlCommand(udtSql, con);
                cmd.Parameters.AddWithValue("@memID", memID);
                cmd.Parameters.AddWithValue("@board", ListBox1.SelectedItem.Text);
                cmd.ExecuteNonQuery();

                ListBox1.Items.Clear();

                string selectSql = "SELECT board FROM BlogList WHERE memID = @memID order by createTime";
                cmd = new SqlCommand(selectSql, con);
                cmd.Parameters.AddWithValue("@memID", memID);

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    ListBox1.Items.Add(dr["board"].ToString());
                }
                dr.Close();

                con.Close();

                ListBox1.SelectedIndex = 0;
            }
            else
                Response.Write("<script>alert('기본게시판은 삭제할 수 없습니다.')</script>");
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string memID = Request.Cookies["Member"].Value;
            string connectionString = WebConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();

            string insSql = " insert into BlogList values(@memID, @board, GETDATE())";
            SqlCommand cmd = new SqlCommand(insSql, con);
            cmd.Parameters.AddWithValue("@memID", memID);
            cmd.Parameters.AddWithValue("@board", txtBoard.Text);

            cmd.ExecuteNonQuery();
              con.Close();
            ListBox1.Items.Add(txtBoard.Text);
            txtBoard.Text = "";
        }
    }
}