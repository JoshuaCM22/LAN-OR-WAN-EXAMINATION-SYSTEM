using System;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
namespace LAN_OR_WAN_EXAMINATION_SYSTEM.admin // Created by: Joshua C. Magoliman
{
    public partial class Form_EditAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string adminId = Request.QueryString["adminId"];
            if (!IsPostBack)
            {
                if (adminId == null)
                {
                    Response.Redirect("~/admin/Form_Admins.aspx");
                }
                RetrieveAllStatus();
                RetrieveAdminEdit(Convert.ToInt32(adminId));
            }
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string adminId = Request.QueryString["adminId"];
            if (IsValid)
            {
                UpdateExistingAdmin();
            }
            else
            {
                pnlEditAdminWarning.Visible = true;
                lblEditAdminWarning.Text = "You must fill all the requirements";
            }
        }
        private void UpdateExistingAdmin()
        {
            try
            {
                int adminId = Convert.ToInt32(Request.QueryString["adminId"]);
                Objects.con.Open();
                Objects.cmd = new SqlCommand("sp_UpdateExistingAdmin", Objects.con);
                Objects.cmd.CommandType = CommandType.StoredProcedure;
                Objects.cmd.Parameters.AddWithValue("@account_or_exam_status_id", ddlAccountStatus.SelectedValue);
                Objects.cmd.Parameters.AddWithValue("@id", adminId);
                int i = Objects.cmd.ExecuteNonQuery();
                if (i > 0)
                {
                    Objects.con.Close();
                    Objects.cmd.Dispose();
                    pnlEditAdminWarning.Visible = false;
                    Response.Redirect("~/admin/Form_Admins.aspx");
                }
                else
                {
                    Objects.con.Close();
                    Objects.cmd.Dispose();
                    pnlEditAdminWarning.Visible = true;
                    lblEditAdminWarning.Text = "Something went wrong. Can't update. Please try after sometime later</br> ";
                }
            }
            catch (Exception ex)
            {
                pnlEditAdminWarning.Visible = true;
                lblEditAdminWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/admin/Form_Admins.aspx");
        }
        private void RetrieveAdminEdit(int param_Value)
        {
            try
            {
                string accountStatus = "";
                Objects.con.Open();
                Objects.cmd = new SqlCommand("SELECT * FROM vw_GetAllAdmins WHERE id=@id", Objects.con);
                Objects.cmd.CommandType = CommandType.Text;
                Objects.cmd.Parameters.AddWithValue("@id", param_Value);
                Objects.dr = Objects.cmd.ExecuteReader();
                while (Objects.dr.Read())
                {
                    txtEmail.Text = Objects.dr["email"].ToString();
                    accountStatus = Objects.dr["ACCOUNT STATUS"].ToString();
                }
                ddlAccountStatus.Items.FindByText(accountStatus).Selected = true;
                pnlEditAdminWarning.Visible = false;
                Objects.con.Close();
                Objects.cmd.Dispose();
            }
            catch (Exception ex)
            {
                pnlEditAdminWarning.Visible = true;
                lblEditAdminWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
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
                pnlEditAdminWarning.Visible = false;
            }
            catch (Exception ex)
            {
                pnlEditAdminWarning.Visible = true;
                lblEditAdminWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
            finally
            {
                Objects.con.Close();
                Objects.cmd.Dispose();
            }
        }
    }
}