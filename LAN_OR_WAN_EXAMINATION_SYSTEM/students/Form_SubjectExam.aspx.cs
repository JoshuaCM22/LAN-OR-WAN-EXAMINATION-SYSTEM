using System;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Collections;
namespace LAN_OR_WAN_EXAMINATION_SYSTEM.students // Created by: Joshua C. Magoliman
{
    public partial class Form_SubjectExam : System.Web.UI.Page
    {
        ArrayList takenExamNameList = new ArrayList();
        ArrayList deactivatedExamNameList = new ArrayList();
        bool forLabelDeactivatedExam, forButtonTakeExam, forLabelTakenExam;
        public string examName;
        protected void Page_Load(object sender, EventArgs e)
        {
            string subjectId = Request.QueryString["subjectId"];
            if (subjectId == null)
            {
                Response.Redirect("../students/Form_CategoryItem.aspx");
            }
            GetAllDeactivatedExams();
            GetAllTakenExamOfStudent();
            ExamListing(Convert.ToInt32(subjectId));
            RetrieveSelectedSubjectName(Convert.ToInt32(subjectId));
        }
        private void GetAllDeactivatedExams()
        {
            try
            {
                Objects.con.Open();
                Objects.cmd = new SqlCommand("SELECT * FROM tbl_exams WHERE account_or_exam_status_id = @account_or_exam_status_id ORDER BY ID DESC;", Objects.con);
                Objects.cmd.CommandType = CommandType.Text;
                Objects.cmd.Parameters.AddWithValue("@account_or_exam_status_id", 2);
                Objects.dr = Objects.cmd.ExecuteReader();
                while (Objects.dr.Read())
                {
                    string result = Objects.dr["name"].ToString();
                    deactivatedExamNameList.Add(result);
                }
                Objects.con.Close();
                Objects.cmd.Dispose();
            }
            catch (Exception ex)
            {
                pnlExamShowWarning.Visible = true;
                lblExamShowWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
        }
        private void GetAllTakenExamOfStudent()
        {
            try
            {
                int currentYear = DateTime.Now.Year;
                int currentMonth = DateTime.Now.Month;
                int currentDay = DateTime.Now.Day;
                ArrayList examIdList = new ArrayList();
                Objects.con.Open();
                Objects.cmd = new SqlCommand("SELECT * FROM tbl_results WHERE student_id=@student_id AND (DATEPART(yy, date_and_time) = @Year AND DATEPART(mm, date_and_time) = @Month AND DATEPART(dd, date_and_time) = @Day) ORDER BY ID DESC;", Objects.con);
                Objects.cmd.CommandType = CommandType.Text;
                Objects.cmd.Parameters.AddWithValue("@student_id", Student.studentId);
                Objects.cmd.Parameters.AddWithValue("@Year", currentYear);
                Objects.cmd.Parameters.AddWithValue("@Month", currentMonth);
                Objects.cmd.Parameters.AddWithValue("@Day", currentDay);
                Objects.dr = Objects.cmd.ExecuteReader();
                while (Objects.dr.Read())
                {
                    int result = Convert.ToInt32(Objects.dr["exam_id"].ToString());
                    examIdList.Add(result);
                }
                Objects.con.Close();
                Objects.cmd.Dispose();

                foreach (var x in examIdList)
                {
                    Objects.con.Open();
                    Objects.cmd = new SqlCommand("SELECT name FROM tbl_exams WHERE id=@id", Objects.con);
                    Objects.cmd.CommandType = CommandType.Text;
                    Objects.cmd.Parameters.AddWithValue("@id", x);
                    string examName = Objects.cmd.ExecuteScalar().ToString();
                    Objects.con.Close();
                    Objects.cmd.Dispose();
                    takenExamNameList.Add(examName);
                }
            }
            catch (Exception ex)
            {
                pnlExamShowWarning.Visible = true;
                lblExamShowWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
        }
        private void ExamListing(int param_Value)
        {
            try
            {
                Objects.con.Open();
                Objects.cmd = new SqlCommand("SELECT name FROM tbl_subject_names WHERE id=@id", Objects.con);
                Objects.cmd.CommandType = CommandType.Text;
                Objects.cmd.Parameters.AddWithValue("@id", param_Value);
                string subjectName = Objects.cmd.ExecuteScalar().ToString();
                Objects.con.Close();
                Objects.cmd.Dispose();

                Objects.con.Open();
                Objects.cmd = new SqlCommand("SELECT * FROM vw_GetAllExams WHERE [SUBJECT NAME]=@subjectName ", Objects.con);
                Objects.cmd.CommandType = CommandType.Text;
                Objects.cmd.Parameters.AddWithValue("@subjectName", subjectName);
                Objects.dr = Objects.cmd.ExecuteReader();
                if (Objects.dr.HasRows)
                {
                    rptSujectExam.DataSource = Objects.dr;
                    rptSujectExam.DataBind();
                }
                else
                {
                    pnlExamShowWarning.Visible = true;
                    lblExamShowWarning.Text = "Sorry! There is no exam in this subject";
                }
            }
            catch (Exception ex)
            {
                pnlExamShowWarning.Visible = true;
                lblExamShowWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
            finally
            {
                Objects.con.Close();
                Objects.cmd.Dispose();
            }
        }
        protected void rptSujectExam_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item ||
                e.Item.ItemType == ListItemType.AlternatingItem)
            {
                if (deactivatedExamNameList.Contains(examName))
                {
                    forLabelDeactivatedExam = true;
                    forButtonTakeExam = false;
                    forLabelTakenExam = false;
                }
                else
                {
                    forLabelDeactivatedExam = false;
                    if (takenExamNameList.Contains(examName))
                    {
                        forButtonTakeExam = false;
                        forLabelTakenExam = true;
                    }
                    else
                    {
                        forButtonTakeExam = true;
                        forLabelTakenExam = false;
                    }
                }
                var lblDeactivatedExamName = e.Item.FindControl("lblDeactivatedNotification") as Label;
                lblDeactivatedExamName.Visible = forLabelDeactivatedExam;
                var btn = e.Item.FindControl("hlTakeExam") as HyperLink;
                btn.Visible = forButtonTakeExam;
                var lblTakenExamName = e.Item.FindControl("lblTakenNotification") as Label;
                lblTakenExamName.Visible = forLabelTakenExam;
            }
        }
        private void RetrieveSelectedSubjectName(int param_Value)
        {
            try
            {
                Objects.con.Open();
                Objects.cmd = new SqlCommand("SELECT * FROM tbl_subject_names WHERE id = @id", Objects.con);
                Objects.cmd.Parameters.AddWithValue("@id", param_Value);
                Objects.dr = Objects.cmd.ExecuteReader();
                while (Objects.dr.Read())
                {
                    lblSubjectExam.Text = Objects.dr["name"].ToString();
                }
            }
            catch (Exception ex)
            {
                pnlExamShowWarning.Visible = true;
                lblExamShowWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
            finally
            {
                Objects.con.Close();
                Objects.cmd.Dispose();
            }
        }
    }
}