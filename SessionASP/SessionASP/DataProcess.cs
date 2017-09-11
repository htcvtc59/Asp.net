using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SessionASP
{
    public class DataProcess
    {
        SqlConnection conn = null;
        public DataProcess()
        {
            conn = new SqlConnection("server=localhost;database=DemoAccount;uid=sa;pwd=230697");
        }
        public DataTable GetData()
        {
            string sql = "select * from tblAccount";
            SqlDataAdapter da = new SqlDataAdapter(sql, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
        public Account CheckLogin(string _u, string _p)
        {
            Account account = null;
            string sql = "select top 1 * from tblAccount where _user=@u and _pass=@p";
            SqlCommand cmd = new SqlCommand(sql, conn);
            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
            }
            cmd.Parameters.AddWithValue("@u", _u);
            cmd.Parameters.AddWithValue("@p", _p);
            SqlDataReader rd = cmd.ExecuteReader();
            while (rd.Read())
            {
                account = new Account()
                {
                    username = rd.GetString(0),
                    level = rd.GetString(2)
                };
            }
            rd.Close();
            conn.Close();
            return account;
        }
    }
}