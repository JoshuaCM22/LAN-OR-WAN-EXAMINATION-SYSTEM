using System;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
namespace LAN_OR_WAN_EXAMINATION_SYSTEM.students // Created by: Joshua C. Magoliman
{
    public partial class Form_MyResult : System.Web.UI.Page
    {
        private static string studentIdNo;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetMyResultsToday(Student.studentId);
            }
            Student.isExamIsStarted = false;
        }
        private void GetMyResultsToday(int param_Value)
        {
            try
            {
                Objects.con.Open();
                Objects.cmd = new SqlCommand("SELECT student_id_no FROM tbl_students WHERE id=@id", Objects.con);
                Objects.cmd.CommandType = CommandType.Text;
                Objects.cmd.Parameters.AddWithValue("@id", param_Value);
                studentIdNo = Objects.cmd.ExecuteScalar().ToString();
                Objects.con.Close();
                Objects.cmd.Dispose();

                int currentYear = DateTime.Now.Year;
                int currentMonth = DateTime.Now.Month;
                int currentDay = DateTime.Now.Day;

                Objects.con.Open();
                Objects.cmd = new SqlCommand("sp_GetAllExamsToday", Objects.con);
                Objects.cmd.CommandType = CommandType.StoredProcedure;
                Objects.cmd.Parameters.AddWithValue("@StudentIdNo", studentIdNo);
                Objects.cmd.Parameters.AddWithValue("@Year", currentYear);
                Objects.cmd.Parameters.AddWithValue("@Month", currentMonth);
                Objects.cmd.Parameters.AddWithValue("@Day", currentDay);
                Objects.da = new SqlDataAdapter();
                Objects.da.SelectCommand = Objects.cmd;
                Objects.dt = new DataTable();
                Objects.da.Fill(Objects.dt);
                if (Objects.dt.Rows.Count > 0)
                {
                    gvMyResult.DataSource = Objects.dt;
                    gvMyResult.DataBind();
                    pnlMyResultShowWarning.Visible = false;
                }
                else
                {
                    pnlMyResultShowWarning.Visible = true;
                    lblMyResultShowWarning.Text = "You don't have any taken exam today!";
                }
            }
            catch (Exception ex)
            {
                pnlMyResultShowWarning.Visible = true;
                lblMyResultShowWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
            finally
            {
                Objects.con.Close();
                Objects.cmd.Dispose();
            }
        }
        protected void gvMyResult_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvMyResult.PageIndex = e.NewPageIndex;
            GetMyResultsToday(Student.studentId);
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtSearch.Text == string.Empty || ddlFilter.Text == "None")
                {
                    GetMyResultsToday(Student.studentId);
                }
                else if (ddlFilter.Text == "Exam Name")
                {
                    Objects.con.Open();
                    Objects.cmd = new SqlCommand("SELECT * FROM vw_GetAllResults WHERE [STUDENT ID NO]=@STUDENT_ID_NO AND [EXAM NAME] LIKE @EXAM_NAME ORDER BY ID DESC", Objects.con);
                    Objects.cmd.CommandType = CommandType.Text;
                    Objects.cmd.Parameters.AddWithValue("@STUDENT_ID_NO", studentIdNo);
                    Objects.cmd.Parameters.AddWithValue("@EXAM_NAME", "%" + txtSearch.Text + "%");
                }
                else if (ddlFilter.Text == "Total Question")
                {
                    Objects.con.Open();
                    Objects.cmd = new SqlCommand("SELECT * FROM vw_GetAllResults WHERE [STUDENT ID NO]=@STUDENT_ID_NO AND [TOTAL QUESTION] LIKE @TOTAL_QUESTION ORDER BY ID DESC", Objects.con);
                    Objects.cmd.CommandType = CommandType.Text;
                    Objects.cmd.Parameters.AddWithValue("@STUDENT_ID_NO", studentIdNo);
                    Objects.cmd.Parameters.AddWithValue("@TOTAL_QUESTION", "%" + txtSearch.Text + "%");
                }
                else if (ddlFilter.Text == "Your Score")
                {
                    Objects.con.Open();
                    Objects.cmd = new SqlCommand("SELECT * FROM vw_GetAllResults WHERE [STUDENT ID NO]=@STUDENT_ID_NO AND [SCORE] LIKE @SCORE ORDER BY ID DESC", Objects.con);
                    Objects.cmd.CommandType = CommandType.Text;
                    Objects.cmd.Parameters.AddWithValue("@STUDENT_ID_NO", studentIdNo);
                    Objects.cmd.Parameters.AddWithValue("@SCORE", "%" + txtSearch.Text + "%");
                }
                else if (ddlFilter.Text == "Status")
                {
                    Objects.con.Open();
                    Objects.cmd = new SqlCommand("SELECT * FROM vw_GetAllResults WHERE [STUDENT ID NO]=@STUDENT_ID_NO AND [STATUS] LIKE @STATUS ORDER BY ID DESC", Objects.con);
                    Objects.cmd.CommandType = CommandType.Text;
                    Objects.cmd.Parameters.AddWithValue("@STUDENT_ID_NO", studentIdNo);
                    Objects.cmd.Parameters.AddWithValue("@STATUS", "%" + txtSearch.Text + "%");
                }
                else if (ddlFilter.Text == "Date and Time")
                {
                    Objects.con.Open();
                    Objects.cmd = new SqlCommand("SELECT * FROM vw_GetAllResults WHERE [STUDENT ID NO]=@STUDENT_ID_NO AND [DATE AND TIME] LIKE @DATE_AND_TIME ORDER BY ID DESC", Objects.con);
                    Objects.cmd.CommandType = CommandType.Text;
                    Objects.cmd.Parameters.AddWithValue("@STUDENT_ID_NO", studentIdNo);
                    Objects.cmd.Parameters.AddWithValue("@DATE_AND_TIME", "%" + txtSearch.Text + "%");
                }
                if (txtSearch.Text != string.Empty || ddlFilter.Text != "None")
                {
                    Objects.da = new SqlDataAdapter();
                    Objects.da.SelectCommand = Objects.cmd;
                    Objects.dt = new DataTable();
                    Objects.da.Fill(Objects.dt);
                    if (Objects.dt.Rows.Count > 0)
                    {
                        gvMyResult.DataSource = Objects.dt;
                        gvMyResult.DataBind();
                        gvMyResult.Visible = true;
                        pnlMyResultShowWarning.Visible = false;
                    }
                    else
                    {
                        gvMyResult.Visible = false;
                        pnlMyResultShowWarning.Visible = true;
                        lblMyResultShowWarning.Text = "Nothing found!";
                    }
                }
            }
            catch (Exception ex)
            {
                pnlMyResultShowWarning.Visible = true;
                lblMyResultShowWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
            finally
            {
                Objects.con.Close();
                Objects.cmd.Dispose();
            }
        }
    }
}