package finalsoop;
import java.sql.*;

public class finalsConnect {
    
    public static Connection Connect(){
        
        Connection conn = null;
        
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "finals_oop", "password"); // 
            System.out.println("Connection Succesful");
        } catch (Exception e){
            System.out.println(e);
        }
        
        return conn;
        
    }
    
    
}
