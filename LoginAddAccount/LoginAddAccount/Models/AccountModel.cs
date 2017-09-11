using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace LoginAddAccount.Models
{
    public class AccountModel
    {
       private SqlConnection conn = null;
        public AccountModel()
        {
            conn = new SqlConnection("server=localhost;database=DemoAccount;uid=sa;pwd=230697");
        }
        public bool AddAccount(Account acc)
        {
            string sql = "insert into Account values(@u,@p)";
            SqlCommand cmd = new SqlCommand(sql, conn);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            cmd.Parameters.AddWithValue("@p", acc.password);
            cmd.Parameters.AddWithValue("@u", acc.username);
            int result = cmd.ExecuteNonQuery();
            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
            }
            return result > 0;
        }
        public bool CheckLogin(Account acc)
        {
            string sql = "select top 1 * from Account where _user=@u and _pass=@p";
            SqlCommand cmd = new SqlCommand(sql, conn);
            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
            }
            cmd.Parameters.AddWithValue("@u", acc.username);
            cmd.Parameters.AddWithValue("@p", acc.password);
            SqlDataReader rd = cmd.ExecuteReader();
            bool result = rd.HasRows;
            rd.Close();
            conn.Close();
            return result;
        }
        public List<Account> GetData()
        {
            string sql = "select * from Account";
            SqlDataAdapter da = new SqlDataAdapter(sql, conn);
            DataTable dt = new DataTable();
            List<Account> list = new List<Account>();
            da.Fill(dt);
            foreach (DataRow item in dt.Rows)
            {
                Account c = new Account() {
                    username = item[1].ToString(),
                    password =item[2].ToString()
                      
                };
                list.Add(c);
            }
            return list;
        }
    }
}