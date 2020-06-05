using System;
using System.Data;
using System.Data.SqlClient;
namespace LAN_OR_WAN_EXAMINATION_SYSTEM.students // Created by: Joshua C. Magoliman
{
    public partial class Form_Categories : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            RetrieveAllCategoryNames();
            Student.isExamIsStarted = false;
        }
        private void RetrieveAllCategoryNames()
        {
            try
            {
                Objects.con.Open();
                Objects.cmd = new SqlCommand("sp_GetAllCategories", Objects.con);
                Objects.cmd.CommandType = CommandType.StoredProcedure;
                Objects.dr = Objects.cmd.ExecuteReader();
                if (Objects.dr.HasRows)
                {
                    rptCategoryList.DataSource = Objects.dr;
                    rptCategoryList.DataBind();
                }
                else
                {
                    pnlCategoryShowWarning.Visible = true;
                    lblCategoryShowWarning.Text = "Sorry! There is no category";
                }
            }
            catch (Exception ex)
            {
                pnlCategoryShowWarning.Visible = true;
                lblCategoryShowWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;             
            }
            finally
            {
                Objects.con.Close();
                Objects.cmd.Dispose();
            }
        }
    }
}