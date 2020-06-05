using System;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
namespace LAN_OR_WAN_EXAMINATION_SYSTEM.admin // Created by: Joshua C. Magoliman
{
    public partial class Form_Exams : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                pnlExamList.Visible = true;
                pnlAddExam.Visible = false;
                btnpnlExamList.BackColor = ColorTranslator.FromHtml("#343A40");
                btnpnlAddExam.BackColor = ColorTranslator.FromHtml("#DC3545");
                RetrieveAllExams();
            }
        }
        private void Reset()
        {
            txtExamName.Text = "";
            txtDescription.Text = "";
            txtHours.Text = "";
            txtMinutes.Text = "";
            txtSeconds.Text = "";
            txtTotalQuestion.Text = "";
            txtPassMark.Text = "";
        }
        protected void btnpnlExamList_Click(object sender, EventArgs e)
        {
            pnlExamList.Visible = true;
            pnlAddExam.Visible = false;
            btnpnlExamList.BackColor = ColorTranslator.FromHtml("#343A40");
            btnpnlAddExam.BackColor = ColorTranslator.FromHtml("#DC3545");
            RetrieveAllExams();
            Reset();
        }
        protected void btnpnlAddExam_Click(object sender, EventArgs e)
        {
            pnlExamList.Visible = false;
            pnlAddExam.Visible = true;
            btnpnlExamList.BackColor = ColorTranslator.FromHtml("#DC3545");
            btnpnlAddExam.BackColor = ColorTranslator.FromHtml("#343A40");
            RetrieveAllCategories();
            RetrieveAllSubjects();
            Reset();
        }
        protected void btnAddExam_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                CheckIfExamNameExist();
            }
            else
            {
                ddlCategoryExam.Focus();
                pnlAddExamWarning.Visible = true;
                lblExamAddWarning.Text = "You must fill all the requirements";
            }
        }
        private void CheckIfExamNameExist()
        {
            try
            {
                Objects.con.Open();
                Objects.cmd = new SqlCommand("SELECT * FROM tbl_exams WHERE name=@name", Objects.con);
                Objects.cmd.CommandType = CommandType.Text;
                Objects.cmd.Parameters.AddWithValue("@name", txtExamName.Text);
                Objects.dr = Objects.cmd.ExecuteReader();
                if (Objects.dr.Read() && Objects.dr.GetValue(0) != DBNull.Value)
                {
                    Objects.con.Close();
                    Objects.cmd.Dispose();
                    txtExamName.Focus();
                    pnlAddExamWarning.Visible = true;
                    lblExamAddWarning.Text = "This Exam Name is already exist!. Please try another exam name";
                }
                else
                {
                    Objects.con.Close();
                    Objects.cmd.Dispose();
                    pnlAddExamWarning.Visible = false;
                    InsertingNewExam();
                }
            }
            catch (Exception ex)
            {
                pnlAddExamWarning.Visible = true;
                lblExamAddWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
        }
        private void InsertingNewExam()
        {
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
                Objects.cmd = new SqlCommand("sp_InsertNewExam", Objects.con);
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
                Objects.cmd.Parameters.AddWithValue("@account_or_exam_status_id", 1);
                int i = (int)Objects.cmd.ExecuteNonQuery();
                if (i > 0)
                {
                    Response.Redirect("~/admin/Form_Exams.aspx");
                }
                else
                {
                    txtExamName.Focus();
                    pnlAddExamWarning.Visible = true;
                    lblExamAddWarning.Text = "Something went wrong";
                }
            }
            catch (Exception ex)
            {
                txtExamName.Focus();
                pnlAddExamWarning.Visible = true;
                lblExamAddWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
            finally
            {
                Objects.con.Close();
                Objects.cmd.Dispose();
            }
        }
        protected void gvExamList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteExam")
            {
                DeleteExam(Convert.ToInt32(e.CommandArgument));
                RetrieveAllExams();
            }
        }
        protected void gvExamList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvExamList.PageIndex = e.NewPageIndex;
            RetrieveAllExams();
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
                pnlAddExamWarning.Visible = false;
            }
            catch (Exception ex)
            {
                txtExamName.Focus();
                pnlAddExamWarning.Visible = true;
                lblExamAddWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
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
                Objects.cmd = new SqlCommand("SELECT * FROM vw_GetAllSubjects", Objects.con);
                ddlSubjectExam.DataSource = Objects.cmd.ExecuteReader();
                ddlSubjectExam.DataBind();
                ListItem li = new ListItem("None", "-1");
                ddlSubjectExam.Items.Insert(0, li);
                pnlAddExamWarning.Visible = false;
            }
            catch (Exception ex)
            {
                pnlAddExamWarning.Visible = true;
                lblExamAddWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
            finally
            {
                Objects.con.Close();
                Objects.cmd.Dispose();
            }
        }
        private void RetrieveAllExams()
        {
            try
            {
                Objects.con.Open();
                Objects.cmd = new SqlCommand("SELECT * FROM vw_GetAllExams", Objects.con);
                Objects.cmd.CommandType = CommandType.Text;
                Objects.da = new SqlDataAdapter();
                Objects.da.SelectCommand = Objects.cmd;
                Objects.dt = new DataTable();
                Objects.da.Fill(Objects.dt);
                gvExamList.DataSource = Objects.dt;
                gvExamList.DataBind();
                gvExamList.Visible = true;
                pnlExamListWarning.Visible = false;
            }
            catch (Exception ex)
            {
                pnlExamListWarning.Visible = true;
                lblExamListWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
            finally
            {
                Objects.con.Close();
                Objects.cmd.Dispose();
            }
        }
        private void DeleteExam(int param_Value)
        {
            try
            {
                Objects.con.Open();
                Objects.cmd = new SqlCommand("sp_DeleteExistingExam", Objects.con);
                Objects.cmd.CommandType = CommandType.StoredProcedure;
                Objects.cmd.Parameters.AddWithValue("@id", param_Value);
                int i = (int)Objects.cmd.ExecuteNonQuery();
                if (i > 0)
                {
                    pnlExamListWarning.Visible = false;
                    Response.Redirect("~/admin/Form_Exams.aspx");
                }
                else
                {
                    pnlExamListWarning.Visible = true;
                    lblExamListWarning.Text = "Something went wrong. Can't delete now";
                }
            }
            catch (Exception ex)
            {
                pnlExamListWarning.Visible = true;
                lblExamListWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
            finally
            {
                Objects.con.Close();
                Objects.cmd.Dispose();
            }
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtSearch.Text == "")
                {
                    RetrieveAllExams();
                }
                else
                {
                    Objects.con.Open();
                    Objects.cmd = new SqlCommand("SELECT * FROM tbl_exams WHERE name LIKE @name ORDER BY ID ASC", Objects.con);
                    Objects.cmd.CommandType = CommandType.Text;
                    Objects.cmd.Parameters.AddWithValue("@name", "%" + txtSearch.Text + "%");
                    Objects.da = new SqlDataAdapter();
                    Objects.da.SelectCommand = Objects.cmd;
                    Objects.dt = new DataTable();
                    Objects.da.Fill(Objects.dt);
                    if (Objects.dt.Rows.Count > 0)
                    {
                        gvExamList.DataSource = Objects.dt;
                        gvExamList.DataBind();
                        gvExamList.Visible = true;
                        pnlExamListWarning.Visible = false;
                    }
                    else
                    {
                        gvExamList.Visible = false;
                        pnlExamListWarning.Visible = true;
                        lblExamListWarning.Text = "Nothing found!";
                    }
                }
            }
            catch (Exception ex)
            {
                pnlExamListWarning.Visible = true;
                lblExamListWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
            finally
            {
                Objects.con.Close();
                Objects.cmd.Dispose();
            }
        }
    }
}