using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace LAN_OR_WAN_EXAMINATION_SYSTEM // Created by: Joshua C. Magoliman
{
    public class Objects
    {
        public static SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString);
        public static SqlCommand cmd;
        public static SqlDataReader dr;

        public static SqlDataAdapter da;
        public static DataTable dt;
        public static DataSet ds;
    }
}