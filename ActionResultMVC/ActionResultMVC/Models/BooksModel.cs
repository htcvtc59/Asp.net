using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ActionResultMVC.Models
{
    public class BooksModel
    {
        public SqlConnection GetConnection()
        {
            SqlConnection conn = new SqlConnection("server=localhost;database=DemoAccount;uid=sa;pwd=230697");
            return conn;
        }
        public List<Books> GetData()
        {
            string sql = "select * from tblBook";
            SqlDataAdapter da = new SqlDataAdapter(sql, GetConnection());
            DataTable dt = new DataTable();
            da.Fill(dt);
            List<Books> list = new List<Books>();
            List<DataRow> rows = dt.AsEnumerable().ToList();
            foreach (var item in rows)
            {
                Books b = new Books();
                b.id = item[0].ToString();
                b.title = item[1].ToString();
                b.author = item[2].ToString();
                b.description = item[3].ToString();
                b.images = item[4].ToString();
                b.price = Convert.ToDouble(item[5].ToString());
                list.Add(b);

            }

            return list;

        }


    }
}