using System;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Data.SqlClient;
using System.Data;
namespace LAN_OR_WAN_EXAMINATION_SYSTEM.admin // Created by: Joshua C. Magoliman
{
    public partial class Form_Subjects : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                pnlSubjectList.Visible = true;
                pnlAddSubject.Visible = false;
                btnpnlSubjectList.BackColor = ColorTranslator.FromHtml("#343A40");
                btnpnlAddSubject.BackColor = ColorTranslator.FromHtml("#DC3545");
                RetrieveAllSubjects();
            }
        }
        protected void btnpnlSubjectList_Click(object sender, EventArgs e)
        {
            pnlSubjectList.Visible = true;
            pnlAddSubject.Visible = false;
            btnpnlSubjectList.BackColor = ColorTranslator.FromHtml("#343A40");
            btnpnlAddSubject.BackColor = ColorTranslator.FromHtml("#DC3545");
            RetrieveAllSubjects();
        }
        protected void btnpnlAddSubject_Click(object sender, EventArgs e)
        {
            pnlSubjectList.Visible = false;
            pnlAddSubject.Visible = true;
            btnpnlSubjectList.BackColor = ColorTranslator.FromHtml("#DC3545");
            btnpnlAddSubject.BackColor = ColorTranslator.FromHtml("#343A40");
            RetrieveAllCategories();
        }
        protected void btnAddSubject_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                CheckIfSubjectNameExist();
            }
            else
            {
                txtSubject.Focus();
                pnlAddSubjectWarning.Visible = true;
                lblAddSubjectWarning.Text = "You must fill all the requirements";
            }
        }
        private void CheckIfSubjectNameExist()
        {
            try
            {
                Objects.con.Open();
                Objects.cmd = new SqlCommand("SELECT * FROM tbl_subject_names WHERE name=@name", Objects.con);
                Objects.cmd.CommandType = CommandType.Text;
                Objects.cmd.Parameters.AddWithValue("@name", txtSubject.Text);
                Objects.dr = Objects.cmd.ExecuteReader();
                if (Objects.dr.Read() && Objects.dr.GetValue(0) != DBNull.Value)
                {
                    Objects.con.Close();
                    Objects.cmd.Dispose();
                    txtSubject.Focus();
                    pnlAddSubjectWarning.Visible = true;
                    lblAddSubjectWarning.Text = "This Subject Name is already exist!. Please try another subject name";
                }
                else
                {
                    Objects.con.Close();
                    Objects.cmd.Dispose();
                    pnlAddSubjectWarning.Visible = false;
                    InsertingNewSubject();
                }
            }
            catch (Exception ex)
            {
                pnlAddSubjectWarning.Visible = true;
                lblAddSubjectWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;

            }
        }
        private void InsertingNewSubject()
        {
            try
            {
                Objects.con.Open();
                Objects.cmd = new SqlCommand("sp_InsertNewSubject", Objects.con);
                Objects.cmd.CommandType = CommandType.StoredProcedure;
                Objects.cmd.Parameters.AddWithValue("@name", txtSubject.Text);
                int i = Objects.cmd.ExecuteNonQuery();
                if (i > 0)
                {
                    Objects.con.Close();
                    Objects.cmd.Dispose();

                    Objects.con.Open();
                    Objects.cmd = new SqlCommand("SELECT id FROM tbl_subject_names WHERE name=@name", Objects.con);
                    Objects.cmd.CommandType = CommandType.Text;
                    Objects.cmd.Parameters.AddWithValue("@name", txtSubject.Text);
                    int idOfSubject = Convert.ToInt32(Objects.cmd.ExecuteScalar());
                    Objects.con.Close();
                    Objects.cmd.Dispose();

                    Objects.con.Open();
                    Objects.cmd = new SqlCommand("INSERT INTO tbl_subjects (subject_name_id, category_id) VALUES (@subject_name_id,@category_id)", Objects.con);
                    Objects.cmd.Parameters.AddWithValue("@subject_name_id", idOfSubject);
                    Objects.cmd.Parameters.AddWithValue("@category_id", ddlCategory.SelectedValue);
                    int x = Objects.cmd.ExecuteNonQuery();
                    if (x > 0)
                    {
                        Objects.con.Close();
                        Objects.cmd.Dispose();
                        pnlAddSubjectWarning.Visible = false;
                        txtSubject.Text = string.Empty;
                        Response.Redirect("~/admin/Form_Subjects.aspx");
                    }
                    else
                    {
                        Objects.con.Close();
                        Objects.cmd.Dispose();
                        txtSubject.Focus();
                        pnlAddSubjectWarning.Visible = true;
                        lblAddSubjectWarning.Text = "Try again. Subject is not added";
                    }
                }
            }
            catch (Exception ex)
            {
                pnlAddSubjectWarning.Visible = true;
                lblAddSubjectWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
        }
        protected void gvSubjectList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteRow")
            {
                DeleteSubject(Convert.ToString(e.CommandArgument));
                RetrieveAllSubjects();
            }
        }
        protected void gvSubjectList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvSubjectList.PageIndex = e.NewPageIndex;
            RetrieveAllSubjects();
        }
        private void RetrieveAllCategories()
        {
            try
            {
                Objects.con.Open();
                Objects.cmd = new SqlCommand("SELECT * FROM tbl_categories", Objects.con);
                ddlCategory.DataSource = Objects.cmd.ExecuteReader();
                ddlCategory.DataBind();
                ListItem li = new ListItem("None", "-1");
                ddlCategory.Items.Insert(0, li);
                pnlAddSubjectWarning.Visible = false;
            }
            catch (Exception ex)
            {
                txtSubject.Focus();
                pnlAddSubjectWarning.Visible = true;
                lblAddSubjectWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
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
                Objects.cmd.CommandType = CommandType.Text;
                Objects.da = new SqlDataAdapter();
                Objects.da.SelectCommand = Objects.cmd;
                Objects.dt = new DataTable();
                Objects.da.Fill(Objects.dt);
                gvSubjectList.DataSource = Objects.dt;
                gvSubjectList.DataBind();
                gvSubjectList.Visible = true;
                pnlSubjectListWarning.Visible = false;
            }
            catch (Exception ex)
            {
                pnlSubjectListWarning.Visible = true;
                lblSubjectListWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
            finally
            {
                Objects.con.Close();
                Objects.cmd.Dispose();
            }
        }
        private void DeleteSubject(string param_Value)
        {
            try
            {
                Objects.con.Open();
                Objects.cmd = new SqlCommand("SELECT id FROM tbl_subject_names WHERE name=@name", Objects.con);
                Objects.cmd.CommandType = CommandType.Text;
                Objects.cmd.Parameters.AddWithValue("@name", param_Value);
                int idOfSubject = Convert.ToInt32(Objects.cmd.ExecuteScalar());
                Objects.con.Close();
                Objects.cmd.Dispose();

                Objects.con.Open();
                Objects.cmd = new SqlCommand("sp_DeleteExistingSubject", Objects.con);
                Objects.cmd.CommandType = CommandType.StoredProcedure;
                Objects.cmd.Parameters.AddWithValue("@id", idOfSubject);
                int i = (int)Objects.cmd.ExecuteNonQuery();
                if (i > 0)
                {
                    pnlSubjectListWarning.Visible = false;
                    Response.Redirect("~/admin/Form_Subjects.aspx");
                }
                else
                {
                    pnlSubjectListWarning.Visible = true;
                    lblSubjectListWarning.Text = "Something went wrong. Can't delete now";
                }
            }
            catch (Exception ex)
            {
                pnlSubjectListWarning.Visible = true;
                lblSubjectListWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
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
                if (txtSearch.Text == string.Empty || ddlFilter.Text == "None")
                {
                    RetrieveAllSubjects();
                }
                else if (ddlFilter.Text == "Subject Name")
                {
                    Objects.con.Open();
                    Objects.cmd = new SqlCommand("SELECT * FROM vw_GetAllSubjects WHERE [SUBJECT NAME] LIKE @SUBJECT_NAME ORDER BY ID ASC", Objects.con);
                    Objects.cmd.CommandType = CommandType.Text;
                    Objects.cmd.Parameters.AddWithValue("@SUBJECT_NAME", "%" + txtSearch.Text + "%");
                }
                else if (ddlFilter.Text == "Category Name")
                {
                    Objects.con.Open();
                    Objects.cmd = new SqlCommand("SELECT * FROM vw_GetAllSubjects WHERE [CATEGORY NAME] LIKE @CATEGORY_NAME ORDER BY ID ASC", Objects.con);
                    Objects.cmd.CommandType = CommandType.Text;
                    Objects.cmd.Parameters.AddWithValue("@CATEGORY_NAME", "%" + txtSearch.Text + "%");
                }
                if (txtSearch.Text != string.Empty || ddlFilter.Text != "None")
                {
                    Objects.da = new SqlDataAdapter();
                    Objects.da.SelectCommand = Objects.cmd;
                    Objects.dt = new DataTable();
                    Objects.da.Fill(Objects.dt);
                    if (Objects.dt.Rows.Count > 0)
                    {
                        gvSubjectList.DataSource = Objects.dt;
                        gvSubjectList.DataBind();
                        gvSubjectList.Visible = true;
                        pnlSubjectListWarning.Visible = false;
                    }
                    else
                    {
                        gvSubjectList.Visible = false;
                        pnlSubjectListWarning.Visible = true;
                        lblSubjectListWarning.Text = "Nothing found!";

                    }
                }
            }
            catch (Exception ex)
            {
                pnlSubjectListWarning.Visible = true;
                lblSubjectListWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
            finally
            {
                Objects.con.Close();
                Objects.cmd.Dispose();
            }
        }
    }
}