using System;
using System.Data.SqlClient;
using System.Data;
namespace LAN_OR_WAN_EXAMINATION_SYSTEM.admin // Created by: Joshua C. Magoliman
{
    public partial class Form_EditCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string categoryId = Request.QueryString["categoryId"];
                if (categoryId == null)
                {
                    Response.Redirect("~/admin/Form_Categories.aspx");
                }
                txtCategoryEdit.Focus();
                RetrieveCategoryEdit(Convert.ToInt32(categoryId));
            }
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                CheckIfCategoryNameExist();
            }
            else
            {
                txtCategoryEdit.Focus();
                pnlEditCategoryWarning.Visible = true;
                lblEditCategoryWarning.Text = "You must fill all the requirements";
            }
        }
        private void CheckIfCategoryNameExist()
        {
            try
            {
                Objects.con.Open();
                Objects.cmd = new SqlCommand("SELECT * FROM tbl_categories WHERE name=@name", Objects.con);
                Objects.cmd.CommandType = CommandType.Text;
                Objects.cmd.Parameters.AddWithValue("@name", txtCategoryEdit.Text);
                Objects.dr = Objects.cmd.ExecuteReader();
                if (Objects.dr.Read() && Objects.dr.GetValue(0) != DBNull.Value)
                {
                    txtCategoryEdit.Focus();
                    pnlEditCategoryWarning.Visible = true;
                    lblEditCategoryWarning.Text = "This Category Name is already exist!. Please try another category name";
                    Objects.con.Close();
                    Objects.cmd.Dispose();
                }
                else
                {
                    Objects.con.Close();
                    Objects.cmd.Dispose();
                    pnlEditCategoryWarning.Visible = false;
                    Updating();
                }
            }
            catch (Exception ex)
            {
                txtCategoryEdit.Focus();
                pnlEditCategoryWarning.Visible = true;
                lblEditCategoryWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
        }
        private void Updating()
        {
            try
            {
                string categoryId = Request.QueryString["categoryId"];
                Objects.con.Open();
                Objects.cmd = new SqlCommand("sp_UpdateExistingCategory", Objects.con);
                Objects.cmd.CommandType = CommandType.StoredProcedure;
                Objects.cmd.Parameters.AddWithValue("@id", Convert.ToInt32(categoryId));
                Objects.cmd.Parameters.AddWithValue("@name", txtCategoryEdit.Text);
                int i = (int)Objects.cmd.ExecuteNonQuery();
                if (i > 0)
                {
                    Response.Redirect("~/admin/Form_Categories.aspx");
                }
                else
                {
                    txtCategoryEdit.Focus();
                    pnlEditCategoryWarning.Visible = true;
                    lblEditCategoryWarning.Text = "Something went wrong. Can't update. Please try after sometime later</br> ";
                }
            }
            catch (Exception ex)
            {
                txtCategoryEdit.Focus();
                pnlEditCategoryWarning.Visible = true;
                lblEditCategoryWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
            finally
            {
                Objects.con.Close();
                Objects.cmd.Dispose();
            }
        }
        private void RetrieveCategoryEdit(int param_Value)
        {
            try
            {
                Objects.con.Open();
                Objects.cmd = new SqlCommand("SELECT * FROM tbl_categories WHERE id = @id", Objects.con);
                Objects.cmd.CommandType = CommandType.Text;
                Objects.cmd.Parameters.AddWithValue("@id", param_Value);
                Objects.dr = Objects.cmd.ExecuteReader();
                while (Objects.dr.Read())
                {
                    txtCategoryEdit.Text = Objects.dr["name"].ToString();
                }
                pnlEditCategoryWarning.Visible = false;
            }
            catch (Exception ex)
            {
                pnlEditCategoryWarning.Visible = true;
                lblEditCategoryWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
            finally
            {
                Objects.con.Close();
                Objects.cmd.Dispose();
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/admin/Form_Categories.aspx");
        }
    }
}