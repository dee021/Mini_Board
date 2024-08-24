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
    public partial class Subscribe : System.Web.UI.Page
    {
         protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void BirthMonth_SelectedIndexChanged(object sender, EventArgs e)
        {

            int selectYear = Convert.ToInt32(BirthYear.Text);
            int selectMonth = Convert.ToInt32(BirthMonth.SelectedItem.Text) + 1;

            DateTime selectDate = new DateTime(selectYear, selectMonth, 1);
            selectDate = selectDate.AddDays(-1);
            int lastDay = selectDate.Day;

            BirthDay.Items.Clear();
            BirthDay.Items.Add(new ListItem("일", "0"));
            for (int i = 1; i <= lastDay; i++)
            {
                BirthDay.Items.Add(new ListItem(i.ToString(), i.ToString()));
            }
        }

        protected void checkID_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;
            con.Open();

            string selmemID = "select count(*) from member where memID = @memID";

            SqlCommand cmd = new SqlCommand(selmemID, con);

            cmd.Parameters.AddWithValue("@memID", memID.Text);


            if ((Int32)cmd.ExecuteScalar() == 0) {
                lblchkID.Text = "사용 가능한 아이디 입니다";
                btnSubscribe.Enabled = true;
            }
            else
                lblchkID.Text = "중복된 아이디 입니다";

            con.Close();

        }


        protected void btnSubscribe_Click(object sender, EventArgs e)
        {
            if (Page.IsValid == true)
            {
                SqlConnection con = new SqlConnection();
                con.ConnectionString = WebConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;
                con.Open();

                string insmem = "insert into member values (@memID, @memPW, @memName, @memGender, @memBday, @memQues, @memAns)";

                SqlCommand cmd = new SqlCommand(insmem, con);

                cmd.Parameters.AddWithValue("@memID", memID.Text);
                cmd.Parameters.AddWithValue("@memPW", memPW.Text);
                cmd.Parameters.AddWithValue("@memName", memName.Text);
                cmd.Parameters.AddWithValue("@memGender", memGender.SelectedValue);
                cmd.Parameters.AddWithValue("@memQues", memQues.Text);
                cmd.Parameters.AddWithValue("@memAns", memAns.Text);

                if (BirthYear.Text != "")
                {
                    string bday = BirthYear.Text + "-" + BirthMonth.SelectedItem.Text + "-" + BirthDay.SelectedValue;
                    cmd.Parameters.AddWithValue("@memBday", bday);
                }
                else
                    cmd.Parameters.AddWithValue("@memBday", "");

                cmd.ExecuteNonQuery();

                string inssql = "insert into BlogList values(@memID, N'기본게시판', getdate())";
                cmd = new SqlCommand(inssql, con);
                cmd.Parameters.AddWithValue("@memID", memID.Text);
                cmd.ExecuteNonQuery();

                con.Close();
         Response.Redirect("Login.aspx");
               
            }
        }

        protected void memID_TextChanged(object sender, EventArgs e)
        {
            btnSubscribe.Enabled = false;
        }
    }
}