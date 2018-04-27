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
}
