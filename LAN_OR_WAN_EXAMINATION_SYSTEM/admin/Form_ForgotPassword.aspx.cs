using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
namespace LAN_OR_WAN_EXAMINATION_SYSTEM.admin // Created by: Joshua C. Magoliman
{
    public partial class Form_ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblNoSecretQuestionFound.Visible = false;
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                if (ddlSecretQuestion.Text == "None")
                {
                    lblNoSecretQuestionFound.Visible = true;
                }
                else
                {
                    Checking();
                }
            }
        }
        private void Checking()
        {
            try
            {
                Objects.con.Open();
                Objects.cmd = new SqlCommand("SELECT * FROM tbl_admins WHERE email=@email AND secret_question=@secret_question", Objects.con);
                Objects.cmd.CommandType = CommandType.Text;
                Objects.cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                Objects.cmd.Parameters.AddWithValue("@secret_question", ddlSecretQuestion.Text);
                Objects.dr = Objects.cmd.ExecuteReader();
                if (Objects.dr.Read() && Objects.dr.GetValue(0) != DBNull.Value)
                {
                    string hashedSecretAnswer = Objects.dr["secret_answer"].ToString();
                    string plainSecretAnswer = txtSecretAnswer.Text;
                    bool isMatch = BCrypt.CheckPassword(plainSecretAnswer, hashedSecretAnswer);
                    if (isMatch == true)
                    {
                        Form_SetANewPassword.adminId = Convert.ToInt32(Objects.dr["id"].ToString());
                        Objects.con.Close();
                        Objects.dr.Close();
                        Response.Redirect("../admin/Form_SetANewPassword.aspx");
                    }
                    else
                    {
                        Objects.dr.Close();
                        Objects.con.Close();
                        InvalidAccount();
                    }
                }
                else
                {
                    Objects.dr.Close();
                    Objects.con.Close();
                    InvalidAccount();
                }
            }
            catch (Exception ex)
            {
                panelWarning.Visible = true;
                lblWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
        }
        private void InvalidAccount()
        {
            panelWarning.Visible = true;
            lblWarning.Text = "Your account details is incorrect!";
        }
        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("../admin/Default.aspx");
        }
        protected void txtEmail_TextChanged(object sender, EventArgs e)
        {
            RetrieveSecretQuestionOfStudent();
        }
        private void RetrieveSecretQuestionOfStudent()
        {
            try
            {
                Objects.con.Open();
                Objects.cmd = new SqlCommand("SELECT * FROM tbl_admins WHERE email=@email", Objects.con);
                Objects.cmd.CommandType = System.Data.CommandType.Text;
                Objects.cmd.Parameters.Add(new SqlParameter("@email", txtEmail.Text));
                Objects.dr = Objects.cmd.ExecuteReader();
                if (Objects.dr.Read() && Objects.dr.GetValue(0) != DBNull.Value)
                {
                    ddlSecretQuestion.Text = Objects.dr["secret_question"].ToString();
                    Objects.con.Close();
                    Objects.cmd.Dispose();
                }
                else
                {
                    ddlSecretQuestion.Text = "None";
                    Objects.con.Close();
                    Objects.cmd.Dispose();
                }
            }
            catch (Exception ex)
            {
                panelWarning.Visible = true;
                lblWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
        }
    }
}