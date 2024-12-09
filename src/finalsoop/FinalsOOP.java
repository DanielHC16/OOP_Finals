package finalsoop;
import java.sql.*;
import javax.swing.*;
import com.formdev.flatlaf.FlatLightLaf;

public class FinalsOOP {

 Connection conn = new finalsConnect().Connect();
 public static void main(String[] args) {
        try {
            // Set FlatLaf as the Look and Feel
            UIManager.setLookAndFeel(new FlatLightLaf());
        } catch (Exception ex) {
            System.err.println("Failed to initialize FlatLaf");
            ex.printStackTrace();
        }
        FinalsOOP op = new FinalsOOP();
        schoolManagementMainUI ms = new schoolManagementMainUI();
        ms.setVisible(true);
    }
 public void deleteRecord(){}
 public void updateRecord(){}
 public void viewRecords(){}
    
}
