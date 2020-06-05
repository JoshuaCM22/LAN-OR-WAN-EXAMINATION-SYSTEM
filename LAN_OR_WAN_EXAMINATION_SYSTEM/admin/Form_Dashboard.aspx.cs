using System;
using System.Data;
using System.Data.SqlClient;
namespace LAN_OR_WAN_EXAMINATION_SYSTEM.admin // Created by: Joshua C. Magoliman
{
    public partial class Form_Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GetTotalCategories();
            GetTotalSubjects();
            GetTotalExams();
            GetTotalQuestions();
            GetTotalResults();
            GetTotalStudents();
        }
        private void GetTotalCategories()
        {
            try
            {
                Objects.con.Open();
                Objects.cmd = new SqlCommand("sp_GetTotalCategories", Objects.con);
                Objects.cmd.CommandType = CommandType.StoredProcedure;
                lblTotalCategories.Text = Objects.cmd.ExecuteScalar().ToString();
                Objects.con.Close();
                Objects.cmd.Dispose();
            }
            catch (Exception ex)
            {
                pnlWarning.Visible = true;
                lblWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
        }
        private void GetTotalSubjects()
        {
            try
            {
                Objects.con.Open();
                Objects.cmd = new SqlCommand("sp_GetTotalSubjects", Objects.con);
                Objects.cmd.CommandType = CommandType.StoredProcedure;
                lblTotalSubjects.Text = Objects.cmd.ExecuteScalar().ToString();
                Objects.con.Close();
                Objects.cmd.Dispose();
            }
            catch (Exception ex)
            {
                pnlWarning.Visible = true;
                lblWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
        }
        private void GetTotalExams()
        {
            try
            {
                Objects.con.Open();
                Objects.cmd = new SqlCommand("sp_GetTotalExams", Objects.con);
                Objects.cmd.CommandType = CommandType.StoredProcedure;
                lblTotalExams.Text = Objects.cmd.ExecuteScalar().ToString();
                Objects.con.Close();
                Objects.cmd.Dispose();

                Objects.con.Open();
                Objects.cmd = new SqlCommand("sp_GetTotalExamsActive", Objects.con);
                Objects.cmd.CommandType = CommandType.StoredProcedure;
                lblExamActive.Text = Objects.cmd.ExecuteScalar().ToString();
                Objects.con.Close();
                Objects.cmd.Dispose();

                Objects.con.Open();
                Objects.cmd = new SqlCommand("sp_GetTotalExamsInactive", Objects.con);
                Objects.cmd.CommandType = CommandType.StoredProcedure;
                lblExamInactive.Text = Objects.cmd.ExecuteScalar().ToString();
                Objects.con.Close();
                Objects.cmd.Dispose();
            }
            catch (Exception ex)
            {
                pnlWarning.Visible = true;
                lblWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
        }
        private void GetTotalQuestions()
        {
            try
            {
                Objects.con.Open();
                Objects.cmd = new SqlCommand("sp_GetTotalQuestions", Objects.con);
                Objects.cmd.CommandType = CommandType.StoredProcedure;
                lblTotalQuestions.Text = Objects.cmd.ExecuteScalar().ToString();
                Objects.con.Close();
                Objects.cmd.Dispose();
            }
            catch (Exception ex)
            {
                pnlWarning.Visible = true;
                lblWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
        }
        private void GetTotalResults()
        {
            try
            {
                Objects.con.Open();
                Objects.cmd = new SqlCommand("sp_GetTotalResults", Objects.con);
                Objects.cmd.CommandType = CommandType.StoredProcedure;
                lblTotalResults.Text = Objects.cmd.ExecuteScalar().ToString();
                Objects.con.Close();
                Objects.cmd.Dispose();

                int currentYear = DateTime.Now.Year;
                int currentMonth = DateTime.Now.Month;
                int currentDay = DateTime.Now.Day;

                Objects.con.Open();
                Objects.cmd = new SqlCommand("sp_GetTotalResultsToday", Objects.con);
                Objects.cmd.CommandType = CommandType.StoredProcedure;
                Objects.cmd.Parameters.AddWithValue("@Year", currentYear);
                Objects.cmd.Parameters.AddWithValue("@Month", currentMonth);
                Objects.cmd.Parameters.AddWithValue("@Day", currentDay);
                lblToday.Text = Objects.cmd.ExecuteScalar().ToString();
                Objects.con.Close();
                Objects.cmd.Dispose();

                Objects.con.Open();
                Objects.cmd = new SqlCommand("sp_GetTotalResultsPrevious", Objects.con);
                Objects.cmd.CommandType = CommandType.StoredProcedure;
                Objects.cmd.Parameters.AddWithValue("@Year", currentYear);
                Objects.cmd.Parameters.AddWithValue("@Month", currentMonth);
                Objects.cmd.Parameters.AddWithValue("@Day", currentDay);
                lblPrevious.Text = Objects.cmd.ExecuteScalar().ToString();
                Objects.con.Close();
                Objects.cmd.Dispose();
            }
            catch (Exception ex)
            {
                pnlWarning.Visible = true;
                lblWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
        }
        private void GetTotalStudents()
        {
            try
            {
                Objects.con.Open();
                Objects.cmd = new SqlCommand("sp_GetTotalStudents", Objects.con);
                Objects.cmd.CommandType = CommandType.StoredProcedure;
                lblTotalStudents.Text = Objects.cmd.ExecuteScalar().ToString();
                Objects.con.Close();
                Objects.cmd.Dispose();
            }
            catch (Exception ex)
            {
                pnlWarning.Visible = true;
                lblWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
        }
    }
}