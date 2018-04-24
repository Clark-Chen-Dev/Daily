using System;

public class DBHelper
{
    private string connStr = WebConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
    public string ExecuteReader(string sqlText)
    {
        SqlDataReader reader = null;
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            using (SqlCommand cmd = new SqlCommand(sqlText, conn))
            {
                conn.Open();
                 return  = cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection))
                } // end using
            } // end using

            conn.Close();
        } // end using
    }

}
