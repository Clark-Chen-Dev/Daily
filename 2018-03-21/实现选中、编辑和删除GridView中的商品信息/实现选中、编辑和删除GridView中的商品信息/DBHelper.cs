using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public class DBHelper
{
    private static string connStr = WebConfigurationManager.ConnectionStrings[
      "ConnStr"].ConnectionString;

    public static DataTable GetData(string sqlText)
    {
        DataTable tbl = new DataTable();
        try
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlDataAdapter adapter = new SqlDataAdapter(sqlText, conn);
                adapter.Fill(tbl);
            }
        } // end try
        catch (Exception)
        {
            throw;
        } // end catch

        return tbl;
    }

    public static int ExecuteNonQuery(string sqlText)
    {
        int rowAffected = 0;
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            using (SqlCommand cmd = new SqlCommand(sqlText, conn))
            {
                try
                {
                    conn.Open();
                    rowAffected = cmd.ExecuteNonQuery();
                    conn.Close();
                } // end try
                catch (Exception)
                {
                    throw;
                } // end catch
            } // end using
        }

        return rowAffected;
    }
}
