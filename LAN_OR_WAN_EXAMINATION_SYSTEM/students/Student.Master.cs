using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
namespace LAN_OR_WAN_EXAMINATION_SYSTEM.students // Created by: Joshua C. Magoliman
{
    public partial class Student : System.Web.UI.MasterPage
    {
        public static int studentId;
        public static string studentFullName;
        public static bool isExamIsStarted = false;
        public static int hours, minutes, seconds;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack || !IsPostBack)
            {
                HttpCookie cookie = Request.Cookies["StudentCookie"];
                if (cookie != null)
                {
                    lbtnLogOut.Text = "Log out";
                    Session["StudentEmail"] = cookie["StudentEmail"].ToString();
                    studentFullName = cookie["StudentFullName"].ToString();
                    RetrieveStudentId(Session["StudentEmail"].ToString());
                }
                else
                {
                    Response.Redirect("../students/Default.aspx");
                }
            }
            if (isExamIsStarted == true)
            {
                Page.RegisterStartupScript("unique_key", "<script type=\"text/javascript\">display()</script>");
                lblShowTimer.Visible = true;
            }
            else
            {
                lblShowTimer.Visible = false;
            }
        }
        private void RetrieveStudentId(string param_Value)
        {
            Objects.con.Close();
            Objects.cmd.Dispose();

            Objects.con.Open();
            Objects.cmd = new SqlCommand("SELECT id FROM tbl_students WHERE email=@email", Objects.con);
            Objects.cmd.CommandType = CommandType.Text;
            Objects.cmd.Parameters.AddWithValue("@email", param_Value);
            studentId = Convert.ToInt32(Objects.cmd.ExecuteScalar());
            Objects.con.Close();
            Objects.cmd.Dispose();
        }
        public static void RetrieveDurationTimeOfExam(int param_Value)
        {
            Objects.con.Open();
            Objects.cmd = new SqlCommand("SELECT duration_time FROM tbl_exams WHERE id=@id", Objects.con);
            Objects.cmd.CommandType = CommandType.Text;
            Objects.cmd.Parameters.AddWithValue("@id", param_Value);
            string durationTime = Objects.cmd.ExecuteScalar().ToString();
            hours = Convert.ToInt32(durationTime.Substring(0, 2));
            minutes = Convert.ToInt32(durationTime.Substring(3, 2));
            seconds = Convert.ToInt32(durationTime.Substring(6, 2));
            Objects.con.Close();
            Objects.cmd.Dispose();
        }
        protected void lbtnLogOut_Click(object sender, EventArgs e)
        {
            if (lbtnLogOut.Text == "Log out")
            {
                if (Request.Cookies["StudentCookie"] != null)
                {
                    Response.Cookies["StudentCookie"].Expires = DateTime.Now.AddDays(-1);
                    Session.Clear();
                    Response.Redirect("../students/Default.aspx");
                }
            }
        }
    }
}