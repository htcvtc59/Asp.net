using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace DataGviewASP
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

        public bool UpdateData(string user, string pass)
        {
            string sql = "update tblAccount set _pass=@p where _user=@u";
            SqlCommand cmd = new SqlCommand(sql, conn);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            cmd.Parameters.AddWithValue("@p", pass);
            cmd.Parameters.AddWithValue("@u", user);
            int result = cmd.ExecuteNonQuery();
            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
            }
            return result > 0;
        }
        public bool DeleteData(string user)
        {
            string sql = "delete from tblAccount where _user=@u";
            SqlCommand cmd = new SqlCommand(sql, conn);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            cmd.Parameters.AddWithValue("@u", user);
            int result = cmd.ExecuteNonQuery();
            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
            }
            return result > 0;
        }
        public bool InsertData(string user, string pass)
        {
            string sql = "insert into tblAccount values(@u,@p)";
            SqlCommand cmd = new SqlCommand(sql, conn);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            cmd.Parameters.AddWithValue("@p", pass);
            cmd.Parameters.AddWithValue("@u", user);
            int result = cmd.ExecuteNonQuery();
            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
            }
            return result > 0;
        }

        public bool DeleteAll()
        {
            string sql = "delete from tblAccount";
            SqlCommand cmd = new SqlCommand(sql, conn);
            conn.Open();
            int result = cmd.ExecuteNonQuery();
            conn.Close();
            return result > 0;
        }

    }
}