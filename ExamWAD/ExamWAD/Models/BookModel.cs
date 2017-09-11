using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ExamWAD.Models
{
    public class BookModel
    {
        SqlConnection conn;
        public BookModel()
        {
            conn = new SqlConnection("server=localhost;database=BookStore;uid=sa;pwd=230697");
        }

        public List<Book> GetData()
        {
            string sql = "select * from Book";
            SqlDataAdapter da = new SqlDataAdapter(sql, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            List<Book> listb = new List<Book>();
            foreach (DataRow item in dt.Rows)
            {
                Book b = new Book();

                b.Bookid = item[0].ToString();
                b.Title = item[1].ToString();
                b.Author = item[2].ToString();
                b.Price = double.Parse(item[3].ToString());
                b.Image = item[4].ToString();
                b.Description = item[5].ToString();
                b.Status = bool.Parse(item[6].ToString());
                
                listb.Add(b);
            }
            return listb;
        }

        public TitleBook GetByIDNameTitle(string id)
        {
            TitleBook t = null;
            string sql = "select * from TitleBook where Id=@id";
            SqlCommand cmd = new SqlCommand(sql, conn);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            cmd.Parameters.AddWithValue("@id", id);
            SqlDataReader rd = cmd.ExecuteReader();
            while (rd.Read())
            {
                t = new TitleBook();
                t.Id = int.Parse(id);
                t.Title = rd.GetString(1);
            }
            conn.Close();
            return t;

        }

        public Book GetByID(string id)
        {
            Book b= null;
            string sql = "select * from Book where BookId=@id";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Connection.Open();
            cmd.Parameters.AddWithValue("@id", id);
            SqlDataReader rd = cmd.ExecuteReader();
            while (rd.Read())
            {
                b = new Book();
                b.Bookid = id;
                b.Title = rd.GetString(1);
                b.Author = rd.GetString(2);
                b.Price = rd.GetDouble(3);
                b.Image = rd.GetString(4);
                b.Description = rd.GetString(5);
                b.Status = rd.GetBoolean(6);

            }
            conn.Close();
            return b;

        }

        public bool InsertBook(Book b)
        {
            string sql = "insert into Book values(@Bookid,@Title,@Author,@Price,@Image,@Description,@Status)";
            SqlCommand cmd = new SqlCommand(sql, conn);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            cmd.Parameters.AddWithValue("@Bookid", b.Bookid);
            cmd.Parameters.AddWithValue("@Title", b.Title);
            cmd.Parameters.AddWithValue("@Author", b.Author);
            cmd.Parameters.AddWithValue("@Price", b.Price);
            cmd.Parameters.AddWithValue("@Image", b.Image);
            cmd.Parameters.AddWithValue("@Description", b.Description);
            cmd.Parameters.AddWithValue("@Status", b.Status);
            int result = cmd.ExecuteNonQuery();
            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
            }
            return result > 0;

        }


        public bool InsertTitleBook(TitleBook t)
        {
            string sql = "insert into TitleBook values(@title)";
            SqlCommand cmd = new SqlCommand(sql, conn);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            cmd.Parameters.AddWithValue("@title", t.Title);
            int result = cmd.ExecuteNonQuery();
            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
            }
            return result > 0;
        }

        public List<TitleBook> listTitleBook()
        {
            string sql = "select * from TitleBook";
            SqlDataAdapter da = new SqlDataAdapter(sql, conn);
            DataTable dt = new DataTable();
            List<TitleBook> listtitle = new List<TitleBook>();
            da.Fill(dt);
            foreach (DataRow item in dt.Rows)
            {
                TitleBook title = new TitleBook()
                {
                    Id = (int)item[0],
                    Title = item[1].ToString()
                };
                listtitle.Add(title);
            }
            return listtitle;
        }


        internal void DeleteItem(string id)
        {
            string sql = "delete from Book where BookId=@id";
            SqlCommand cmd = new SqlCommand(sql, conn);
            conn.Open();
            cmd.Parameters.AddWithValue("@id", id);
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        internal void Update(string id)
        {
            string sql = "update Book set Price=4000,Description='ABC' where Bookid='B01'";

        }

    }
}