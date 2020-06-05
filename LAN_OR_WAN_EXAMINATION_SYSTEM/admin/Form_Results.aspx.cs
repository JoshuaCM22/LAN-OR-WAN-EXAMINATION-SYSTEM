using System;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
namespace LAN_OR_WAN_EXAMINATION_SYSTEM.admin // Created by: Joshua C. Magoliman
{
    public partial class Form_Results : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string studentId = Request.QueryString["studentId"];
            if (!IsPostBack)
            {
                if (studentId == null)
                {
                    GetAllResultsToday();
                }
                else
                {
                    RetrieveStudentResults(Convert.ToInt32(studentId));
                }
            }
        }
        private void GetAllResultsToday()
        {
            try
            {
                int currentYear = DateTime.Now.Year;
                int currentMonth = DateTime.Now.Month;
                int currentDay = DateTime.Now.Day;
                Objects.con.Open();
                Objects.cmd = new SqlCommand("SELECT * FROM vw_GetAllResults WHERE (DATEPART(yy, [DATE AND TIME]) = @Year AND DATEPART(mm, [DATE AND TIME]) = @Month AND DATEPART(dd, [DATE AND TIME]) = @Day) ORDER BY ID DESC;", Objects.con);
                Objects.cmd.CommandType = CommandType.Text;
                Objects.cmd.Parameters.AddWithValue("@Year", currentYear);
                Objects.cmd.Parameters.AddWithValue("@Month", currentMonth);
                Objects.cmd.Parameters.AddWithValue("@Day", currentDay);
                Objects.da = new SqlDataAdapter();
                Objects.da.SelectCommand = Objects.cmd;
                Objects.dt = new DataTable();
                Objects.da.Fill(Objects.dt);
                if (Objects.dt.Rows.Count > 0)
                {
                    gvResults.DataSource = Objects.dt;
                    gvResults.DataBind();
                    pnlResultShowWarning.Visible = false;
                }
                else
                {
                    pnlResultShowWarning.Visible = true;
                    lblResultShowWarning.Text = "There's no any results of exams today!";
                }
            }
            catch (Exception ex)
            {
                pnlResultShowWarning.Visible = true;
                lblResultShowWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
            finally
            {
                Objects.con.Close();
                Objects.cmd.Dispose();
            }
        }
        protected void gvResults_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvResults.PageIndex = e.NewPageIndex;
            GetAllResultsToday();
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtSearch.Text == string.Empty || ddlFilter.Text == "None")
                {
                    GetAllResultsToday();
                }
                else if (ddlFilter.Text == "Exam Name")
                {
                    Objects.con.Open();
                    Objects.cmd = new SqlCommand("SELECT * FROM vw_GetAllResults WHERE [EXAM NAME] LIKE @EXAM_NAME ORDER BY ID DESC", Objects.con);
                    Objects.cmd.CommandType = CommandType.Text;
                    Objects.cmd.Parameters.AddWithValue("@EXAM_NAME", "%" + txtSearch.Text + "%");
                }
                else if (ddlFilter.Text == "Student ID No")
                {
                    Objects.con.Open();
                    Objects.cmd = new SqlCommand("SELECT * FROM vw_GetAllResults WHERE [STUDENT ID NO] LIKE @STUDENT_ID_NO ORDER BY ID DESC", Objects.con);
                    Objects.cmd.CommandType = CommandType.Text;
                    Objects.cmd.Parameters.AddWithValue("@STUDENT_ID_NO", "%" + txtSearch.Text + "%");
                }
                else if (ddlFilter.Text == "Total Question")
                {
                    Objects.con.Open();
                    Objects.cmd = new SqlCommand("SELECT * FROM vw_GetAllResults WHERE [TOTAL QUESTION] LIKE @TOTAL_QUESTION ORDER BY ID DESC", Objects.con);
                    Objects.cmd.CommandType = CommandType.Text;
                    Objects.cmd.Parameters.AddWithValue("@TOTAL_QUESTION", "%" + txtSearch.Text + "%");
                }
                else if (ddlFilter.Text == "Score")
                {
                    Objects.con.Open();
                    Objects.cmd = new SqlCommand("SELECT * FROM vw_GetAllResults WHERE SCORE LIKE @SCORE ORDER BY ID DESC", Objects.con);
                    Objects.cmd.CommandType = CommandType.Text;
                    Objects.cmd.Parameters.AddWithValue("@SCORE", "%" + txtSearch.Text + "%");
                }
                else if (ddlFilter.Text == "Status")
                {
                    Objects.con.Open();
                    Objects.cmd = new SqlCommand("SELECT * FROM vw_GetAllResults WHERE STATUS LIKE @STATUS ORDER BY ID DESC", Objects.con);
                    Objects.cmd.CommandType = CommandType.Text;
                    Objects.cmd.Parameters.AddWithValue("@STATUS", "%" + txtSearch.Text + "%");
                }
                else if (ddlFilter.Text == "Date and Time")
                {
                    Objects.con.Open();
                    Objects.cmd = new SqlCommand("SELECT * FROM vw_GetAllResults WHERE [DATE AND TIME] LIKE @DATE_AND_TIME ORDER BY ID DESC", Objects.con);
                    Objects.cmd.CommandType = CommandType.Text;
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
                        gvResults.DataSource = Objects.dt;
                        gvResults.DataBind();
                        gvResults.Visible = true;
                        pnlResultShowWarning.Visible = false;
                    }
                    else
                    {
                        gvResults.Visible = false;
                        pnlResultShowWarning.Visible = true;
                        lblResultShowWarning.Text = "Nothing found!";
                    }
                }
            }
            catch (Exception ex)
            {
                pnlResultShowWarning.Visible = true;
                lblResultShowWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
            finally
            {
                Objects.con.Close();
                Objects.cmd.Dispose();
            }
        }
        private void RetrieveStudentResults(int param_Value)
        {
            try
            {
                Objects.con.Open();
                Objects.cmd = new SqlCommand("SELECT [STUDENT ID NO] FROM vw_GetAllStudents WHERE id=@id", Objects.con);
                Objects.cmd.CommandType = CommandType.Text;
                Objects.cmd.Parameters.AddWithValue("@id", param_Value);
                string studentIdNo = Objects.cmd.ExecuteScalar().ToString();
                Objects.con.Close();
                Objects.cmd.Dispose();

                ddlFilter.Text = "Student ID No";
                txtSearch.Text = studentIdNo;

                Objects.con.Open();
                Objects.cmd = new SqlCommand("SELECT * FROM vw_GetAllResults WHERE [STUDENT ID NO] LIKE @STUDENT_ID_NO ORDER BY ID DESC", Objects.con);
                Objects.cmd.CommandType = CommandType.Text;
                Objects.cmd.Parameters.AddWithValue("@STUDENT_ID_NO", "%" + txtSearch.Text + "%");
                Objects.da = new SqlDataAdapter();
                Objects.da.SelectCommand = Objects.cmd;
                Objects.dt = new DataTable();
                Objects.da.Fill(Objects.dt);
                if (Objects.dt.Rows.Count > 0)
                {
                    gvResults.DataSource = Objects.dt;
                    gvResults.DataBind();
                    gvResults.Visible = true;
                    pnlResultShowWarning.Visible = false;
                }
                else
                {
                    gvResults.Visible = false;
                    pnlResultShowWarning.Visible = true;
                    lblResultShowWarning.Text = "Nothing found!";
                }
            }
            catch (Exception ex)
            {
                pnlResultShowWarning.Visible = true;
                lblResultShowWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
            finally
            {
                Objects.con.Close();
                Objects.cmd.Dispose();
            }
        }
    }
}