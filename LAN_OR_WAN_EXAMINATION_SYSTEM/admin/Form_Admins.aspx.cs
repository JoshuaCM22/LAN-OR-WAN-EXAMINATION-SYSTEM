using System;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
namespace LAN_OR_WAN_EXAMINATION_SYSTEM.admin // Created by: Joshua C. Magoliman
{
    public partial class Form_Admins : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                pnlAdminList.Visible = true;
                pnlAddAdmin.Visible = false;
                btnpnlAdminList.BackColor = ColorTranslator.FromHtml("#343A40");
                btnpnlAddAdmin.BackColor = ColorTranslator.FromHtml("#DC3545");
                RetrieveAllAdmins();
            }
        }
        protected void btnpnlAdminList_Click(object sender, EventArgs e)
        {
            pnlAdminList.Visible = true;
            pnlAddAdmin.Visible = false;
            btnpnlAdminList.BackColor = ColorTranslator.FromHtml("#343A40");
            btnpnlAddAdmin.BackColor = ColorTranslator.FromHtml("#DC3545");
            RetrieveAllAdmins();
        }
        protected void btnpnlAddAdmin_Click(object sender, EventArgs e)
        {
            txtEmail.Focus();
            pnlAdminList.Visible = false;
            pnlAddAdmin.Visible = true;
            btnpnlAdminList.BackColor = ColorTranslator.FromHtml("#DC3545");
            btnpnlAddAdmin.BackColor = ColorTranslator.FromHtml("#343A40");
        }
        private void RetrieveAllAdmins()
        {
            try
            {
                Objects.con.Open();
                Objects.cmd = new SqlCommand("SELECT * FROM vw_GetAllAdmins WHERE [ACCOUNT STATUS]=@ACCOUNT_STATUS", Objects.con);
                Objects.cmd.CommandType = CommandType.Text;
                Objects.cmd.Parameters.AddWithValue("@ACCOUNT_STATUS", "Active");
                Objects.da = new SqlDataAdapter();
                Objects.da.SelectCommand = Objects.cmd;
                Objects.dt = new DataTable();
                Objects.da.Fill(Objects.dt);
                if (Objects.dt.Rows.Count > 0)
                {
                    gvAdminList.DataSource = Objects.dt;
                    gvAdminList.DataBind();
                    gvAdminList.Visible = true;
                    pnlAdminListShowWarning.Visible = false;
                }
                else
                {
                    gvAdminList.Visible = false;
                    pnlAdminListShowWarning.Visible = true;
                    lblAdminListShowWarning.Text = "Nothing found!";
                }
            }
            catch (Exception ex)
            {
                pnlAdminListShowWarning.Visible = true;
                lblAdminListShowWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
            finally
            {
                Objects.con.Close();
                Objects.cmd.Dispose();
            }
        }
        protected void btnAddAdmin_Click(object sender, EventArgs e)
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
                    CheckIfEmailExist();
                }
            }
            else
            {
                pnlAddAdminWarning.Visible = true;
                lblAdminAddWarning.Text = "You must fill all the requirements";
            }
        }
        private void CheckIfEmailExist()
        {
            try
            {
                Objects.con.Open();
                Objects.cmd = new SqlCommand("SELECT * FROM tbl_admins WHERE email=@email", Objects.con);
                Objects.cmd.CommandType = CommandType.Text;
                Objects.cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                Objects.dr = Objects.cmd.ExecuteReader();
                if (Objects.dr.Read() && Objects.dr.GetValue(0) != DBNull.Value)
                {
                    txtEmail.Focus();
                    pnlAddAdminWarning.Visible = true;
                    lblAdminAddWarning.Text = "This Email is already exist!. Please try another Email";
                    Objects.con.Close();
                    Objects.cmd.Dispose();
                }
                else
                {
                    Objects.con.Close();
                    Objects.cmd.Dispose();
                    pnlAddAdminWarning.Visible = false;
                    InsertingNewAdmin();
                }
            }
            catch (Exception ex)
            {
                pnlAddAdminWarning.Visible = true;
                lblAdminAddWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
        }
        private void InsertingNewAdmin()
        {
            try
            {
                string passwordPlain = txtPassword.Text;
                string passwordHash = BCrypt.HashPassword(passwordPlain, BCrypt.GenerateSalt(12));
                string secretAnswerPlain = txtSecretAnswer.Text;
                string secretAnswerHash = BCrypt.HashPassword(secretAnswerPlain, BCrypt.GenerateSalt(12));
                Objects.con.Open();
                Objects.cmd = new SqlCommand("sp_InsertNewAdmin", Objects.con);
                Objects.cmd.CommandType = CommandType.StoredProcedure;
                Objects.cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                Objects.cmd.Parameters.AddWithValue("@password", passwordHash);
                Objects.cmd.Parameters.AddWithValue("@full_name", txtFullName.Text);
                Objects.cmd.Parameters.AddWithValue("@secret_question", ddlSecretQuestion.Text);
                Objects.cmd.Parameters.AddWithValue("@secret_answer", secretAnswerHash);
                Objects.cmd.Parameters.AddWithValue("@account_or_exam_status_id", 1);
                int i = (int)Objects.cmd.ExecuteNonQuery();
                if (i > 0)
                {
                    Response.Redirect("~/admin/Form_Admins.aspx");
                }
                else
                {
                    pnlAddAdminWarning.Visible = true;
                    lblAdminAddWarning.Text = "Something went wrong";
                }
            }
            catch (Exception ex)
            {
                pnlAddAdminWarning.Visible = true;
                lblAdminAddWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
            finally
            {
                Objects.con.Close();
                Objects.cmd.Dispose();
            }
        }
        protected void gvAdminList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvAdminList.PageIndex = e.NewPageIndex;
            RetrieveAllAdmins();
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtSearch.Text == string.Empty || ddlFilter.Text == "None")
                {
                    RetrieveAllAdmins();
                }
                else if (ddlFilter.Text == "Email")
                {
                    Objects.con.Open();
                    Objects.cmd = new SqlCommand("SELECT * FROM vw_GetAllAdmins WHERE email LIKE @email ORDER BY ID ASC", Objects.con);
                    Objects.cmd.CommandType = CommandType.Text;
                    Objects.cmd.Parameters.AddWithValue("@email", "%" + txtSearch.Text + "%");
                }
                else if (ddlFilter.Text == "Full Name")
                {
                    Objects.con.Open();
                    Objects.cmd = new SqlCommand("SELECT * FROM vw_GetAllAdmins WHERE [FULL NAME] LIKE @FULL_NAME ORDER BY ID ASC", Objects.con);
                    Objects.cmd.CommandType = CommandType.Text;
                    Objects.cmd.Parameters.AddWithValue("@FULL_NAME", "%" + txtSearch.Text + "%");
                }
                else if (ddlFilter.Text == "Account Status")
                {
                    Objects.con.Open();
                    Objects.cmd = new SqlCommand("SELECT * FROM vw_GetAllAdmins WHERE [ACCOUNT STATUS] LIKE @ACCOUNT_STATUS ORDER BY ID ASC", Objects.con);
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
                        gvAdminList.DataSource = Objects.dt;
                        gvAdminList.DataBind();
                        gvAdminList.Visible = true;
                        pnlAdminListShowWarning.Visible = false;
                    }
                    else
                    {
                        gvAdminList.Visible = false;
                        pnlAdminListShowWarning.Visible = true;
                        lblAdminListShowWarning.Text = "Nothing found!";
                    }
                }
            }
            catch (Exception ex)
            {
                pnlAdminListShowWarning.Visible = true;
                lblAdminListShowWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
            finally
            {
                Objects.con.Close();
                Objects.cmd.Dispose();
            }
        }
    }
}