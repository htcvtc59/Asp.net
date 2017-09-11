using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Exam_WAD.Models
{
    public class EmployeeModel
    {
        SqlConnection conn;
        public EmployeeModel()
        {
            conn = new SqlConnection("server=localhost;database=Employees;uid=sa;pwd=230697");
        }

        public List<Employee> GetData()
        {
            string sql = "select * from Employee";
            SqlDataAdapter da = new SqlDataAdapter(sql, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            List<Employee> liste = new List<Employee>();
            foreach (DataRow item in dt.Rows)
            {
                Employee e = new Employee();

                e.EmployeeID = item[0].ToString();
                e.EmployeeName = item[1].ToString();
                e.Department = item[2].ToString();
                e.Salary = double.Parse(item[3].ToString());

                liste.Add(e);
            }
            return liste;
        }



        public bool InsertEmployee(Employee b)
        {
            string sql = "insert into Employee values(@EmployeeID,@EmployeeName,@Department,@Salary)";
            SqlCommand cmd = new SqlCommand(sql, conn);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            cmd.Parameters.AddWithValue("@EmployeeID", b.EmployeeID);
            cmd.Parameters.AddWithValue("@EmployeeName", b.EmployeeName);
            cmd.Parameters.AddWithValue("@Department", b.Department);
            cmd.Parameters.AddWithValue("@Salary", b.Salary);
            int result = cmd.ExecuteNonQuery();
            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
            }
            return result > 0;
        }

    }
}