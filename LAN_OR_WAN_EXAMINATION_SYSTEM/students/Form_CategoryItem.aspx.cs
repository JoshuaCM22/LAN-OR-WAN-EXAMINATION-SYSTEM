using System;
using System.Data.SqlClient;
using System.Data;
namespace LAN_OR_WAN_EXAMINATION_SYSTEM.students // Created by: Joshua C. Magoliman
{
    public partial class Form_CategoryItem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string categoryId = Request.QueryString["categoryId"];
            if (categoryId == null)
            {
                Response.Redirect("../students/Form_Categories.aspx");
            }
            RetrieveAllSubjects(Convert.ToInt32(categoryId));
            RetrieveCertainCategory(Convert.ToInt32(categoryId));
        }
        private void RetrieveAllSubjects(int param_Value)
        {
            try
            {
                Objects.con.Close();
                Objects.cmd.Dispose();

                Objects.con.Open();
                Objects.cmd = new SqlCommand("SELECT name FROM tbl_categories WHERE id=@id", Objects.con);
                Objects.cmd.CommandType = CommandType.Text;
                Objects.cmd.Parameters.AddWithValue("@id", param_Value);
                string categoryName = Objects.cmd.ExecuteScalar().ToString();
                Objects.con.Close();
                Objects.cmd.Dispose();

                Objects.con.Open();
                Objects.cmd = new SqlCommand("SELECT * FROM vw_GetAllSubjects WHERE [CATEGORY NAME]=@categoryname", Objects.con);
                Objects.cmd.CommandType = CommandType.Text;
                Objects.cmd.Parameters.AddWithValue("@categoryname", categoryName);
                Objects.dr = Objects.cmd.ExecuteReader();
                if (Objects.dr.HasRows)
                {
                    rptCategoryItem.DataSource = Objects.dr;
                    rptCategoryItem.DataBind();
                }
                else
                {
                    pnlSubjectShowWarning.Visible = true;
                    lblSubjectShowWarning.Text = "Sorry! There is no subject in this category";
                }
                Objects.con.Close();
                Objects.cmd.Dispose();
            }
            catch (Exception ex)
            {
                pnlSubjectShowWarning.Visible = true;
                lblSubjectShowWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
        }
        private void RetrieveCertainCategory(int param_Value)
        {
            try
            {
                Objects.con.Open();
                Objects.cmd = new SqlCommand("SELECT * FROM tbl_categories WHERE id=@id", Objects.con);
                Objects.cmd.Parameters.AddWithValue("@id", param_Value);
                Objects.dr = Objects.cmd.ExecuteReader();
                while (Objects.dr.Read())
                {
                    lblCategorySubject.Text = Objects.dr["name"].ToString();
                }
            }
            catch (Exception ex)
            {
                pnlSubjectShowWarning.Visible = true;
                lblSubjectShowWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
            finally
            {
                Objects.con.Close();
                Objects.cmd.Dispose();
            }
        }
    }
}