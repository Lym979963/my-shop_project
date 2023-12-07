package Utils;

import com.mchange.v2.c3p0.ComboPooledDataSource;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;


public class Dbutil {
    private static DataSource ds=new ComboPooledDataSource();
    public static DataSource getDataSource(){
        DataSource ds=new ComboPooledDataSource();
        return ds;

    }
    public static Connection getConnection() throws SQLException {
        return ds.getConnection();
    }
    public static void closeStatement(Statement stmt) {
        if (stmt != null) {
            try {
                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public static void closeConnection(Connection conn) {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
