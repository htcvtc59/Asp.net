using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ViewProductwithIDProASP
{
    public class DataProcess
    {
        SqlConnection conn = null;
        public DataProcess()
        {
            conn = new SqlConnection("server=localhost;database=ShopTechnology;uid=sa;pwd=230697");
        }
        public List<Category> GetDataCate()
        {
            List<Category> listCate = new List<Category>();
            string sql = "select * from tblCategory";
            SqlDataAdapter da = new SqlDataAdapter(sql, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            foreach (DataRow item in dt.Rows)
            {
                Category cate = new Category()
                {
                    id = item[0].ToString(),
                    name = item[1].ToString()
                };
                listCate.Add(cate);

            }
            return listCate;
        }

        public DataTable GetData(string id)
        {
            string sql = "select * from tblDetailPro where idprocate='" + id + "'";
            SqlDataAdapter da = new SqlDataAdapter(sql, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }



    }
}