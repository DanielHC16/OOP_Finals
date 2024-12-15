package finalsoop;

import java.sql.Connection;
import java.sql.DriverManager;

public class finalsConnect {

    public static Connection Connect() {

        Connection conn = null;

        try {
            // Load the MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // JDBC URL
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/finalsoop?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "password");
            
            System.out.println("Connection Successful");
        } catch (Exception e) {
            System.out.println("Connection Failed: " + e.getMessage());
            e.printStackTrace();
        }

        return conn;

    }

}
