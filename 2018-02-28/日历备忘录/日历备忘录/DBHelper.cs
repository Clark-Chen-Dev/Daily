using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace 日历备忘录
{
    class DBHelper
    {
        private static readonly string connStr = WebConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
        public static string ExecuteReader(string sqlText)
        {
            string result = string.Empty;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                using (SqlCommand cmd = new SqlCommand(sqlText, conn))
                {
                    conn.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection))
                    {
                        while (reader.Read())
                        {
                            result += reader.GetString(0).ToString() + ",";
                        } // end while
                        reader.Close();
                    } // end using
                } // end using
                conn.Close();
            } // end using

            return result;
        } // end method ExecuteReader

        public static DataTable GetDataTable(string sqlText)
        {
            DataTable tbl = new DataTable();
            using (SqlDataAdapter adapter = new SqlDataAdapter(sqlText, connStr))
            {
                adapter.Fill(tbl);
            } // end using
            return tbl;
        } // end mehtod GetDataTable

        public static bool ExecuteNonQuery(string sqlText)
        {
            bool isSuccess = false;
            int rowsAffected = 0;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                using (SqlCommand cmd = new SqlCommand(sqlText, conn))
                {
                    conn.Open();
                    rowsAffected = cmd.ExecuteNonQuery();
                } // end using
                conn.Close();
            } // end using

            isSuccess = rowsAffected > 0 ? true : false;
            return isSuccess;
        }
    } // enc class DBHelper
}