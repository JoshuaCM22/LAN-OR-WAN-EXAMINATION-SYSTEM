using System;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
namespace LAN_OR_WAN_EXAMINATION_SYSTEM.admin // Created by: Joshua C. Magoliman
{
    public partial class Form_EditSubject : System.Web.UI.Page
    {
        private string categoryName;
        private static int idOfSubject;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string subjectId = Request.QueryString["subjectId"];
                if (subjectId == null)
                {
                    Response.Redirect("~/admin/Form_Subjects.aspx");
                }
                txtSubjectEdit.Focus();
                RetrieveAllCategories();
                RetrieveSubjectEdit(Convert.ToInt32(subjectId));
            }
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string subjectId = Request.QueryString["subjectId"];
            if (IsValid)
            {
                UpdateExistingSubject();
            }
            else
            {
                txtSubjectEdit.Focus();
                pnlEditSubjectWarning.Visible = true;
                lblEditSubjectWarning.Text = "You must fill all the requirements";
            }
        }
        private void UpdateExistingSubject()
        {
            string subjectId = Request.QueryString["subjectId"];
            try
            {
                Objects.con.Open();
                Objects.cmd = new SqlCommand("sp_UpdateExistingSubject", Objects.con);
                Objects.cmd.CommandType = CommandType.StoredProcedure;
                Objects.cmd.Parameters.AddWithValue("@name", txtSubjectEdit.Text);
                Objects.cmd.Parameters.AddWithValue("@id", idOfSubject);
                int i = Objects.cmd.ExecuteNonQuery();
                if (i > 0)
                {
                    Objects.con.Close();
                    Objects.cmd.Dispose();

                    Objects.con.Open();
                    Objects.cmd = new SqlCommand("UPDATE tbl_subjects SET subject_name_id=@subject_name_id, category_id=@category_id WHERE id=@id", Objects.con);
                    Objects.cmd.Parameters.AddWithValue("@subject_name_id", idOfSubject);
                    Objects.cmd.Parameters.AddWithValue("@category_id", ddlCategoryEdit.SelectedValue);
                    Objects.cmd.Parameters.AddWithValue("@id", Convert.ToInt32(subjectId));
                    int x = Objects.cmd.ExecuteNonQuery();
                    if (x > 0)
                    {
                        Objects.con.Close();
                        Objects.cmd.Dispose();
                        pnlEditSubjectWarning.Visible = false;
                        Response.Redirect("~/admin/Form_Subjects.aspx");
                    }
                    else
                    {
                        Objects.con.Close();
                        Objects.cmd.Dispose();
                        txtSubjectEdit.Focus();
                        pnlEditSubjectWarning.Visible = true;
                        lblEditSubjectWarning.Text = "Something went wrong. Can't update. Please try after sometime later</br> ";
                    }
                }
            }
            catch (Exception ex)
            {
                pnlEditSubjectWarning.Visible = true;
                lblEditSubjectWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
        }
        private void RetrieveAllCategories()
        {
            try
            {
                Objects.con.Open();
                Objects.cmd = new SqlCommand("SELECT * FROM tbl_categories", Objects.con);
                ddlCategoryEdit.DataSource = Objects.cmd.ExecuteReader();
                ddlCategoryEdit.DataBind();
                ListItem li = new ListItem("None", "-1");
                ddlCategoryEdit.Items.Insert(0, li);
                pnlEditSubjectWarning.Visible = false;
            }
            catch (Exception ex)
            {
                txtSubjectEdit.Focus();
                pnlEditSubjectWarning.Visible = true;
                lblEditSubjectWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
            finally
            {
                Objects.con.Close();
                Objects.cmd.Dispose();
            }
        }
        private void RetrieveSubjectEdit(int param_Value)
        {
            try
            {
                Objects.con.Open();
                Objects.cmd = new SqlCommand("SELECT * FROM vw_GetAllSubjects WHERE id=@id", Objects.con);
                Objects.cmd.CommandType = CommandType.Text;
                Objects.cmd.Parameters.AddWithValue("@id", param_Value);
                Objects.dr = Objects.cmd.ExecuteReader();
                while (Objects.dr.Read())
                {
                    txtSubjectEdit.Text = Objects.dr["SUBJECT NAME"].ToString();
                    categoryName = Objects.dr["CATEGORY NAME"].ToString();
                }
                ddlCategoryEdit.Items.FindByText(categoryName).Selected = true;
                pnlEditSubjectWarning.Visible = false;
                Objects.con.Close();
                Objects.cmd.Dispose();

                Objects.con.Open();
                Objects.cmd = new SqlCommand("SELECT id FROM tbl_subject_names WHERE name=@name", Objects.con);
                Objects.cmd.CommandType = CommandType.Text;
                Objects.cmd.Parameters.AddWithValue("@name", txtSubjectEdit.Text);
                idOfSubject = Convert.ToInt32(Objects.cmd.ExecuteScalar());
                Objects.con.Close();
                Objects.cmd.Dispose();
            }
            catch (Exception ex)
            {
                pnlEditSubjectWarning.Visible = true;
                lblEditSubjectWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/admin/Form_Subjects.aspx");
        }
    }
}