using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
namespace LAN_OR_WAN_EXAMINATION_SYSTEM.admin // Created by: Joshua C. Magoliman
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        public static int adminId;
        public static string adminFullName;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack || !IsPostBack)
            {
                HttpCookie cookie = Request.Cookies["AdminCookie"];
                if (cookie != null)
                {
                    lbtnLogOut.Text = "Log out";
                    Session["AdminEmail"] = cookie["AdminEmail"].ToString();
                    RetrieveAdminFullName(cookie["AdminEmail"].ToString());
                    RetrieveAdminId(Session["AdminEmail"].ToString());
                }
                else
                {
                    Response.Redirect("../admin/Default.aspx");
                }
            }
        }
        private void RetrieveAdminFullName(string param_Value)
        {
            Objects.con.Open();
            Objects.cmd = new SqlCommand("SELECT full_name FROM tbl_admins WHERE email=@email", Objects.con);
            Objects.cmd.CommandType = CommandType.Text;
            Objects.cmd.Parameters.AddWithValue("@email", param_Value);
            adminFullName = Objects.cmd.ExecuteScalar().ToString();
            Objects.con.Close();
            Objects.cmd.Dispose();
        }
        public static void RetrieveAdminId(string param_Value)
        {
            Objects.con.Open();
            Objects.cmd = new SqlCommand("SELECT id FROM tbl_admins WHERE email=@email", Objects.con);
            Objects.cmd.CommandType = CommandType.Text;
            Objects.cmd.Parameters.AddWithValue("@email", param_Value);
            adminId = Convert.ToInt32(Objects.cmd.ExecuteScalar());
            Objects.con.Close();
            Objects.cmd.Dispose();
        }
        protected void lbtnLogOut_Click(object sender, EventArgs e)
        {
            if (lbtnLogOut.Text == "Log out")
            {

                if (Request.Cookies["AdminCookie"] != null)
                {
                    Response.Cookies["AdminCookie"].Expires = DateTime.Now.AddDays(-1);
                    Session.Clear();
                    Response.Redirect("../admin/Default.aspx");
                }
            }
        }
    }
}