using System;
using System.Data.SqlClient;
using System.Web.UI;
namespace LAN_OR_WAN_EXAMINATION_SYSTEM.admin // Created by: Joshua C. Magoliman
{
    public partial class Form_SetANewPassword : System.Web.UI.Page
    {
        public static int adminId;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                ChangingPassword();
            }
        }
        private void ChangingPassword()
        {
            try
            {
                string passwordPlain = txtConfirmNewPassword.Text;
                string passwordHash = BCrypt.HashPassword(passwordPlain, BCrypt.GenerateSalt(12));
                Objects.con.Open();
                Objects.cmd = new SqlCommand("UPDATE tbl_admins SET password=@password WHERE id=@id", Objects.con);
                Objects.cmd.CommandType = System.Data.CommandType.Text;
                Objects.cmd.Parameters.Add(new SqlParameter("@password", passwordHash));
                Objects.cmd.Parameters.Add(new SqlParameter("@id", adminId));
                Objects.cmd.ExecuteNonQuery();
                Objects.con.Close();
                Objects.cmd.Dispose();
                pnlWarning.Visible = false;
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Successfully set a new password for your account!');   </script>");
                Response.Redirect("../admin/Default.aspx");
            }
            catch (Exception ex)
            {
                txtNewPassword.Focus();
                pnlWarning.Visible = true;
                lblWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
        }
        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("../admin/Form_ForgotPassword.aspx");
        }
    }
}