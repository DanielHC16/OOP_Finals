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
public class SemController {
    
    private Connection conn = finalsConnect.Connect();
    private dbManager db = new dbManager(conn);

    public void btnAddSemester(JTextField txtSemester1, JTable populatedTable ){
            
            db.addSemester(
                txtSemester1.getText().trim()
            );

            txtSemester1.setText("");

            db.populateTable(db.fetchSemesters(), populatedTable);
            
        }
    
    
    }


//    btnSetFields
//    btnUpdateSemester
//    btnDeleteSemester
