using System;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
using System.Data;
namespace LAN_OR_WAN_EXAMINATION_SYSTEM.admin // Created by: Joshua C. Magoliman
{
    public partial class Default : System.Web.UI.Page 
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.Cookies["AdminCookie"] != null)
                {
                    Response.Redirect("../admin/Form_Dashboard.aspx");
                }
            }
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    Objects.con.Open();
                    Objects.cmd = new SqlCommand("sp_LoginForAdmin", Objects.con);
                    Objects.cmd.CommandType = CommandType.StoredProcedure;
                    Objects.cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                    Objects.dr = Objects.cmd.ExecuteReader();
                    if (Objects.dr.Read() && Objects.dr.GetValue(0) != DBNull.Value)
                    {
                        string hashedPassword = Objects.dr["password"].ToString();
                        string plainPassword = txtPassword.Text;
                        bool isMatch = BCrypt.CheckPassword(plainPassword, hashedPassword);
                        if (isMatch == true)
                        {
                            int accountStatusId = Convert.ToInt32(Objects.dr["account_or_exam_status_id"].ToString());
                            switch (accountStatusId)
                            {
                                case 1:
                                    HttpCookie cookie = new HttpCookie("AdminCookie");
                                    cookie["AdminEmail"] = txtEmail.Text;
                                    cookie["AdminFullName"] = Objects.dr["full_name"].ToString();
                                    if (chkRemember.Checked)
                                    {
                                        cookie.Expires = DateTime.Now.AddDays(1);
                                    }
                                    Response.Cookies.Add(cookie);
                                    Session["AdminEmail"] = txtEmail.Text;
                                    Response.Redirect("../admin/Form_Dashboard.aspx");
                                    break;
                                case 2:
                                    InvalidOrNotActiveAccountNotification("This account is inactive. Please contact your administrator to fix this.</br>");
                                    break;
                            }
                        }
                        else
                        {
                            InvalidOrNotActiveAccountNotification("Incorrect Email and/or Password!</br>");
                        }
                    }
                    else
                    {
                        InvalidOrNotActiveAccountNotification("Incorrect Email and/or Password!</br>");
                    }
                }
                catch (Exception ex)
                {
                    panelWarning.Visible = true;
                    lblWarning.Text = "Please contact your programmer. Because this program now has an error called " + ex.Message + Environment.NewLine + ex.StackTrace;
                }
                finally
                {
                    Objects.con.Close();
                    Objects.cmd.Dispose();
                }
            }
        }
        private void InvalidOrNotActiveAccountNotification(string param_Value)
        {
            panelWarning.Visible = true;
            lblWarning.Text = param_Value;
            txtEmail.Text = "";
        }
    }
}