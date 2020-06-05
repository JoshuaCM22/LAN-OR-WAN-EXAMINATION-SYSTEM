using System;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
namespace LAN_OR_WAN_EXAMINATION_SYSTEM.admin // Created by: Joshua C. Magoliman
{
    public partial class Form_EditQuestion : System.Web.UI.Page
    {
        private string examName;
        protected void Page_Load(object sender, EventArgs e)
        {
            string questionId = Request.QueryString["questionId"];
            if (!IsPostBack)
            {
                if (questionId == null)
                {
                    Response.Redirect("~/admin/Form_Questions.aspx");
                }
                RetrieveAllExamNames();
                RetrieveQuestionEdit(Convert.ToInt32(questionId));
            }
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string questionId = Request.QueryString["questionId"];
            if (IsValid)
            {
                UpdateExistingQuestion();
            }
            else
            {
                txtEditQuestion.Focus();
                pnlEditQuestionWarning.Visible = true;
                lblEditQuestionWarning.Text = "You must fill all the requirements";
            }
        }
        private void UpdateExistingQuestion()
        {
            try
            {
                string questionId = Request.QueryString["questionId"];
                Admin.RetrieveAdminId(Session["AdminEmail"].ToString());
                int adminIdValue = Admin.adminId;
                Objects.con.Open();
                Objects.cmd = new SqlCommand("sp_UpdateExistingQuestion", Objects.con);
                Objects.cmd.CommandType = CommandType.StoredProcedure;
                Objects.cmd.Parameters.AddWithValue("@question", txtEditQuestion.Text);
                Objects.cmd.Parameters.AddWithValue("@option_one", txtEditOptionOne.Text);
                Objects.cmd.Parameters.AddWithValue("@option_two", txtEditOptionTwo.Text);
                Objects.cmd.Parameters.AddWithValue("@option_three", txtEditOptionThree.Text);
                Objects.cmd.Parameters.AddWithValue("@option_four", txtEditOptionFour.Text);
                Objects.cmd.Parameters.AddWithValue("@correct_answer", rblEditCorrectAnswer.SelectedValue);
                Objects.cmd.Parameters.AddWithValue("@exam_id", ddlEditExam.SelectedValue);
                Objects.cmd.Parameters.AddWithValue("@admin_id", adminIdValue);
                Objects.cmd.Parameters.AddWithValue("@id", Convert.ToInt32(questionId));
                int i = Objects.cmd.ExecuteNonQuery();
                if (i > 0)
                {
                    Objects.con.Close();
                    Objects.cmd.Dispose();
                    pnlEditQuestionWarning.Visible = false;
                    Response.Redirect("~/admin/Form_Questions.aspx");
                }
                else
                {
                    Objects.con.Close();
                    Objects.cmd.Dispose();
                    txtEditQuestion.Focus();
                    pnlEditQuestionWarning.Visible = true;
                    lblEditQuestionWarning.Text = "Something went wrong. Can't update. Please try after sometime later</br> ";
                }
            }
            catch (Exception ex)
            {
                pnlEditQuestionWarning.Visible = true;
                lblEditQuestionWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/admin/Form_Questions.aspx");
        }
        private void RetrieveQuestionEdit(int param_Value)
        {
            try
            {
                Objects.con.Open();
                Objects.cmd = new SqlCommand("SELECT * FROM vw_GetAllQuestions WHERE id=@id", Objects.con);
                Objects.cmd.CommandType = CommandType.Text;
                Objects.cmd.Parameters.AddWithValue("@id", param_Value);
                Objects.dr = Objects.cmd.ExecuteReader();
                while (Objects.dr.Read())
                {
                    examName = Objects.dr["EXAM NAME"].ToString();
                    txtEditQuestion.Text = Objects.dr["QUESTION"].ToString();
                    txtEditOptionOne.Text = Objects.dr["OPTION ONE"].ToString();
                    txtEditOptionTwo.Text = Objects.dr["OPTION TWO"].ToString();
                    txtEditOptionThree.Text = Objects.dr["OPTION THREE"].ToString();
                    txtEditOptionFour.Text = Objects.dr["OPTION FOUR"].ToString();
                    rblEditCorrectAnswer.SelectedValue = Objects.dr["CORRECT ANSWER"].ToString();
                }
                ddlEditExam.Items.FindByText(examName).Selected = true;
                pnlEditQuestionWarning.Visible = false;
                Objects.con.Close();
                Objects.cmd.Dispose();
            }
            catch (Exception ex)
            {
                pnlEditQuestionWarning.Visible = true;
                lblEditQuestionWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
        }
        private void RetrieveAllExamNames()
        {
            try
            {
                Objects.con.Open();
                Objects.cmd = new SqlCommand("SELECT * FROM tbl_exams", Objects.con);
                ddlEditExam.DataSource = Objects.cmd.ExecuteReader();
                ddlEditExam.DataBind();
                ListItem li = new ListItem("None", "-1");
                ddlEditExam.Items.Insert(0, li);
                pnlEditQuestionWarning.Visible = false;
            }
            catch (Exception ex)
            {
                ddlEditExam.Focus();
                pnlEditQuestionWarning.Visible = true;
                lblEditQuestionWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
            finally
            {
                Objects.con.Close();
                Objects.cmd.Dispose();
            }
        }
    }
}