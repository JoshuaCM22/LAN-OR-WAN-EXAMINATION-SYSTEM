using System;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
namespace LAN_OR_WAN_EXAMINATION_SYSTEM.admin // Created by: Joshua C. Magoliman
{
    public partial class Form_Students : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                pnlStudentList.Visible = true;
                pnlAddStudent.Visible = false;
                btnpnlStudentList.BackColor = ColorTranslator.FromHtml("#343A40");
                btnpnlAddStudent.BackColor = ColorTranslator.FromHtml("#DC3545");
                RetrieveAllStudents();
            }
        }
        protected void btnpnlStudentList_Click(object sender, EventArgs e)
        {
            pnlStudentList.Visible = true;
            pnlAddStudent.Visible = false;
            btnpnlStudentList.BackColor = ColorTranslator.FromHtml("#343A40");
            btnpnlAddStudent.BackColor = ColorTranslator.FromHtml("#DC3545");
            RetrieveAllStudents();
        }
        protected void btnpnlAddStudent_Click(object sender, EventArgs e)
        {
            txtStudentIDNo.Focus();
            pnlStudentList.Visible = false;
            pnlAddStudent.Visible = true;
            btnpnlStudentList.BackColor = ColorTranslator.FromHtml("#DC3545");
            btnpnlAddStudent.BackColor = ColorTranslator.FromHtml("#343A40");
        }
        private void RetrieveAllStudents()
        {
            try
            {
                Objects.con.Open();
                Objects.cmd = new SqlCommand("SELECT * FROM vw_GetAllStudents WHERE [ACCOUNT STATUS]=@ACCOUNT_STATUS", Objects.con);
                Objects.cmd.CommandType = CommandType.Text;
                Objects.cmd.Parameters.AddWithValue("@ACCOUNT_STATUS", "Active");
                Objects.da = new SqlDataAdapter();
                Objects.da.SelectCommand = Objects.cmd;
                Objects.dt = new DataTable();
                Objects.da.Fill(Objects.dt);
                if (Objects.dt.Rows.Count > 0)
                {
                    gvStudentList.DataSource = Objects.dt;
                    gvStudentList.DataBind();
                    gvStudentList.Visible = true;
                    pnlStudentListShowWarning.Visible = false;
                }
                else
                {
                    gvStudentList.Visible = false;
                    pnlStudentListShowWarning.Visible = true;
                    lblStudentListShowWarning.Text = "Nothing found!";
                }
            }
            catch (Exception ex)
            {
                pnlStudentListShowWarning.Visible = true;
                lblStudentListShowWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
            finally
            {
                Objects.con.Close();
                Objects.cmd.Dispose();
            }
        }
        protected void btnAddStudent_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                if (ddlSecretQuestion.Text == "None")
                {
                    lblNoSecretQuestionFound.Visible = true;
                }
                else
                {
                    lblNoSecretQuestionFound.Visible = false;
                    CheckIfStudentIDNoExist();
                }
            }
            else
            {
                pnlAddStudentWarning.Visible = true;
                lblStudentAddWarning.Text = "You must fill all the requirements";
            }
        }
        private void CheckIfStudentIDNoExist()
        {
            try
            {
                Objects.con.Open();
                Objects.cmd = new SqlCommand("SELECT * FROM tbl_students WHERE student_id_no=@student_id_no", Objects.con);
                Objects.cmd.CommandType = CommandType.Text;
                Objects.cmd.Parameters.AddWithValue("@student_id_no", txtStudentIDNo.Text);
                Objects.dr = Objects.cmd.ExecuteReader();
                if (Objects.dr.Read() && Objects.dr.GetValue(0) != DBNull.Value)
                {
                    txtStudentIDNo.Focus();
                    pnlAddStudentWarning.Visible = true;
                    lblStudentAddWarning.Text = "This Student ID No is already exist!. Please try another Student ID No";
                    Objects.con.Close();
                    Objects.cmd.Dispose();
                }
                else
                {
                    Objects.con.Close();
                    Objects.cmd.Dispose();
                    pnlAddStudentWarning.Visible = false;
                    CheckIfEmailExist();
                }
            }
            catch (Exception ex)
            {
                pnlAddStudentWarning.Visible = true;
                lblStudentAddWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
        }
        private void CheckIfEmailExist()
        {
            try
            {
                Objects.con.Open();
                Objects.cmd = new SqlCommand("SELECT * FROM tbl_students WHERE email=@email", Objects.con);
                Objects.cmd.CommandType = CommandType.Text;
                Objects.cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                Objects.dr = Objects.cmd.ExecuteReader();
                if (Objects.dr.Read() && Objects.dr.GetValue(0) != DBNull.Value)
                {
                    txtEmail.Focus();
                    pnlAddStudentWarning.Visible = true;
                    lblStudentAddWarning.Text = "This Email is already exist!. Please try another Email";
                    Objects.con.Close();
                    Objects.cmd.Dispose();
                }
                else
                {
                    Objects.con.Close();
                    Objects.cmd.Dispose();
                    pnlAddStudentWarning.Visible = false;
                    InsertingNewStudent();
                }
            }
            catch (Exception ex)
            {
                pnlAddStudentWarning.Visible = true;
                lblStudentAddWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
        }
        private void InsertingNewStudent()
        {
            try
            {
                string passwordPlain = txtPassword.Text;
                string passwordHash = BCrypt.HashPassword(passwordPlain, BCrypt.GenerateSalt(12));
                string secretAnswerPlain = txtSecretAnswer.Text;
                string secretAnswerHash = BCrypt.HashPassword(secretAnswerPlain, BCrypt.GenerateSalt(12));
                Admin.RetrieveAdminId(Session["AdminEmail"].ToString());
                int adminIdValue = Admin.adminId;
                Objects.con.Open();
                Objects.cmd = new SqlCommand("sp_InsertNewStudent", Objects.con);
                Objects.cmd.CommandType = CommandType.StoredProcedure;
                Objects.cmd.Parameters.AddWithValue("@student_id_no", txtStudentIDNo.Text);
                Objects.cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                Objects.cmd.Parameters.AddWithValue("@password", passwordHash);
                Objects.cmd.Parameters.AddWithValue("@full_name", txtFullName.Text);
                Objects.cmd.Parameters.AddWithValue("@secret_question", ddlSecretQuestion.Text);
                Objects.cmd.Parameters.AddWithValue("@secret_answer", secretAnswerHash);
                Objects.cmd.Parameters.AddWithValue("@registered_date_time", DateTime.Now);
                Objects.cmd.Parameters.AddWithValue("@admin_id", adminIdValue);
                Objects.cmd.Parameters.AddWithValue("@account_or_exam_status_id", 1);
                int i = (int)Objects.cmd.ExecuteNonQuery();
                if (i > 0)
                {
                    Response.Redirect("~/admin/Form_Students.aspx");
                }
                else
                {
                    pnlAddStudentWarning.Visible = true;
                    lblStudentAddWarning.Text = "Something went wrong";
                }
            }
            catch (Exception ex)
            {
                pnlAddStudentWarning.Visible = true;
                lblStudentAddWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
            finally
            {
                Objects.con.Close();
                Objects.cmd.Dispose();
            }
        }
        protected void gvStudentList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvStudentList.PageIndex = e.NewPageIndex;
            RetrieveAllStudents();
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtSearch.Text == string.Empty || ddlFilter.Text == "None")
                {
                    RetrieveAllStudents();
                }
                else if (ddlFilter.Text == "Student ID No")
                {
                    Objects.con.Open();
                    Objects.cmd = new SqlCommand("SELECT * FROM vw_GetAllStudents WHERE [STUDENT ID NO] LIKE @STUDENT_ID_NO ORDER BY ID ASC", Objects.con);
                    Objects.cmd.CommandType = CommandType.Text;
                    Objects.cmd.Parameters.AddWithValue("@STUDENT_ID_NO", "%" + txtSearch.Text + "%");
                }

                else if (ddlFilter.Text == "Full Name")
                {
                    Objects.con.Open();
                    Objects.cmd = new SqlCommand("SELECT * FROM vw_GetAllStudents WHERE [FULL NAME] LIKE @FULL_NAME ORDER BY ID ASC", Objects.con);
                    Objects.cmd.CommandType = CommandType.Text;
                    Objects.cmd.Parameters.AddWithValue("@FULL_NAME", "%" + txtSearch.Text + "%");
                }
                else if (ddlFilter.Text == "Account Status")
                {
                    Objects.con.Open();
                    Objects.cmd = new SqlCommand("SELECT * FROM vw_GetAllStudents WHERE [ACCOUNT STATUS] LIKE @ACCOUNT_STATUS ORDER BY ID ASC", Objects.con);
                    Objects.cmd.CommandType = CommandType.Text;
                    Objects.cmd.Parameters.AddWithValue("@ACCOUNT_STATUS", "%" + txtSearch.Text + "%");
                }
                if (txtSearch.Text != string.Empty || ddlFilter.Text != "None")
                {
                    Objects.da = new SqlDataAdapter();
                    Objects.da.SelectCommand = Objects.cmd;
                    Objects.dt = new DataTable();
                    Objects.da.Fill(Objects.dt);
                    if (Objects.dt.Rows.Count > 0)
                    {
                        gvStudentList.DataSource = Objects.dt;
                        gvStudentList.DataBind();
                        gvStudentList.Visible = true;
                        pnlStudentListShowWarning.Visible = false;
                    }
                    else
                    {
                        gvStudentList.Visible = false;
                        pnlStudentListShowWarning.Visible = true;
                        lblStudentListShowWarning.Text = "Nothing found!";
                    }
                }
            }
            catch (Exception ex)
            {
                pnlStudentListShowWarning.Visible = true;
                lblStudentListShowWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
            finally
            {
                Objects.con.Close();
                Objects.cmd.Dispose();
            }
        }
    }
}