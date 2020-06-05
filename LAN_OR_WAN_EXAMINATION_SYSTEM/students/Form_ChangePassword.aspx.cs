using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
namespace LAN_OR_WAN_EXAMINATION_SYSTEM.students // Created by: Joshua C. Magoliman
{
    public partial class Form_ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Student.isExamIsStarted = false;
        }
        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                CheckingIfCurrentPasswordIsValid();
            }
            else
            {
                txtCurrentPassword.Focus();
                pnlChangePasswordWarning.Visible = true;
                lblChangePasswordWarning.Text = "You must fill all the requirements";
            }
        }
        private void CheckingIfCurrentPasswordIsValid()
        {
            try
            {
                Objects.con.Open();
                Objects.cmd = new SqlCommand("SELECT * FROM tbl_students WHERE id=@id", Objects.con);
                Objects.cmd.CommandType = CommandType.Text;
                Objects.cmd.Parameters.AddWithValue("@id", Student.studentId);
                Objects.dr = Objects.cmd.ExecuteReader();
                if (Objects.dr.Read() && Objects.dr.GetValue(0) != DBNull.Value)
                {
                    string hashedPassword = Objects.dr["password"].ToString();
                    string plainPassword = txtCurrentPassword.Text;
                    bool isMatch = BCrypt.CheckPassword(plainPassword, hashedPassword);
                    if (isMatch == true)
                    {
                        Objects.con.Close();
                        Objects.cmd.Dispose();
                        ChangingPassword();
                    }
                    else
                    {
                        InvalidAccount();
                    }
                }
            }
            catch (Exception ex)
            {
                pnlChangePasswordWarning.Visible = true;
                lblChangePasswordWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
        }
        private void InvalidAccount()
        {
            pnlChangePasswordWarning.Visible = true;
            lblChangePasswordWarning.Text = "Your Current Password is incorrect!</br>";
        }
        private void ChangingPassword()
        {
            try
            {
                string passwordPlain = txtConfirmNewPassword.Text;
                string passwordHash = BCrypt.HashPassword(passwordPlain, BCrypt.GenerateSalt(12));
                Objects.con.Open();
                Objects.cmd = new SqlCommand("UPDATE tbl_students SET password=@password WHERE id=@id", Objects.con);
                Objects.cmd.CommandType = System.Data.CommandType.Text;
                Objects.cmd.Parameters.Add(new SqlParameter("@password", passwordHash));
                Objects.cmd.Parameters.Add(new SqlParameter("@id", Student.studentId));
                Objects.cmd.ExecuteNonQuery();
                Objects.con.Close();
                Objects.cmd.Dispose();
                txtCurrentPassword.Focus();
                pnlChangePasswordWarning.Visible = false;
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Successfully changed your password!');   </script>");
            }
            catch (Exception ex)
            {
                txtCurrentPassword.Focus();
                pnlChangePasswordWarning.Visible = true;
                lblChangePasswordWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
        }
    }
}