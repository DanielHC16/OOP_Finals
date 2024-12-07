package finalsoop;
import java.sql.*;

public class FinalsOOP {

 Connection conn = new finalsConnect().Connect();
 public static void main(String[] args) {
        FinalsOOP op = new FinalsOOP();
        // MainScreen ms = new MainScreen();
        // ms.setVisible(true);
        op.addCollegeRecord("CN", "Trash", "1999-01-01", "9999-12-12", "A");
    }
 
 public void addCollegeRecord(String strCollegeCode, String strDesc, String strDateOpened, String strDateClosed, String strStatus){
     Statement ps = null;
     ResultSet rs = null;
     try{
         ps = conn.createStatement();
         ps.execute("INSERT INTO finalsoop.college(college_code, description, date_opened, date_closed, status) VALUES ('" 
                 + strCollegeCode + "', '"
                 + strDesc + "', '"
                 + strDateOpened + "', '"
                 + strDateClosed + "', '"
                 + strStatus + "')");
     }catch(SQLException e){
         System.out.println(e);
     }
     
 }
 public void deleteRecord(){}
 public void updateRecord(){}
 public void viewRecords(){}
    
}
