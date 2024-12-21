/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package finalsoop;

import javax.swing.JTextField;
import javax.swing.JComboBox;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import javax.swing.JTable;
/**
 *
 * @author tulan
 */
public class StudentController {
    dbManager db = new dbManager(finalsConnect.Connect());
    String cachedStudentNo = "";
    String genderTransformed;
    String statusTransformed;
    public void cacheOldStudentNo(String oldStudentNo){
        cachedStudentNo = oldStudentNo;
    }
    public void populateCourseOptions(JComboBox CourseCode){
        //populating the combo boxes
        try {
            ResultSet rs = db.fetchCourses();
            while(rs.next()){
                CourseCode.addItem(rs.getString("description"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void transformComboBoxes(JComboBox Gender, JComboBox Status){
        //Transforming hardcoded values from the combo box to match the value needed by the database
        genderTransformed = switch(Gender.getSelectedItem().toString().trim()){
             case "Male" ->
                 "M";
             case "Female" ->
                 "F";
             default ->
                 "";
         };
         statusTransformed = switch(Status.getSelectedItem().toString().trim()){
             case "Active" ->
                 "A";
             case "Inactive"->
                 "I";
             default ->
                 "";
         };
    }
    public void btnAddStudent (JTextField StudentNo, 
             JTextField LastName, 
             JTextField FirstName, 
             JTextField Email, 
             JComboBox Gender, 
             JComboBox CourseCode, 
             JTextField CpNumber, 
             JTextField Address, 
             JTextField Birthday, 
             JComboBox Status, 
             JTextField DateStarted, 
             JTextField DateGraduated) throws Exception {
         transformComboBoxes(Gender, Status);
         db.addStudent(StudentNo.getText().trim(), 
                 LastName.getText().trim(), 
                 FirstName.getText(), 
                 Email.getText(), 
                 genderTransformed, 
                 "(SELECT course_code FROM finalsoop.course WHERE description = '" + CourseCode.getSelectedItem().toString().trim() + "')", 
                 CpNumber.getText().trim(), 
                 Address.getText().trim(), 
                 Birthday.getText().trim(), 
                 statusTransformed, 
                 DateStarted.getText().trim(), 
                 DateGraduated.getText().trim());
     }
     public void btnSetFields(JTable Table,
             JTextField StudentNo, 
             JTextField LastName, 
             JTextField FirstName, 
             JTextField Email, 
             JComboBox Gender, 
             JComboBox CourseCode, 
             JTextField CpNumber, 
             JTextField Address, 
             JTextField Birthday, 
             JComboBox Status, 
             JTextField DateStarted, 
             JTextField DateGraduated){
         
         //Setting value of the fields based on the selectd row
         int row = Table.getSelectedRow();
         if(row != -1){
                String studentNumber = Table.getModel().getValueAt(row, 0).toString();
                String lastName = Table.getModel().getValueAt(row, 1).toString();
                String firstName = Table.getModel().getValueAt(row, 2).toString();
                String email = Table.getModel().getValueAt(row, 3).toString();
                String gender = Table.getModel().getValueAt(row, 4).toString();
                String courseCode = findItemInResultSet(db.fetchCourses(), Table.getModel().getValueAt(row, 5).toString(), "course_code", "description");
                String cpNumber = Table.getModel().getValueAt(row, 6).toString();
                String address = Table.getModel().getValueAt(row, 7).toString();
                String birthday = Table.getModel().getValueAt(row, 8).toString();
                String status = Table.getModel().getValueAt(row, 9).toString();
                String dateStarted = Table.getModel().getValueAt(row, 10).toString();
                String dateGraduated = Table.getModel().getValueAt(row, 11).toString();

                StudentNo.setText(studentNumber);
                LastName.setText(lastName);
                FirstName.setText(firstName);
                Email.setText(email);
                Gender.setSelectedItem((gender.equals("Male")) ? "M" : "F");
                CourseCode.setSelectedItem(courseCode);
                CpNumber.setText(cpNumber);
                Address.setText(address);
                Birthday.setText(birthday);
                Status.setSelectedItem((status.equals("A") ? "Active" : "Inactive"));
                DateStarted.setText(dateStarted);
                DateGraduated.setText(dateGraduated);

                cacheOldStudentNo(studentNumber);
         }else{
             JOptionPane.showMessageDialog(null, "No record selected to update");
         }
     }
     public void btnUpdateStudent(JTextField StudentNo, 
             JTextField LastName, 
             JTextField FirstName, 
             JTextField Email, 
             JComboBox Gender, 
             JComboBox CourseCode, 
             JTextField CpNumber, 
             JTextField Address, 
             JTextField Birthday, 
             JComboBox Status, 
             JTextField DateStarted, 
             JTextField DateGraduated) throws Exception{
        
        //basically, i want transform the values of the combo boxes into a format accepted by the query before running the query
        transformComboBoxes(Gender, Status);
        db.updateStudent(cachedStudentNo, 
                StudentNo.getText().trim(), 
                LastName.getText().trim(), 
                FirstName.getText(), 
                Email.getText(), 
                genderTransformed, 
                "(SELECT course_code FROM finalsoop.course WHERE description = '" + CourseCode.getSelectedItem().toString().trim() + "')", 
                CpNumber.getText().trim(), 
                Address.getText().trim(), 
                Birthday.getText().trim(), 
                statusTransformed, 
                DateStarted.getText().trim(), 
                DateGraduated.getText().trim());
     }
     
     public void btnDeleteStudent(JTable Table) throws Exception{
         int row = Table.getSelectedRow();
            String studentNumber = Table.getModel().getValueAt(row, 0).toString();
         
            db.deleteStudent(studentNumber);
     }
     
     //you can re-use this function
     //it accepts a resultset(e.g. db.fetchStudents(), db.fetchColleges()) and it takes in a value from columnName then finds the related value from targetColumn
     //for example, 
     //columnName | targetColumn
     //  tim      |  tulang
     
     //by running findItemInResultSet(db.fetchTimTulang(), tim, columnName, targetColumn), i am able to retrieve the string "tulang"
     public String findItemInResultSet(ResultSet rs, String targetValue, String columnName, String targetColumn) {
        try {
            while (rs.next()) {
                String value = rs.getString(columnName);
                if (value.equals(targetValue)) {
                    value = rs.getString(targetColumn);
                    return value;
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
}
