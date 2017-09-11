using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace LoginDemoASP
{
    public class DataProcess
    {
        private SqlConnection conn = null;
        public DataProcess()
        {
            conn = new SqlConnection("server=localhost;database=DemoAccount;uid=sa;pwd=230697");

        }
        public bool CheckLogin(string _u, string _p)
        {
            string sql = "select top 1 * from tblAccount where _user=@u and _pass=@p";
            SqlCommand cmd = new SqlCommand(sql, conn);
            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
            }
            cmd.Parameters.AddWithValue("@u", _u);
            cmd.Parameters.AddWithValue("@p", _p);
            SqlDataReader rd = cmd.ExecuteReader();
            bool result = rd.HasRows;
            rd.Close();
            conn.Close();
            return result;
        }
        public int Register(string _u, string _p)
        {
            string sql = "insert into tblAccount values(@u,@p)";
            SqlCommand cmd = new SqlCommand(sql, conn);
            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
            }
            cmd.Parameters.AddWithValue("@u", _u);
            cmd.Parameters.AddWithValue("@p", _p);
            int result = cmd.ExecuteNonQuery();
            conn.Close();
            return result;
        }
    }
}