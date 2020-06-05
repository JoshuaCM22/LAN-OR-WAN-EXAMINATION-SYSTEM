using System;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Data.SqlClient;
using System.Data;
namespace LAN_OR_WAN_EXAMINATION_SYSTEM.admin // Created by: Joshua C. Magoliman
{
    public partial class Form_Categories : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                pnlCategoryList.Visible = true;
                pnlAddCategory.Visible = false;
                btnpnlCategoryList.BackColor = ColorTranslator.FromHtml("#343A40");
                btnpnlAddCategory.BackColor = ColorTranslator.FromHtml("#DC3545");
                RetrieveAllCategories();
            }
        }
        protected void btnpnlCategoryList_Click(object sender, EventArgs e)
        {
            pnlCategoryList.Visible = true;
            pnlAddCategory.Visible = false;
            btnpnlCategoryList.BackColor = ColorTranslator.FromHtml("#343A40");
            btnpnlAddCategory.BackColor = ColorTranslator.FromHtml("#DC3545");
            RetrieveAllCategories();
        }
        protected void btnpnlAddCategory_Click(object sender, EventArgs e)
        {
            txtCategory.Focus();
            pnlCategoryList.Visible = false;
            pnlAddCategory.Visible = true;
            btnpnlCategoryList.BackColor = ColorTranslator.FromHtml("#DC3545");
            btnpnlAddCategory.BackColor = ColorTranslator.FromHtml("#343A40");
        }
        protected void btnAddCategory_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                CheckIfCategoryNameExist();
            }
            else
            {
                txtCategory.Focus();
                pnlAddCategoryWarning.Visible = true;
                lblCategoryAddWarning.Text = "You must fill all the requirements";
            }
        }
        private void CheckIfCategoryNameExist()
        {
            try
            {
                Objects.con.Open();
                Objects.cmd = new SqlCommand("SELECT * FROM tbl_categories WHERE name=@name", Objects.con);
                Objects.cmd.CommandType = CommandType.Text;
                Objects.cmd.Parameters.AddWithValue("@name", txtCategory.Text);
                Objects.dr = Objects.cmd.ExecuteReader();
                if (Objects.dr.Read() && Objects.dr.GetValue(0) != DBNull.Value)
                {
                    txtCategory.Focus();
                    pnlAddCategoryWarning.Visible = true;
                    lblCategoryAddWarning.Text = "This Category Name is already exist!. Please try another category name";
                    Objects.con.Close();
                    Objects.cmd.Dispose();
                }
                else
                {
                    Objects.con.Close();
                    Objects.cmd.Dispose();
                    pnlAddCategoryWarning.Visible = false;
                    InsertingNewCategory();
                }
            }
            catch (Exception ex)
            {
                txtCategory.Focus();
                pnlAddCategoryWarning.Visible = true;
                lblCategoryAddWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
        }
        private void InsertingNewCategory()
        {
            try
            {
                Objects.con.Open();
                Objects.cmd = new SqlCommand("sp_InsertNewCategory", Objects.con);
                Objects.cmd.CommandType = CommandType.StoredProcedure;
                Objects.cmd.Parameters.AddWithValue("@name", txtCategory.Text);
                int i = (int)Objects.cmd.ExecuteNonQuery();
                if (i > 0)
                {
                    txtCategory.Text = string.Empty;
                    Response.Redirect("~/admin/Form_Categories.aspx");
                }
                else
                {
                    txtCategory.Focus();
                    pnlAddCategoryWarning.Visible = true;
                    lblCategoryAddWarning.Text = "Something went wrong";
                }
            }
            catch (Exception ex)
            {
                txtCategory.Focus();
                pnlAddCategoryWarning.Visible = true;
                lblCategoryAddWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
            finally
            {
                Objects.con.Close();
                Objects.cmd.Dispose();
            }
        }
        protected void gvCategoryList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "deleteCategory")
            {
                DeleteCategory(Convert.ToInt32(e.CommandArgument));
                RetrieveAllCategories();
            }
        }
        protected void gvCategoryList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvCategoryList.PageIndex = e.NewPageIndex;
            RetrieveAllCategories();
        }
        private void RetrieveAllCategories()
        {
            try
            {
                Objects.con.Open();
                Objects.cmd = new SqlCommand("sp_GetAllCategories", Objects.con);
                Objects.cmd.CommandType = CommandType.StoredProcedure;
                Objects.da = new SqlDataAdapter();
                Objects.da.SelectCommand = Objects.cmd;
                Objects.dt = new DataTable();
                Objects.da.Fill(Objects.dt);
                gvCategoryList.DataSource = Objects.dt;
                gvCategoryList.DataBind();
                gvCategoryList.Visible = true;
                pnlCategoryListWarning.Visible = false;
            }
            catch (Exception ex)
            {
                pnlCategoryListWarning.Visible = true;
                lblCategoryListWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
            finally
            {
                Objects.con.Close();
                Objects.cmd.Dispose();
            }
        }
        private void DeleteCategory(int param_Value)
        {
            try
            {
                Objects.con.Open();
                Objects.cmd = new SqlCommand("sp_DeleteExistingCategory", Objects.con);
                Objects.cmd.CommandType = CommandType.StoredProcedure;
                Objects.cmd.Parameters.AddWithValue("@id", param_Value);
                int i = (int)Objects.cmd.ExecuteNonQuery();
                if (i > 0)
                {
                    Response.Redirect("~/admin/Form_Categories.aspx");
                }
                else
                {
                    pnlCategoryListWarning.Visible = true;
                    lblCategoryListWarning.Text = "Something went wrong. Can't delete now";
                }
            }
            catch (Exception ex)
            {
                pnlCategoryListWarning.Visible = true;
                lblCategoryListWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
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
                if (txtSearch.Text == "")
                {
                    RetrieveAllCategories();
                }
                else
                {
                    Objects.con.Open();
                    Objects.cmd = new SqlCommand("SELECT * FROM tbl_categories WHERE name LIKE @name ORDER BY ID ASC", Objects.con);
                    Objects.cmd.CommandType = CommandType.Text;
                    Objects.cmd.Parameters.AddWithValue("@name", "%" + txtSearch.Text + "%");
                    Objects.da = new SqlDataAdapter();
                    Objects.da.SelectCommand = Objects.cmd;
                    Objects.dt = new DataTable();
                    Objects.da.Fill(Objects.dt);
                    if (Objects.dt.Rows.Count > 0)
                    {
                        gvCategoryList.DataSource = Objects.dt;
                        gvCategoryList.DataBind();
                        gvCategoryList.Visible = true;
                        pnlCategoryListWarning.Visible = false;
                    }
                    else
                    {
                        gvCategoryList.Visible = false;
                        pnlCategoryListWarning.Visible = true;
                        lblCategoryListWarning.Text = "Nothing found!";
                    }
                }
            }
            catch (Exception ex)
            {
                pnlCategoryListWarning.Visible = true;
                lblCategoryListWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
            finally
            {
                Objects.con.Close();
                Objects.cmd.Dispose();
            }
        }
    }
}