using System;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
namespace LAN_OR_WAN_EXAMINATION_SYSTEM.admin // Created by: Joshua C. Magoliman
{
    public partial class Form_EditExam : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string examId = Request.QueryString["examId"];
            if (!IsPostBack)
            {
                if (examId == null)
                {
                    Response.Redirect("~/admin/Form_Exams.aspx");
                }
                RetrieveAllCategories();
                RetrieveAllSubjects();
                RetrieveAllStatus();
                RetrieveExamEdit(Convert.ToInt32(examId));
            }
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string examId = Request.QueryString["examId"];
            if (IsValid)
            {
                UpdateExistingExam();
            }
            else
            {
                txtExamName.Focus();
                pnlEditExamWarning.Visible = true;
                lblExamEditWarning.Text = "You must fill all the requirements";
            }
        }
        private void UpdateExistingExam()
        {
            string examId = Request.QueryString["examId"];
            try
            {
                string descriptionValue;
                if (txtDescription.Text == "")
                {
                    descriptionValue = "";
                }
                else
                {
                    descriptionValue = txtDescription.Text;
                }
                Admin.RetrieveAdminId(Session["AdminEmail"].ToString());
                int adminIdValue = Admin.adminId;
                char colon = ':';
                string durationTime = txtHours.Text + colon + txtMinutes.Text + colon + txtSeconds.Text;
                Objects.con.Open();
                Objects.cmd = new SqlCommand("sp_UpdateExistingExam", Objects.con);
                Objects.cmd.CommandType = CommandType.StoredProcedure;
                Objects.cmd.Parameters.AddWithValue("@name", txtExamName.Text);
                Objects.cmd.Parameters.AddWithValue("@description", descriptionValue);
                Objects.cmd.Parameters.AddWithValue("@duration_time", durationTime);
                Objects.cmd.Parameters.AddWithValue("@total_question", txtTotalQuestion.Text);
                Objects.cmd.Parameters.AddWithValue("@pass_mark", txtPassMark.Text);
                Objects.cmd.Parameters.AddWithValue("@category_id", ddlCategoryExam.SelectedValue);
                Objects.cmd.Parameters.AddWithValue("@subject_id", ddlSubjectExam.SelectedValue);
                Objects.cmd.Parameters.AddWithValue("@date_and_time", DateTime.Now);
                Objects.cmd.Parameters.AddWithValue("@admin_id", adminIdValue);
                Objects.cmd.Parameters.AddWithValue("@account_or_exam_status_id", ddlStatusExam.SelectedValue);
                Objects.cmd.Parameters.AddWithValue("@id", Convert.ToInt32(examId));
                int i = Objects.cmd.ExecuteNonQuery();
                if (i > 0)
                {
                    Objects.con.Close();
                    Objects.cmd.Dispose();
                    pnlEditExamWarning.Visible = false;
                    Response.Redirect("~/admin/Form_Exams.aspx");
                }
                else
                {
                    Objects.con.Close();
                    Objects.cmd.Dispose();
                    txtExamName.Focus();
                    pnlEditExamWarning.Visible = true;
                    lblExamEditWarning.Text = "Something went wrong. Can't update. Please try after sometime later</br> ";
                }
            }
            catch (Exception ex)
            {
                pnlEditExamWarning.Visible = true;
                lblExamEditWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
        }
        private void RetrieveExamEdit(int param_Value)
        {
            try
            {
                string durationTime = "";
                string categoryName = "";
                string subjectName = "";
                string statusName = "";
                Objects.con.Open();
                Objects.cmd = new SqlCommand("SELECT * FROM vw_GetAllExams WHERE id = @id", Objects.con);
                Objects.cmd.CommandType = CommandType.Text;
                Objects.cmd.Parameters.AddWithValue("@id", param_Value);
                Objects.dr = Objects.cmd.ExecuteReader();
                while (Objects.dr.Read())
                {
                    txtExamName.Text = Objects.dr["name"].ToString();
                    txtDescription.Text = Objects.dr["description"].ToString();
                    durationTime = Objects.dr["DURATION TIME"].ToString();
                    txtTotalQuestion.Text = Objects.dr["TOTAL QUESTION"].ToString();
                    txtPassMark.Text = Objects.dr["PASS MARK"].ToString();
                    subjectName = Objects.dr["SUBJECT NAME"].ToString();
                    categoryName = Objects.dr["CATEGORY NAME"].ToString();
                    statusName = Objects.dr["STATUS"].ToString();
                }
                if (subjectName != "" && categoryName != "" && statusName != "")
                {
                    ddlSubjectExam.Items.FindByText(subjectName).Selected = true;
                    ddlCategoryExam.Items.FindByText(categoryName).Selected = true;
                    ddlStatusExam.Items.FindByText(statusName).Selected = true;
                }
                if (durationTime != "")
                {
                    txtHours.Text = durationTime.Substring(0, 2);
                    txtMinutes.Text = durationTime.Substring(3, 2);
                    txtSeconds.Text = durationTime.Substring(6, 2);
                }
                pnlEditExamWarning.Visible = false;
            }
            catch (Exception ex)
            {
                pnlEditExamWarning.Visible = true;
                lblExamEditWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
            finally
            {
                Objects.con.Close();
                Objects.cmd.Dispose();
            }
        }
        private void RetrieveAllCategories()
        {
            try
            {
                Objects.con.Open();
                Objects.cmd = new SqlCommand("SELECT * FROM tbl_categories", Objects.con);
                ddlCategoryExam.DataSource = Objects.cmd.ExecuteReader();
                ddlCategoryExam.DataBind();
                ListItem li = new ListItem("None", "-1");
                ddlCategoryExam.Items.Insert(0, li);
                pnlEditExamWarning.Visible = false;
            }
            catch (Exception ex)
            {
                txtExamName.Focus();
                pnlEditExamWarning.Visible = true;
                lblExamEditWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
            finally
            {
                Objects.con.Close();
                Objects.cmd.Dispose();
            }
        }
        private void RetrieveAllSubjects()
        {
            try
            {
                Objects.con.Open();
                Objects.cmd = new SqlCommand("SELECT * FROM tbl_subject_names", Objects.con);
                ddlSubjectExam.DataSource = Objects.cmd.ExecuteReader();
                ddlSubjectExam.DataBind();
                ListItem li = new ListItem("None", "-1");
                ddlSubjectExam.Items.Insert(0, li);
                pnlEditExamWarning.Visible = false;
            }
            catch (Exception ex)
            {
                pnlEditExamWarning.Visible = true;
                lblExamEditWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
            finally
            {
                Objects.con.Close();
                Objects.cmd.Dispose();
            }
        }
        private void RetrieveAllStatus()
        {
            try
            {
                Objects.con.Open();
                Objects.cmd = new SqlCommand("SELECT * FROM tbl_account_or_exam_status", Objects.con);
                ddlStatusExam.DataSource = Objects.cmd.ExecuteReader();
                ddlStatusExam.DataBind();
                ListItem li = new ListItem("None", "-1");
                ddlStatusExam.Items.Insert(0, li);
                pnlEditExamWarning.Visible = false;
            }
            catch (Exception ex)
            {
                pnlEditExamWarning.Visible = true;
                lblExamEditWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
            finally
            {
                Objects.con.Close();
                Objects.cmd.Dispose();
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/admin/Form_Exams.aspx");
        }
    }
}