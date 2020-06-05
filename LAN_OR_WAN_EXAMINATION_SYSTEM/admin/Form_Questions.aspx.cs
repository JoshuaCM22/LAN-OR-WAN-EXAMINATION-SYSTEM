using System;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
namespace LAN_OR_WAN_EXAMINATION_SYSTEM.admin // Created by: Joshua C. Magoliman
{
    public partial class Form_Questions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            RetrieveAllQuestions();
        }
        private void RetrieveAllQuestions()
        {
            try
            {
                Objects.con.Open();
                Objects.cmd = new SqlCommand("SELECT * FROM vw_GetAllQuestions", Objects.con);
                Objects.cmd.CommandType = CommandType.Text;
                Objects.da = new SqlDataAdapter();
                Objects.da.SelectCommand = Objects.cmd;
                Objects.dt = new DataTable();
                Objects.da.Fill(Objects.dt);
                gvExamQuestionList.DataSource = Objects.dt;
                gvExamQuestionList.DataBind();
                gvExamQuestionList.Visible = true;
                pnlExamQuestionWarning.Visible = false;
            }
            catch (Exception ex)
            {
                pnlExamQuestionWarning.Visible = true;
                lblExamQuestionWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
            finally
            {
                Objects.con.Close();
                Objects.cmd.Dispose();
            }
        }
        private void DeleteQuestion(int param_Value)
        {
            try
            {
                Objects.con.Open();
                Objects.cmd = new SqlCommand("sp_DeleteExistingQuestion", Objects.con);
                Objects.cmd.CommandType = CommandType.StoredProcedure;
                Objects.cmd.Parameters.AddWithValue("@id", param_Value);
                int i = (int)Objects.cmd.ExecuteNonQuery();
                if (i > 0)
                {
                    Objects.con.Close();
                    Objects.cmd.Dispose();
                    Response.Redirect("../admin/Form_Questions.aspx");
                }
                else
                {
                    pnlExamQuestionWarning.Visible = true;
                    lblExamQuestionWarning.Text = "Something went wrong. Can't delete now";
                }
            }
            catch (Exception ex)
            {
                pnlExamQuestionWarning.Visible = true;
                lblExamQuestionWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
        }
        private void UpdateTableExams(int param_Value)
        {
            try
            {
                Objects.con.Open();
                Objects.cmd = new SqlCommand("SELECT exam_id FROM tbl_questions WHERE id=@id", Objects.con);
                Objects.cmd.CommandType = CommandType.Text;
                Objects.cmd.Parameters.AddWithValue("@id", param_Value);
                int examId = Convert.ToInt32(Objects.cmd.ExecuteScalar().ToString());
                Objects.con.Close();
                Objects.cmd.Dispose();

                Objects.con.Open();
                Objects.cmd = new SqlCommand("SELECT total_question FROM tbl_exams WHERE id=@id", Objects.con);
                Objects.cmd.CommandType = CommandType.Text;
                Objects.cmd.Parameters.AddWithValue("@id", examId);
                int totalQuestion = Convert.ToInt32(Objects.cmd.ExecuteScalar().ToString());
                Objects.con.Close();
                Objects.cmd.Dispose();

                if (totalQuestion != 0)
                {
                    totalQuestion = totalQuestion - 1;
                }

                Objects.con.Open();
                Objects.cmd = new SqlCommand("UPDATE tbl_exams SET total_question=@total_question WHERE id=@id", Objects.con);
                Objects.cmd.CommandType = CommandType.Text;
                Objects.cmd.Parameters.AddWithValue("@total_question", totalQuestion);
                Objects.cmd.Parameters.AddWithValue("@id", examId);
                int x = Objects.cmd.ExecuteNonQuery();
                if (x > 0)
                {
                    Objects.con.Close();
                    Objects.cmd.Dispose();
                    DeleteQuestion(param_Value);
                }
                else
                {
                    Objects.con.Close();
                    Objects.cmd.Dispose();
                    pnlExamQuestionWarning.Visible = true;
                    lblExamQuestionWarning.Text = "Something went wrong. Can't delete now";
                }
            }
            catch (Exception ex)
            {
                pnlExamQuestionWarning.Visible = true;
                lblExamQuestionWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
        }
        protected void gvExamQuestionList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteQuestion")
            {
                UpdateTableExams(Convert.ToInt32(e.CommandArgument));
                RetrieveAllQuestions();
            }
        }
        protected void gvExamQuestionList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvExamQuestionList.PageIndex = e.NewPageIndex;
            RetrieveAllQuestions();
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtSearch.Text == string.Empty || ddlFilter.Text == "None")
                {
                    RetrieveAllQuestions();
                }
                else if (ddlFilter.Text == "Exam Name")
                {
                    Objects.con.Open();
                    Objects.cmd = new SqlCommand("SELECT * FROM vw_GetAllQuestions WHERE [EXAM NAME] LIKE @EXAM_NAME ORDER BY ID ASC", Objects.con);
                    Objects.cmd.CommandType = CommandType.Text;
                    Objects.cmd.Parameters.AddWithValue("@EXAM_NAME", "%" + txtSearch.Text + "%");
                }
                else if (ddlFilter.Text == "Question")
                {
                    Objects.con.Open();
                    Objects.cmd = new SqlCommand("SELECT * FROM vw_GetAllQuestions WHERE question LIKE @question ORDER BY ID ASC", Objects.con);
                    Objects.cmd.CommandType = CommandType.Text;
                    Objects.cmd.Parameters.AddWithValue("@question", "%" + txtSearch.Text + "%");
                }
                if (txtSearch.Text != string.Empty || ddlFilter.Text != "None")
                {
                    Objects.da = new SqlDataAdapter();
                    Objects.da.SelectCommand = Objects.cmd;
                    Objects.dt = new DataTable();
                    Objects.da.Fill(Objects.dt);
                    if (Objects.dt.Rows.Count > 0)
                    {
                        gvExamQuestionList.DataSource = Objects.dt;
                        gvExamQuestionList.DataBind();
                        gvExamQuestionList.Visible = true;
                        pnlExamQuestionWarning.Visible = false;
                    }
                    else
                    {
                        gvExamQuestionList.Visible = false;
                        pnlExamQuestionWarning.Visible = true;
                        lblExamQuestionWarning.Text = "Nothing found!";
                    }
                }
            }
            catch (Exception ex)
            {
                pnlExamQuestionWarning.Visible = true;
                lblExamQuestionWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
            finally
            {
                Objects.con.Close();
                Objects.cmd.Dispose();
            }
        }
    }
}