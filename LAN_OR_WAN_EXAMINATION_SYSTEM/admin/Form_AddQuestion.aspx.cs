using System;
using System.Data.SqlClient;
using System.Data;
namespace LAN_OR_WAN_EXAMINATION_SYSTEM.admin // Created by: Joshua C. Magoliman
{
    public partial class Form_AddQuestion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string examId = Request.QueryString["examId"];
                if (examId == null)
                {
                    Response.Redirect("~/admin/Form_Exams.aspx");
                }
            }
        }
        protected void btnAddQuestion_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                CheckIfQuestionExist();
            }
            else
            {
                txtQuestion.Focus();
                pnlAddQuestionWarning.Visible = true;
                lblAddQuestionWarning.Text = "You must fill all the requirements";
            }
        }
        private void CheckIfQuestionExist()
        {
            try
            {
                Objects.con.Open();
                Objects.cmd = new SqlCommand("SELECT * FROM tbl_questions WHERE question=@question", Objects.con);
                Objects.cmd.CommandType = CommandType.Text;
                Objects.cmd.Parameters.AddWithValue("@question", txtQuestion.Text);
                Objects.dr = Objects.cmd.ExecuteReader();
                if (Objects.dr.Read() && Objects.dr.GetValue(0) != DBNull.Value)
                {
                    Objects.con.Close();
                    Objects.cmd.Dispose();
                    txtQuestion.Focus();
                    pnlAddQuestionWarning.Visible = true;
                    lblAddQuestionWarning.Text = "This Question is already exist!. Please try another question";
                }
                else
                {
                    Objects.con.Close();
                    Objects.cmd.Dispose();
                    pnlAddQuestionWarning.Visible = false;
                    InsertingNewQuestion();
                }
            }
            catch (Exception ex)
            {
                pnlAddQuestionWarning.Visible = true;
                lblAddQuestionWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;

            }
        }
        private void InsertingNewQuestion()
        {
            try
            {
                string examId = Request.QueryString["examId"];
                Admin.RetrieveAdminId(Session["AdminEmail"].ToString());
                int adminIdValue = Admin.adminId;
                Objects.con.Open();
                Objects.cmd = new SqlCommand("sp_InsertNewQuestion", Objects.con);
                Objects.cmd.CommandType = CommandType.StoredProcedure;
                Objects.cmd.Parameters.AddWithValue("@question", txtQuestion.Text);
                Objects.cmd.Parameters.AddWithValue("@option_one", txtOptionOne.Text);
                Objects.cmd.Parameters.AddWithValue("@option_two", txtOptionTwo.Text);
                Objects.cmd.Parameters.AddWithValue("@option_three", txtOptionThree.Text);
                Objects.cmd.Parameters.AddWithValue("@option_four", txtOptionFour.Text);
                Objects.cmd.Parameters.AddWithValue("@correct_answer", rblCorrectAnswer.SelectedValue);
                Objects.cmd.Parameters.AddWithValue("@exam_id", Convert.ToInt32(examId));
                Objects.cmd.Parameters.AddWithValue("@admin_id", adminIdValue);
                int i = Objects.cmd.ExecuteNonQuery();
                if (i > 0)
                {
                    Objects.con.Close();
                    Objects.cmd.Dispose();
                    UpdateTableExams(examId);
                }
                else
                {
                    txtQuestion.Focus();
                    pnlAddQuestionWarning.Visible = true;
                    lblAddQuestionWarning.Text = "Something went wrong";
                }
            }
            catch (Exception ex)
            {
                txtQuestion.Focus();
                pnlAddQuestionWarning.Visible = true;
                lblAddQuestionWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
        }
        private void UpdateTableExams(string param_Value)
        {
            try
            {
                Objects.con.Open();
                Objects.cmd = new SqlCommand("SELECT total_question FROM tbl_exams WHERE id=@id", Objects.con);
                Objects.cmd.CommandType = CommandType.Text;
                Objects.cmd.Parameters.AddWithValue("@id", Convert.ToInt32(param_Value));
                int totalQuestion = Convert.ToInt32(Objects.cmd.ExecuteScalar().ToString());
                Objects.con.Close();
                Objects.cmd.Dispose();
                totalQuestion = totalQuestion + 1;
                Objects.con.Open();
                Objects.cmd = new SqlCommand("UPDATE tbl_exams SET total_question = @total_question WHERE id = @id", Objects.con);
                Objects.cmd.CommandType = CommandType.Text;
                Objects.cmd.Parameters.AddWithValue("@total_question", totalQuestion);
                Objects.cmd.Parameters.AddWithValue("@id", Convert.ToInt32(param_Value));
                int x = Objects.cmd.ExecuteNonQuery();
                if (x > 0)
                {
                    Objects.con.Close();
                    Objects.cmd.Dispose();
                    Response.Redirect("../admin/Form_Exams.aspx");
                }
                else
                {
                    pnlAddQuestionWarning.Visible = true;
                    lblAddQuestionWarning.Text = "Something went wrong";
                }
            }
            catch (Exception ex)
            {
                txtQuestion.Focus();
                pnlAddQuestionWarning.Visible = true;
                lblAddQuestionWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
        }
        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/admin/Form_Exams.aspx");
        }
    }
}