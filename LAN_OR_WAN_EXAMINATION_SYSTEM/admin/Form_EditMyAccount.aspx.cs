using System;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
namespace LAN_OR_WAN_EXAMINATION_SYSTEM.admin // Created by: Joshua C. Magoliman
{
    public partial class Form_EditMyAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Admin.RetrieveAdminId(Session["AdminEmail"].ToString());
            int accountId = Admin.adminId;
            if (!IsPostBack)
            {
                if (accountId == null)
                {
                    Response.Redirect("~/admin/Form_Dashboard.aspx");
                }
                RetrieveAllStatus();
                RetrieveMyAccountEdit(Convert.ToInt32(accountId));
            }
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string accountId = Request.QueryString["accountId"];
            if (IsValid)
            {
                if (ddlSecretQuestion.Text == "None")
                {
                    lblNoSecretQuestionFound.Visible = true;
                }
                else
                {
                    lblNoSecretQuestionFound.Visible = false;
                    UpdateMyAccount();
                }
            }
            else
            {
                pnlEditMyAccountWarning.Visible = true;
                lblEditMyAccountWarning.Text = "You must fill all the requirements";
            }
        }
        private void UpdateMyAccount()
        {
            try
            {
                Admin.RetrieveAdminId(Session["AdminEmail"].ToString());
                int accountId = Admin.adminId;
                string passwordPlain, passwordHash;
                if (txtPassword.Text != "")
                {
                    passwordPlain = txtPassword.Text;
                    passwordHash = BCrypt.HashPassword(passwordPlain, BCrypt.GenerateSalt(12));
                }
                else
                {
                    passwordHash = "";
                }
                string secretAnswerPlain, secretAnswerHash;
                if (txtSecretAnswer.Text != "")
                {
                    secretAnswerPlain = txtSecretAnswer.Text;
                    secretAnswerHash = BCrypt.HashPassword(secretAnswerPlain, BCrypt.GenerateSalt(12));
                }
                else
                {
                    secretAnswerHash = "";
                }
                Admin.RetrieveAdminId(Session["AdminEmail"].ToString());
                int adminIdValue = Admin.adminId;
                Objects.con.Open();
                Objects.cmd = new SqlCommand("sp_UpdateMyAccount", Objects.con);
                Objects.cmd.CommandType = CommandType.StoredProcedure;
                Objects.cmd.Parameters.AddWithValue("@password", passwordHash);
                Objects.cmd.Parameters.AddWithValue("@full_name", txtFullName.Text);
                Objects.cmd.Parameters.AddWithValue("@secret_question", ddlSecretQuestion.Text);
                Objects.cmd.Parameters.AddWithValue("@secret_answer", secretAnswerHash);
                Objects.cmd.Parameters.AddWithValue("@account_or_exam_status_id", ddlAccountStatus.SelectedValue);
                Objects.cmd.Parameters.AddWithValue("@id", accountId);
                int i = Objects.cmd.ExecuteNonQuery();
                if (i > 0)
                {
                    Objects.con.Close();
                    Objects.cmd.Dispose();
                    pnlEditMyAccountWarning.Visible = false;
                    Response.Redirect("~/admin/Form_Dashboard.aspx");
                }
                else
                {
                    Objects.con.Close();
                    Objects.cmd.Dispose();
                    pnlEditMyAccountWarning.Visible = true;
                    lblEditMyAccountWarning.Text = "Something went wrong. Can't update. Please try after sometime later</br> ";
                }
            }
            catch (Exception ex)
            {
                pnlEditMyAccountWarning.Visible = true;
                lblEditMyAccountWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/admin/Form_Dashboard.aspx");
        }
        private void RetrieveMyAccountEdit(int param_Value)
        {
            try
            {
                string secretQuestion = "";
                string accountStatus = "";
                Objects.con.Open();
                Objects.cmd = new SqlCommand("SELECT * FROM vw_GetAllAdmins WHERE id=@id", Objects.con);
                Objects.cmd.CommandType = CommandType.Text;
                Objects.cmd.Parameters.AddWithValue("@id", param_Value);
                Objects.dr = Objects.cmd.ExecuteReader();
                while (Objects.dr.Read())
                {
                    txtEmail.Text = Objects.dr["email"].ToString();
                    txtFullName.Text = Objects.dr["FULL NAME"].ToString();
                    secretQuestion = Objects.dr["SECRET QUESTION"].ToString();
                    accountStatus = Objects.dr["ACCOUNT STATUS"].ToString();
                }
                ddlSecretQuestion.Items.FindByText(secretQuestion).Selected = true;
                ddlAccountStatus.Items.FindByText(accountStatus).Selected = true;
                pnlEditMyAccountWarning.Visible = false;
                Objects.con.Close();
                Objects.cmd.Dispose();
            }
            catch (Exception ex)
            {
                pnlEditMyAccountWarning.Visible = true;
                lblEditMyAccountWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
        }
        private void RetrieveAllStatus()
        {
            try
            {
                Objects.con.Open();
                Objects.cmd = new SqlCommand("SELECT * FROM tbl_account_or_exam_status", Objects.con);
                ddlAccountStatus.DataSource = Objects.cmd.ExecuteReader();
                ddlAccountStatus.DataBind();
                ListItem li = new ListItem("None", "-1");
                ddlAccountStatus.Items.Insert(0, li);
                pnlEditMyAccountWarning.Visible = false;
            }
            catch (Exception ex)
            {
                pnlEditMyAccountWarning.Visible = true;
                lblEditMyAccountWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
            finally
            {
                Objects.con.Close();
                Objects.cmd.Dispose();
            }
        }
    }
}