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
public void addSchoolYear(String syear) {
	 try (Statement ps = conn.createStatement()) {
		 ps.execute("INSERT INTO finalsoop.schoolyear(syear) VALUES ('" + syear + "')");
	 } catch (SQLException e) {
		 System.out.println(e);
	}
}
 public void addSemester(String semester) {
	 try (Statement ps = conn.createStatement()) {
		 ps.execute("INSERT INTO finalsoop.semester(semester) VALUES ('" + semester + "')");
	} catch (SQLException e) {
		System.out.println(e);
	}
}
public void addCourse(String courseCode, String description, String collegeCode, String dateOpened, String dateClosed, String status) {
	try (Statement ps = conn.createStatement()) {
		ps.execute("INSERT INTO finalsoop.course(course_code, description, college_code, date_opened, date_closed, status) VALUES ('"
				+ courseCode + "', '"
				+ description + "', '"
				+ collegeCode + "', '"
				+ dateOpened + "', '"
				+ dateClosed + "', '"
				+ status + "')");
	} catch (SQLException e) {
		System.out.println(e);
	}
}
public void addStudent(String studentNo, String lastName, String firstName, String email, String gender, String courseCode, String cpNum, String address, String bday, String status, String dateStarted, String dateGraduated) {
    try (Statement ps = conn.createStatement()) {
        ps.execute("INSERT INTO finalsoop.student(student_no, lastname, firstname, email, gender, course_code, cp_num, address, bday, status, date_started, date_graduated) VALUES ('"
                + studentNo + "', '"
                + lastName + "', '"
                + firstName + "', '"
                + email + "', '"
                + gender + "', '"
                + courseCode + "', '"
                + cpNum + "', '"
                + address + "', '"
                + bday + "', '"
                + status + "', '"
                + dateStarted + "', '"
                + dateGraduated + "')");
    } catch (SQLException e) {
        System.out.println(e);
    }
}
public void addEmployee(String employeeId, String lastName, String firstName, String email, String gender, String cpNum, String address, String bday, String status, String dateStarted, String dateResigned) {
    try (Statement ps = conn.createStatement()) {
        ps.execute("INSERT INTO finalsoop.employee(employee_id, lastname, firstname, email, gender, cp_num, address, bday, status, date_started, date_resigned) VALUES ('"
                + employeeId + "', '"
                + lastName + "', '"
                + firstName + "', '"
                + email + "', '"
                + gender + "', '"
                + cpNum + "', '"
                + address + "', '"
                + bday + "', '"
                + status + "', '"
                + dateStarted + "', '"
                + dateResigned + "')");
    } catch (SQLException e) {
        System.out.println(e);
    }
}
public void addSubject(String subjectCode, String description, int units, String curriculum, String collegeCode, String status, String dateOpened, String dateClosed) {
    try (Statement ps = conn.createStatement()) {
        ps.execute("INSERT INTO finalsoop.subject(subject_code, description, units, curriculum, college_code, status, date_opened, date_closed) VALUES ('"
                + subjectCode + "', '"
                + description + "', "
                + units + ", '"
                + curriculum + "', '"
                + collegeCode + "', '"
                + status + "', '"
                + dateOpened + "', '"
                + dateClosed + "')");
    } catch (SQLException e) {
        System.out.println(e);
    }
}
public void addSubjectSchedule(String syear, String semester, String collegeCode, String blockNo, String subjectCode, String day, String time, String room, String type, int sequenceNo, String employeeId) {
    try (Statement ps = conn.createStatement()) {
        ps.execute("INSERT INTO finalsoop.subject_schedule(syear, semester, college_code, block_no, subject_code, day, time, room, type, sequence_no, employee_id) VALUES ('"
                + syear + "', '"
                + semester + "', '"
                + collegeCode + "', '"
                + blockNo + "', '"
                + subjectCode + "', '"
                + day + "', '"
                + time + "', '"
                + room + "', '"
                + type + "', "
                + sequenceNo + ", '"
                + employeeId + "')");
    } catch (SQLException e) {
        System.out.println(e);
    }
}
public void addGrade(String syear, String semester, String studentNo, String subjectCode, String blockNo, double grade) {
    try (Statement ps = conn.createStatement()) {
        ps.execute("INSERT INTO finalsoop.grades(syear, semester, student_no, subject_code, block_no, grade) VALUES ('"
                + syear + "', '"
                + semester + "', '"
                + studentNo + "', '"
                + subjectCode + "', '"
                + blockNo + "', "
                + grade + ")");
    } catch (SQLException e) {
        System.out.println(e);
    }
}

 public void deleteRecord(){}
 public void updateRecord(){}
 public void viewRecords(){}
    
}
