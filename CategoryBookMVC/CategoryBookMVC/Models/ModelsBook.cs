using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace CategoryBookMVC.Models
{
    public class ModelsBook
    {
        private SqlConnection conn = null;
        public ModelsBook()
        {
            conn = new SqlConnection("server=localhost;database=DemoAccount;uid=sa;pwd=230697");
        }
        public bool AddCategory(Category cate)
        {
            string sql = "insert into tblCategory values(@name)";
            SqlCommand cmd = new SqlCommand(sql, conn);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            cmd.Parameters.AddWithValue("@name", cate.Name);
            int result = cmd.ExecuteNonQuery();
            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
            }
            return result > 0;
        }

        public List<Category> listCategory()
        {
            string sql = "select * from tblCategory";
            SqlDataAdapter da = new SqlDataAdapter(sql, conn);
            DataTable dt = new DataTable();
            List<Category> listcate = new List<Category>();
            da.Fill(dt);
            foreach (DataRow item in dt.Rows)
            {
                Category cate = new Category() {
                    ID = (int)item[0],
                    Name = item[1].ToString()
                };
                listcate.Add(cate);
            }
            return listcate;
        }

        public bool AddBook(Book book)
        {
            string sql = "insert into tblBook values(@title,@author,@des)";
            SqlCommand cmd = new SqlCommand(sql, conn);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            cmd.Parameters.AddWithValue("@title", book.Title);
            cmd.Parameters.AddWithValue("@author", book.Author);
            cmd.Parameters.AddWithValue("@des", book.description);
            int result = cmd.ExecuteNonQuery();
            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
            }
            return result > 0;
        }

    }
}