/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package finalsoop;

import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.JTextField;

public class SchoolYearController {

    dbManager db = new dbManager(finalsConnect.Connect());

    public void schoolYearValidator(JTextField txtSchoolYear, Boolean boolAdd, JTable tblManagement, JTable populatedTable, String pnlManagement) {

        String schoolYear = txtSchoolYear.getText();

        if (!schoolYear.contains("-")) {
            JOptionPane.showMessageDialog(null, "Please enter a valid school year range (e.g., 2021-2022).");
            return;
        }

        if (schoolYear.contains("-")) {
            String[] years = schoolYear.split("-");

            if (years.length == 2) {
                try {
                    int startYear = Integer.parseInt(years[0].trim());
                    int endYear = Integer.parseInt(years[1].trim());

                    if (startYear > endYear) {
                        JOptionPane.showMessageDialog(null, "Invalid school year format.");
                        return;
                    }

                    if (endYear - startYear >= 2) {
                        JOptionPane.showMessageDialog(null, "Invalid school year format.");
                        return;
                    }
                } catch (NumberFormatException e) {
                    JOptionPane.showMessageDialog(null, "Invalid school year format.");
                    return;
                }
            }
        }

        if (boolAdd) {
            db.addSchoolYear(schoolYear);
        } else {
            int row = tblManagement.getSelectedRow();
            if (row != -1) {
                String oldSchoolYear = tblManagement.getModel().getValueAt(row, 0).toString();
                db.updateSchoolYear(oldSchoolYear, schoolYear);
            } else {
                JOptionPane.showMessageDialog(null, "No record selected to update");
                return;
            }
        }

    }

    public void editSchoolYear(JTable tblManagement) {
        int row = tblManagement.getSelectedRow();
        if (row == -1) {
            JOptionPane.showMessageDialog(null, "No record selected");
            return;
        }
    }

}
