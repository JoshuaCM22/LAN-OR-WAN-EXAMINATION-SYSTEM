using System;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
namespace LAN_OR_WAN_EXAMINATION_SYSTEM.students // Created by: Joshua C. Magoliman
{
    public partial class Form_Question : System.Web.UI.Page
    {
        private int selectedAnswer, correctNumber, wrongNumber, result, count = 0;
        public int noOfQuestion = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string examId = Request.QueryString["examId"];
                if (examId == null)
                {
                    Response.Redirect("../students/Form_Categories.aspx");
                }
                RetrieveQuestions(Convert.ToInt32(examId));
                Student.RetrieveDurationTimeOfExam(Convert.ToInt32(examId));
            }
        }
        private void RetrieveQuestions(int param_Value)
        {
            try
            {
                Objects.con.Open();
                Objects.cmd = new SqlCommand("SELECT name FROM tbl_exams WHERE id=@id", Objects.con);
                Objects.cmd.CommandType = CommandType.Text;
                Objects.cmd.Parameters.AddWithValue("@id", param_Value);
                string examName = Objects.cmd.ExecuteScalar().ToString();
                Objects.con.Close();
                Objects.cmd.Dispose();

                Objects.con.Open();
                Objects.cmd = new SqlCommand("SELECT * FROM vw_GetAllQuestions WHERE [EXAM NAME]=@examName", Objects.con);
                Objects.cmd.CommandType = CommandType.Text;
                Objects.cmd.Parameters.AddWithValue("@examName", examName);
                Objects.dr = Objects.cmd.ExecuteReader();
                if (Objects.dr.HasRows)
                {
                    gvExamQuestion.DataSource = Objects.dr;
                    gvExamQuestion.DataBind();
                    Student.isExamIsStarted = true;
                    btnSubmit.Visible = true;
                    btnBack.Visible = false;
                }
                else
                {
                    pnlQuestionShowWarning.Visible = true;
                    lblQuestionShowWarning.Text = "Sorry! There are not created yet questions in this exam";
                    Student.isExamIsStarted = false;
                    btnSubmit.Visible = false;
                    btnBack.Visible = true;
                }
            }
            catch (Exception ex)
            {
                pnlQuestionShowWarning.Visible = true;
                lblQuestionShowWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
            finally
            {
                Objects.con.Close();
                Objects.cmd.Dispose();
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow row in this.gvExamQuestion.Rows)
            {
                Label li = row.FindControl("lblId") as Label;
                RadioButton r1 = row.FindControl("rbtnOptionOne") as RadioButton;
                RadioButton r2 = row.FindControl("rbtnOptionTwo") as RadioButton;
                RadioButton r3 = row.FindControl("rbtnOptionThree") as RadioButton;
                RadioButton r4 = row.FindControl("rbtnOptionFour") as RadioButton;
                selectedAnswer = 0;
                if (r1.Checked == true)
                {
                    selectedAnswer = 1;
                }
                else if (r2.Checked == true)
                {
                    selectedAnswer = 2;
                }
                else if (r3.Checked == true)
                {
                    selectedAnswer = 3;
                }
                else if (r4.Checked == true)
                {
                    selectedAnswer = 4;
                }
                CheckAnswer(li.Text);
                pnlQuestionShowWarning.Visible = false;
            }
            SaveExamResult(GiveResult(), correctNumber, gvExamQuestion.Rows.Count);
        }
        private void CheckAnswer(string param_Value)
        {
            try
            {
                Objects.con.Open();
                Objects.cmd = new SqlCommand("SELECT * FROM tbl_questions WHERE id=@id", Objects.con);
                Objects.cmd.CommandType = CommandType.Text;
                Objects.cmd.Parameters.AddWithValue("@id", param_Value);
                Objects.dr = Objects.cmd.ExecuteReader();
                while (Objects.dr.Read())
                {
                    if (selectedAnswer == Convert.ToInt32(Objects.dr["correct_answer"]))
                    {
                        correctNumber = correctNumber + 1;
                        break;
                    }
                    else
                    {
                        wrongNumber = wrongNumber + 1;
                        break;
                    }
                }
            }
            catch (Exception ex)
            {
                pnlQuestionShowWarning.Visible = true;
                lblQuestionShowWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
            finally
            {
                Objects.con.Close();
                Objects.cmd.Dispose();
            }
        }
        private int GiveResult()
        {
            try
            {
                string examId = Request.QueryString["examId"];
                Objects.con.Open();
                Objects.cmd = new SqlCommand("SELECT pass_mark FROM tbl_exams WHERE id=@id", Objects.con);
                Objects.cmd.CommandType = CommandType.Text;
                Objects.cmd.Parameters.AddWithValue("@id", examId);
                Objects.dr = Objects.cmd.ExecuteReader();
                while (Objects.dr.Read())
                {
                    if (correctNumber >= Convert.ToInt32(Objects.dr["pass_mark"]))
                    {
                        result = result + 1; // 1 = Pass
                        break;
                    }
                    else
                    {
                        result = result + 2; // 2 = Fail
                        break;
                    }
                }
            }
            catch (Exception ex)
            {
                pnlQuestionShowWarning.Visible = true;
                lblQuestionShowWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
            finally
            {
                Objects.con.Close();
                Objects.cmd.Dispose();
            }
            return result;
        }
        private void SaveExamResult(int param_Status, int param_Score, int param_TotalQuestion)
        {
            try
            {
                string examId = Request.QueryString["examId"];
                Objects.con.Open();
                Objects.cmd = new SqlCommand("sp_InsertNewResult", Objects.con);
                Objects.cmd.CommandType = CommandType.StoredProcedure;
                Objects.cmd.Parameters.AddWithValue("@exam_id", Convert.ToInt32(examId));
                Objects.cmd.Parameters.AddWithValue("@student_id", Student.studentId);
                Objects.cmd.Parameters.AddWithValue("@total_question", param_TotalQuestion);
                Objects.cmd.Parameters.AddWithValue("@score", param_Score);
                Objects.cmd.Parameters.AddWithValue("@result_status_id", param_Status);
                Objects.cmd.Parameters.AddWithValue("@date_and_time", DateTime.Now);
                Objects.cmd.ExecuteNonQuery();
                Student.isExamIsStarted = false;
                Response.Redirect("../students/Form_MyResult.aspx");
            }
            catch (Exception ex)
            {
                pnlQuestionShowWarning.Visible = true;
                lblQuestionShowWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
            finally
            {
                Objects.con.Close();
                Objects.cmd.Dispose();
            }
        }
    }
}