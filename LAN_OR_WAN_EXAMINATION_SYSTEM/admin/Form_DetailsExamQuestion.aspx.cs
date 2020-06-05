using System;
using System.Data.SqlClient;
using System.Data;
namespace LAN_OR_WAN_EXAMINATION_SYSTEM.admin // Created by: Joshua C. Magoliman
{
    public partial class Form_DetailsExamQuestion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string questionId = Request.QueryString["questionId"];
            if (!IsPostBack)
            {
                if (questionId == null)
                {
                    Response.Redirect("~/admin/Form_Questions.aspx");
                }
                RetrieveExamQuestionDetails(Convert.ToInt32(questionId));
            }
        }
        private void RetrieveExamQuestionDetails(int param_Value)
        {
            try
            {
                Objects.con.Open();
                Objects.cmd = new SqlCommand("SELECT * FROM vw_GetAllQuestions WHERE id=@id", Objects.con);
                Objects.cmd.CommandType = CommandType.Text;
                Objects.cmd.Parameters.AddWithValue("@id", param_Value);
                Objects.da = new SqlDataAdapter();
                Objects.da.SelectCommand = Objects.cmd;
                Objects.dt = new DataTable();
                Objects.da.Fill(Objects.dt);
                gvExamDetails.DataSource = Objects.dt;
                gvExamDetails.DataBind();
                gvExamDetails.Visible = true;
                pnlExamDetailsWarning.Visible = false;
            }
            catch (Exception ex)
            {
                pnlExamDetailsWarning.Visible = true;
                lblExamDetailsWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
            }
            finally
            {
                Objects.con.Close();
                Objects.cmd.Dispose();
            }
        }
    }
}