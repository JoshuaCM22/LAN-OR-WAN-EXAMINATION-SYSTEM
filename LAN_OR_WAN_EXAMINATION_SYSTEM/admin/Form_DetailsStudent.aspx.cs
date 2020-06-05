using System;
using System.Data.SqlClient;
using System.Data;
namespace LAN_OR_WAN_EXAMINATION_SYSTEM.admin // Created by: Joshua C. Magoliman
{
    public partial class Form_DetailsStudent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string studentId = Request.QueryString["studentId"];
            if (!IsPostBack)
            {
                if (studentId == null)
                {
                    Response.Redirect("~/admin/Form_Students.aspx");
                }
                RetrieveStudentDetails(Convert.ToInt32(studentId));
            }
        }
        private void RetrieveStudentDetails(int param_Value)
        {
            try
            {
                Objects.con.Open();
                Objects.cmd = new SqlCommand("SELECT * FROM vw_GetAllStudents WHERE id=@id", Objects.con);
                Objects.cmd.CommandType = CommandType.Text;
                Objects.cmd.Parameters.AddWithValue("@id", param_Value);
                Objects.da = new SqlDataAdapter();
                Objects.da.SelectCommand = Objects.cmd;
                Objects.dt = new DataTable();
                Objects.da.Fill(Objects.dt);
                gvStudentDetails.DataSource = Objects.dt;
                gvStudentDetails.DataBind();
                gvStudentDetails.Visible = true;
                pnlStudentDetailsWarning.Visible = false;
            }
            catch (Exception ex)
            {
                pnlStudentDetailsWarning.Visible = true;
                lblStudentDetailsWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
            finally
            {
                Objects.con.Close();
                Objects.cmd.Dispose();
            }
        }
    }
}