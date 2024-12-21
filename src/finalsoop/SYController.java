/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package finalsoop;

import java.sql.Connection;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.JTextField;

/**
 *
 * @author ihate
 */
public class SYController {
    
    private Connection conn = finalsConnect.Connect();
    private dbManager db = new dbManager(conn);

    public void btnAddSY(JTextField txtSY, JTable populatedTable ){
            
            db.addSchoolYear(
                txtSY.getText().trim()
            );

            txtSY.setText("");

            db.populateTable(db.fetchSchoolYears(), populatedTable);
            
        }
    
    
    }
