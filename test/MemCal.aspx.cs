using System;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace test
{
    public partial class MemCal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!IsPostBack)
            {
                Calendar1.SelectedDate= DateTime.Today;
                lblDate.Text = Calendar1.SelectedDate.Year + "년 " + Calendar1.SelectedDate.Month + "월 " + Calendar1.SelectedDate.Day + "일";


                this.MultiView1.ActiveViewIndex = 0;

                DataBinding(sender,e);
            }
        }

        protected void cmd_move(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "move") 
            {
                switch (e.CommandArgument.ToString())
                {
                    case "0":
                        {
                            this.MultiView1.ActiveViewIndex = 0;
                            break;
                        }
                    case "1":
                        {
                            this.MultiView1.ActiveViewIndex = 1;
                            break;
                        }
                    case "2":
                        {
                            this.MultiView1.ActiveViewIndex = 2;
                            break;
                        }
                }
            }
        }
         


        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
          lblDate.Text = Calendar1.SelectedDate.Year + "년 " + Calendar1.SelectedDate.Month + "월 " + Calendar1.SelectedDate.Day + "일";
            DataBinding(sender, e);
        }

        protected void btnWrite1_Click(object sender, EventArgs e)
        {
            // 일정추가 (insert 후 multiview, binding()
            SqlConnection con = new SqlConnection();
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;
            con.Open();

            string inssql = "insert into memCal values (@calDate, @memID, cast(getdate() as time), 's', @contents, @startTime, @endTime)";

            SqlCommand cmd = new SqlCommand(inssql, con);
            string memID = Request.Cookies["Member"].Value;
           

            cmd.Parameters.AddWithValue("@memID", memID);
            cmd.Parameters.AddWithValue("@calDate", Calendar1.SelectedDate);
            cmd.Parameters.AddWithValue("@contents", txtSch.Text);
            cmd.Parameters.AddWithValue("@startTime", starttime.Text);
            cmd.Parameters.AddWithValue("@endTime", endtime.Text);

            cmd.ExecuteNonQuery();
            con.Close();

            starttime.Text = "";
            endtime.Text = "";
            txtSch.Text = "";

            this.MultiView1.ActiveViewIndex = 0;
            DataBinding(sender, e);
        }


        protected void DataBinding(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;
            con.Open();

            string sqlquery = ddlsql.SelectedValue;
            string selCal="";
            switch (sqlquery)
            {
                case "a":
                    {
                        selCal = "select cast(calTime as varchar(8)) as '시간', contents as '내용' from memCal where calDate = @calDate and category='d' and memID=@memID ";
                           selCal += "union all select concat(cast(startTime as varchar(8)),'~',cast(endTime as varchar(8))) as '시간', contents as '내용' from memCal";
                        selCal += " where calDate = @calDate and category='s' and memID=@memID";
                    break;
                    }
                case "d":
                    {
                        selCal = "select cast(calTime as varchar(8)) as '시간', contents AS '내용' from memCal where calDate = @calDate and category='d' and memID=@memID";
                        break;
                    }
                case "s":
                    {
                        selCal = "select concat(cast(startTime AS varchar(8)),'~',cast(endTime as varchar(8))) AS N'시간', contents as N'내용' from memCal where calDate = @calDate and category='s' and memID=@memID";
                        break;
                    }
            }


            SqlCommand cmd = new SqlCommand(selCal, con);

            string memID = Request.Cookies["Member"].Value;
          
            cmd.Parameters.AddWithValue("@memID",memID);
            cmd.Parameters.AddWithValue("@calDate", Calendar1.SelectedDate);
           

               SqlDataAdapter Adapter = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();

               Adapter.Fill(ds, "myCalender");
           

            SqlDataSource1.SelectCommand = selCal;
            SqlDataSource1.DataBind();
            GridView1.DataSource = ds;
            GridView1.DataBind();



            con.Close();

        }

        protected void btnWrite2_Click(object sender, EventArgs e)
        {
            // 일기추가 (insert 후 multiview, binding()
            SqlConnection con = new SqlConnection();
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;
            con.Open();

            string inssql = "insert into memCal values (@calDate, @memID, cast(getdate() as time), 'd', @contents,null,null)";

            SqlCommand cmd = new SqlCommand(inssql, con);
            string memID = Request.Cookies["Member"].Value;
            

            cmd.Parameters.AddWithValue("@memID", memID);
            cmd.Parameters.AddWithValue("@calDate", Calendar1.SelectedDate);
            cmd.Parameters.AddWithValue("@contents", txtDia.Text);

            cmd.ExecuteNonQuery();
            con.Close();

            txtDia.Text = "";

            this.MultiView1.ActiveViewIndex = 0;
            DataBinding(sender, e);
        }

        protected void ddlsql_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataBinding(sender, e);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("Login.aspx");
        }

        protected void btnBlog_Click(object sender, EventArgs e)
        {
            Response.Redirect("memBlog.aspx");
        }
    }
}