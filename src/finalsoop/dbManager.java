package finalsoop;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

/**
 * Database manager class that handles all database operations for the student
 * information system.
 * Provides methods to add and manage records in the following tables:
 * - college
 * - schoolyear
 * - semester
 * - course
 * - student
 */
public class dbManager {
	/**
	 * Constructs a new database manager with the specified connection.
	 * 
	 * @param conn Active database connection
	 */
	public dbManager(Connection conn) {
		this.conn = conn;
	}

	public void populateTable(ResultSet rs, javax.swing.JTable table) {
		try {
			DefaultTableModel model = new DefaultTableModel();
			int columnCount = rs.getMetaData().getColumnCount();

			for (int i = 1; i <= columnCount; i++) {
				model.addColumn(rs.getMetaData().getColumnLabel(i));
			}
			while (rs.next()) {
				Object[] row = new Object[columnCount];
				for (int i = 1; i <= columnCount; i++) {
					row[i - 1] = rs.getObject(i);
				}
				model.addRow(row);
			}
			table.setModel(model);
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

	private Connection conn;

	/**
	 * Adds a record to the `college` table.
	 *
	 * @param strCollegeCode the college code
	 * @param strDesc        the description of the college
	 * @param strDateOpened  the date the college was opened
	 * @param strDateClosed  the date the college was closed
	 * @param strStatus      the status of the college
	 */
	public void addCollegeRecord(String strCollegeCode, String strDesc, String strDateOpened, String strDateClosed,
			String strStatus) {
		Statement ps = null;
		try {
			ps = conn.createStatement();
			ps.execute(
					"INSERT INTO finalsoop.college(college_code, description, date_opened, date_closed, status) VALUES ('"
							+ strCollegeCode + "', '"
							+ strDesc + "', '"
							+ strDateOpened + "', '"
							+ strDateClosed + "', '"
							+ strStatus + "')");
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

	/**
	 * Adds a new school year record to the database.
	 * 
	 * @param strYear The school year to add (e.g. "2023-2024")
	 */
	public void addSchoolYear(String strYear) {
		try (Statement ps = conn.createStatement()) {
			ps.execute("INSERT INTO finalsoop.schoolyear(syear) VALUES ('" + strYear + "')");
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

	/**
	 * Adds a new school year record to the database.
	 * 
	 * @param strYear The school year to add (e.g. "2023-2024")
	 */
	public void addSemester(String strSemester) {
		try (Statement ps = conn.createStatement()) {
			ps.execute("INSERT INTO finalsoop.semester(semester) VALUES ('" + strSemester + "')");
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

	/**
	 * Adds a new course record to the database.
	 * 
	 * @param strCourseCode  Unique identifier for the course
	 * @param strDescription Course name/description
	 * @param strCollegeCode Foreign key reference to college table
	 * @param strDateOpened  Date when course was opened
	 * @param strDateClosed  Date when course was closed/discontinued
	 * @param strStatus      Current status of the course (e.g. "Active",
	 *                       "Inactive")
	 */
	public void addCourse(String strCourseCode, String strDescription, String strCollegeCode, String strDateOpened,
			String strDateClosed, String strStatus) {
		try (Statement ps = conn.createStatement()) {
			ps.execute(
					"INSERT INTO finalsoop.course(course_code, description, college_code, date_opened, date_closed, status) VALUES ('"
							+ strCourseCode + "', '"
							+ strDescription + "', '"
							+ strCollegeCode + "', '"
							+ strDateOpened + "', '"
							+ strDateClosed + "', '"
							+ strStatus + "')");
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

	/**
	 * Adds a new course record to the database.
	 * 
	 * @param strCourseCode  Unique identifier for the course
	 * @param strDescription Course name/description
	 * @param strCollegeCode Foreign key reference to college table
	 * @param strDateOpened  Date when course was opened
	 * @param strDateClosed  Date when course was closed/discontinued
	 * @param strStatus      Current status of the course (e.g. "Active",
	 *                       "Inactive")
	 */
	public void addStudent(String strStudentNo, String strLastName, String strFirstName, String strEmail,
			String strGender, String strCourseCode, String strCpNum, String strAddress, String strBday,
			String strStatus, String strDateStarted, String strDateGraduated) {
		try (Statement ps = conn.createStatement()) {
			ps.execute(
					"INSERT INTO finalsoop.student(student_no, lastname, firstname, email, gender, course_code, cp_num, address, bday, status, date_started, date_graduated) VALUES ('"
							+ strStudentNo + "', '"
							+ strLastName + "', '"
							+ strFirstName + "', '"
							+ strEmail + "', '"
							+ strGender + "', '"
							+ strCourseCode + "', '"
							+ strCpNum + "', '"
							+ strAddress + "', '"
							+ strBday + "', '"
							+ strStatus + "', '"
							+ strDateStarted + "', '"
							+ strDateGraduated + "')");
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

	/**
	 * Adds a new employee record to the database.
	 * 
	 * @param strEmployeeId   Unique employee ID
	 * @param strLastName     Employee's last name
	 * @param strFirstName    Employee's first name
	 * @param strEmail        Employee's email address
	 * @param strGender       Employee's gender
	 * @param strCpNum        Employee's contact number
	 * @param strAddress      Employee's address
	 * @param strBday         Employee's birth date
	 * @param strStatus       Current employment status
	 * @param strDateStarted  Employment start date
	 * @param strDateResigned Employment end date or null
	 */
	public void addEmployee(String strEmployeeId, String strLastName, String strFirstName, String strEmail,
			String strGender, String strCpNum, String strAddress, String strBday, String strStatus,
			String strDateStarted, String strDateResigned) {
		try (Statement ps = conn.createStatement()) {
			ps.execute(
					"INSERT INTO finalsoop.employee(employee_id, lastname, firstname, email, gender, cp_num, address, bday, status, date_started, date_resigned) VALUES ('"
							+ strEmployeeId + "', '"
							+ strLastName + "', '"
							+ strFirstName + "', '"
							+ strEmail + "', '"
							+ strGender + "', '"
							+ strCpNum + "', '"
							+ strAddress + "', '"
							+ strBday + "', '"
							+ strStatus + "', '"
							+ strDateStarted + "', '"
							+ strDateResigned + "')");
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

	/**
	 * Adds a new subject to the curriculum.
	 * 
	 * @param strSubjectCode Unique subject identifier
	 * @param strDescription Subject name/description
	 * @param intUnits       Number of units for the subject
	 * @param strCurriculum  Curriculum version
	 * @param strCollegeCode College offering the subject
	 * @param strStatus      Subject status (Active/Inactive)
	 * @param strDateOpened  Date subject was introduced
	 * @param strDateClosed  Date subject was discontinued
	 */
	public void addSubject(String strSubjectCode, String strDescription, int intUnits, String strCurriculum,
			String strCollegeCode, String strStatus, String strDateOpened, String strDateClosed) {
		try (Statement ps = conn.createStatement()) {
			ps.execute(
					"INSERT INTO finalsoop.subject(subject_code, description, units, curriculum, college_code, status, date_opened, date_closed) VALUES ('"
							+ strSubjectCode + "', '"
							+ strDescription + "', "
							+ intUnits + ", '"
							+ strCurriculum + "', '"
							+ strCollegeCode + "', '"
							+ strStatus + "', '"
							+ strDateOpened + "', '"
							+ strDateClosed + "')");
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

	/**
	 * Creates a new subject schedule entry.
	 * 
	 * @param strSyear       School year
	 * @param strSemester    Semester period
	 * @param strCollegeCode College offering the subject
	 * @param strBlockNo     Block/section number
	 * @param strSubjectCode Subject identifier
	 * @param strDay         Day(s) of the week
	 * @param strTime        Time slot
	 * @param strRoom        Room assignment
	 * @param strType        Class type (Lecture/Laboratory)
	 * @param intSequenceNo  Sequence number
	 * @param strEmployeeId  Assigned faculty
	 */
	public void addSubjectSchedule(String strSyear, String strSemester, String strCollegeCode, String strBlockNo,
			String strSubjectCode, String strDay, String strTime, String strRoom, String strType, int intSequenceNo,
			String strEmployeeId) {
		try (Statement ps = conn.createStatement()) {
			ps.execute(
					"INSERT INTO finalsoop.subject_schedule(syear, semester, college_code, block_no, subject_code, day, time, room, type, sequence_no, employee_id) VALUES ('"
							+ strSyear + "', '"
							+ strSemester + "', "
							+ strCollegeCode + ", '"
							+ strBlockNo + "', "
							+ strSubjectCode + ", '"
							+ strDay + "', '"
							+ strTime + "', '"
							+ strRoom + "', '"
							+ strType + "', "
							+ intSequenceNo + ", "
							+ strEmployeeId + ")");
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

	/**
	 * Records a student's grade for a subject.
	 * 
	 * @param strSyear       School year
	 * @param strSemester    Semester period
	 * @param strStudentNo   Student number
	 * @param strSubjectCode Subject code
	 * @param strBlockNo     Block/section number
	 * @param dblGrade       Numerical grade
	 */
	public void addGrade(String strSyear, String strSemester, String strStudentNo, String strSubjectCode,
			String strBlockNo, double dblGrade) {
		try (Statement ps = conn.createStatement()) {
			ps.execute(
					"INSERT INTO finalsoop.grades(syear, semester, student_no, subject_code, block_no, grade) VALUES ('"
							+ strSyear + "', '"
							+ strSemester + "', '"
							+ strStudentNo + "', '"
							+ strSubjectCode + "', '"
							+ strBlockNo + "', "
							+ dblGrade + ")");
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

	/**
	 * Retrieves all colleges from the database.
	 * 
	 * @return ResultSet containing college records
	 */
	public ResultSet fetchColleges() {
		try {
			Statement ps = conn.createStatement();
			return ps.executeQuery("SELECT * FROM finalsoop.college");
		} catch (SQLException e) {
			System.out.println(e);
		}
		return null;
	}

	/**
	 * Retrieves all school years from the database.
	 * 
	 * @return ResultSet containing school year records
	 */
	public ResultSet fetchSchoolYears() {
		try {
			Statement ps = conn.createStatement();
			return ps.executeQuery("SELECT * FROM finalsoop.schoolyear");
		} catch (SQLException e) {
			System.out.println(e);
		}
		return null;
	}

	/**
	 * Retrieves all semesters from the database.
	 * 
	 * @return ResultSet containing semester records
	 */
	public ResultSet fetchSemesters() {
		try {
			Statement ps = conn.createStatement();
			return ps.executeQuery("SELECT * FROM finalsoop.semester");
		} catch (SQLException e) {
			System.out.println(e);
		}
		return null;
	}

	/**
	 * Retrieves all courses from the database.
	 * 
	 * @return ResultSet containing course records
	 */
	public ResultSet fetchCourses() {
		try {
			Statement ps = conn.createStatement();
			return ps.executeQuery("SELECT * FROM finalsoop.course");
		} catch (SQLException e) {
			System.out.println(e);
		}
		return null;
	}

	/**
	 * Retrieves all students from the database.
	 * 
	 * @return ResultSet containing student records
	 */
	public ResultSet fetchStudents() {
		try {
			Statement ps = conn.createStatement();
			return ps.executeQuery("SELECT * FROM finalsoop.student");
		} catch (SQLException e) {
			System.out.println(e);
		}
		return null;
	}

	/**
	 * Retrieves all employees from the database.
	 * 
	 * @return ResultSet containing employee records
	 */
	public ResultSet fetchEmployees() {
		try {
			Statement ps = conn.createStatement();
			return ps.executeQuery("SELECT * FROM finalsoop.employee");
		} catch (SQLException e) {
			System.out.println(e);
		}
		return null;
	}

	/**
	 * Retrieves all subjects from the database.
	 * 
	 * @return ResultSet containing subject records
	 */
	public ResultSet fetchSubjects() {
		try {
			Statement ps = conn.createStatement();
			return ps.executeQuery("SELECT * FROM finalsoop.subject");
		} catch (SQLException e) {
			System.out.println(e);
		}
		return null;
	}

	/**
	 * Retrieves all subject schedules from the database.
	 * 
	 * @return ResultSet containing subject schedule records
	 */
	public ResultSet fetchSubjectSchedules() {
		try {
			Statement ps = conn.createStatement();
			return ps.executeQuery("SELECT * FROM finalsoop.subject_schedule_view");
		} catch (SQLException e) {
			System.out.println(e);
		}
		return null;
	}

	/**
	 * Retrieves all grades from the database.
	 * 
	 * @return ResultSet containing grade records
	 */
	public ResultSet fetchGrades() {
		try {
			Statement ps = conn.createStatement();
			return ps.executeQuery("SELECT * FROM finalsoop.student_grades_view");
		} catch (SQLException e) {
			System.out.println(e);
		}
		return null;
	}

	/**
	 * Deletes a college record from the database.
	 * 
	 * @param strCollegeCode 
	 * @param strDescription 
         * @param strDateOpened 
         * @param strDateClosed  
         * @param strStatus   
	 */
	public void deleteCollege(String strCollegeCode, String strDescription, String strDateOpened, String strDateClosed, String strStatus) {
            try (Statement ps = conn.createStatement()) {
                ps.execute ("DELETE FROM finalsoop.college WHERE "
                                + "college_code = '" + strCollegeCode + 
                                "' AND description = '" + strDescription + 
                                "' AND date_opened = '" + strDateOpened + 
                                "' AND date_closed = '" + strDateClosed + 
                                "' AND status = '" + strStatus + "'"
                );
                

            } catch (SQLException e) {
                e.printStackTrace();
                System.out.println("Error deleting record: " + e.getMessage());
            }
        }


	/**
	 * Deletes a school year record from the database.
	 * 
	 * @param strSyear School year to delete
	 */
	public void deleteSchoolYear(String strSyear) {
		try (Statement ps = conn.createStatement()) {
			ps.execute("DELETE FROM finalsoop.schoolyear WHERE syear = '" + strSyear + "'");
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

	/**
	 * Deletes a semester record from the database.
	 * 
	 * @param strSemester Semester to delete
	 */
	public void deleteSemester(String strSemester) {
		try (Statement ps = conn.createStatement()) {
			ps.execute("DELETE FROM finalsoop.semester WHERE semester = '" + strSemester + "'");
		} catch (SQLException e) {
			JOptionPane.showMessageDialog(null, "An error occurred: " + e.getMessage());
                        e.printStackTrace();
		}
	}

	/**
	 * Deletes a course record from the database.
	 * 
	 * @param strCourseCode Course code to delete
	 */
	public void deleteCourse(String strCourseCode) {
		try (Statement ps = conn.createStatement()) {
			ps.execute("DELETE FROM finalsoop.course WHERE course_code = '" + strCourseCode + "'");
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

	/**
	 * Deletes a student record from the database.
	 * 
	 * @param strStudentNo Student number to delete
	 */
	public void deleteStudent(String strStudentNo) {
		try (Statement ps = conn.createStatement()) {
			ps.execute("DELETE FROM finalsoop.student WHERE student_no = '" + strStudentNo + "'");
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

	/**
	 * Deletes an employee record from the database.
	 * 
	 * @param strEmployeeId Employee ID to delete
	 */
	public void deleteEmployee(String strEmployeeId) {
		try (Statement ps = conn.createStatement()) {
			ps.execute("DELETE FROM finalsoop.employee WHERE employee_id = '" + strEmployeeId + "'");
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

	/**
	 * Deletes a subject record from the database.
	 * 
	 * @param strSubjectCode Subject code to delete
	 */
	public void deleteSubject(String strSubjectCode) {
		try (Statement ps = conn.createStatement()) {
			ps.execute("DELETE FROM finalsoop.subject WHERE subject_code = '" + strSubjectCode + "'");
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

	/**
	 * Deletes a subject schedule record from the database.
	 * 
	 * @param strSubjectCode Subject Code of schedule to delete
         * @param strCollegeCode College Code of schedule to delete
         * @param strSequenceNo  Sequence Number of schedule to delete
         * @param strBlockNo     BlockNo of schedule to delete
         * @param strSemester    Semester of schedule to delete
         * @param strSYear       School year of schedule to delete
	 */
	public void deleteSubjectSchedule(String strSubjectCode, String strCollegeCode, String strSequenceNo, String strBlockNo, String strSemester, String strSYear) {
		try (Statement ps = conn.createStatement()) {
			ps.execute("DELETE FROM finalsoop.subject_schedule WHERE "
                                + "subject_code = '" + strSubjectCode + 
                                "' AND college_code = '" + strCollegeCode + 
                                "' AND syear = '" + strSYear +
                                "' AND semester = '" + strSemester + 
                                "' AND block_no = '" + strBlockNo +
                                "' AND sequence_no = " + strSequenceNo
                        );
		} catch (SQLException e) { 
			System.out.println(e);
		}
	}

	public void deleteGrade(String strSyear, String strSemester, String strStudentNo, String strSubjectCode) {
		try (Statement ps = conn.createStatement()) {
			ps.execute("DELETE FROM finalsoop.grades WHERE syear = '" + strSyear + "' AND semester = '" + strSemester
					+ "' AND student_no = '"
					+ strStudentNo + "' AND subject_code = '" + strSubjectCode + "'");
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

	/**
	 * Updates a college record in the database.
	 * 
	 * @param strCollegeCode College code to update
	 * @param strDesc        New description
	 * @param strDateOpened  New date opened
	 * @param strDateClosed  New date closed
	 * @param strStatus      New status
	 */
	public void updateCollege(String strCollegeCode, String strDesc, String strDateOpened, String strDateClosed,
			String strStatus) {
		try (Statement ps = conn.createStatement()) {
			ps.execute("UPDATE finalsoop.college SET description = '" + strDesc + "', date_opened = '" + strDateOpened
					+ "', date_closed = '" + strDateClosed + "', status = '" + strStatus
					+ "' WHERE college_code = '" + strCollegeCode + "'");
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

	/**
	 * Updates a school year record in the database.
	 * 
	 * @param strSyear    Current school year to update
	 * @param strNewSyear New school year value
	 */
	public void updateSchoolYear(String strSyear, String strNewSyear) {
		try (Statement ps = conn.createStatement()) {
			ps.execute(
					"UPDATE finalsoop.schoolyear SET syear = '" + strNewSyear + "' WHERE syear = '" + strSyear + "'");
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

	/**
	 * Updates a semester record in the database.
	 * 
	 * @param strSemester    Current semester to update
	 * @param strNewSemester New semester value
	 */
	public void updateSemester(String strSemester, String strNewSemester) {
		try (Statement ps = conn.createStatement()) {
			ps.execute("UPDATE finalsoop.semester SET semester = '" + strNewSemester + "' WHERE semester = '"
					+ strSemester + "'");
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

	/**
	 * Updates a course record in the database.
	 * 
	 * @param strCourseCode  Course code to update
	 * @param strDescription New course description
	 * @param strCollegeCode New college code
	 * @param strDateOpened  New date opened
	 * @param strDateClosed  New date closed
	 * @param strStatus      New status
	 */
	public void updateCourse(String strCourseCode, String strDescription, String strCollegeCode, String strDateOpened,
			String strDateClosed, String strStatus) {
		try (Statement ps = conn.createStatement()) {
			ps.execute("UPDATE finalsoop.course SET description = '" + strDescription + "', college_code = '"
					+ strCollegeCode
					+ "', date_opened = '" + strDateOpened + "', date_closed = '" + strDateClosed + "', status = '"
					+ strStatus
					+ "' WHERE course_code = '" + strCourseCode + "'");
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

	/**
	 * Updates a student record in the database.
	 * 
	 * @param strStudentNo     Student number to update
	 * @param strLastName      New last name
	 * @param strFirstName     New first name
	 * @param strEmail         New email address
	 * @param strGender        New gender
	 * @param strCourseCode    New course code
	 * @param strCpNum         New contact number
	 * @param strAddress       New address
	 * @param strBday          New birth date
	 * @param strStatus        New status
	 * @param strDateStarted   New start date
	 * @param strDateGraduated New graduation date
	 */
	public void updateStudent(String strStudentNo, String strLastName, String strFirstName, String strEmail,
			String strGender, String strCourseCode, String strCpNum, String strAddress, String strBday,
			String strStatus, String strDateStarted, String strDateGraduated) {
		try (Statement ps = conn.createStatement()) {
			ps.execute("UPDATE finalsoop.student SET lastname = '" + strLastName + "', firstname = '" + strFirstName
					+ "', email = '" + strEmail
					+ "', gender = '" + strGender + "', course_code = '" + strCourseCode + "', cp_num = '" + strCpNum
					+ "', address = '" + strAddress
					+ "', bday = '" + strBday + "', status = '" + strStatus + "', date_started = '" + strDateStarted
					+ "', date_graduated = '" + strDateGraduated
					+ "' WHERE student_no = '" + strStudentNo + "'");
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

	/**
	 * Updates an employee record in the database.
	 * 
	 * @param strEmployeeId   Employee ID to update
	 * @param strLastName     New last name
	 * @param strFirstName    New first name
	 * @param strEmail        New email address
	 * @param strGender       New gender
	 * @param strCpNum        New contact number
	 * @param strAddress      New address
	 * @param strBday         New birth date
	 * @param strStatus       New status
	 * @param strDateStarted  New start date
	 * @param strDateResigned New resignation date
	 */
	public void updateEmployee(String strEmployeeId, String strLastName, String strFirstName, String strEmail,
			String strGender, String strCpNum, String strAddress, String strBday, String strStatus,
			String strDateStarted, String strDateResigned) {
		try (Statement ps = conn.createStatement()) {
			ps.execute("UPDATE finalsoop.employee SET lastname = '" + strLastName + "', firstname = '" + strFirstName
					+ "', email = '" + strEmail
					+ "', gender = '" + strGender + "', cp_num = '" + strCpNum + "', address = '" + strAddress
					+ "', bday = '" + strBday + "', status = '"
					+ strStatus + "', date_started = '" + strDateStarted + "', date_resigned = '" + strDateResigned
					+ "' WHERE employee_id = '" + strEmployeeId + "'");
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

	/**
	 * Updates a subject record in the database.
	 * 
	 * @param strSubjectCode Subject code to update
	 * @param strDescription New description
	 * @param intUnits       New number of units
	 * @param strCurriculum  New curriculum
	 * @param strCollegeCode New college code
	 * @param strStatus      New status
	 * @param strDateOpened  New date opened
	 * @param strDateClosed  New date closed
	 */
	public void updateSubject(String strSubjectCode, String strDescription, int intUnits, String strCurriculum,
			String strCollegeCode, String strStatus, String strDateOpened, String strDateClosed) {
		try (Statement ps = conn.createStatement()) {
			ps.execute("UPDATE finalsoop.subject SET description = '" + strDescription + "', units = " + intUnits
					+ ", curriculum = '" + strCurriculum
					+ "', college_code = '" + strCollegeCode + "', status = '" + strStatus + "', date_opened = '"
					+ strDateOpened + "', date_closed = '" + strDateClosed
					+ "' WHERE subject_code = '" + strSubjectCode + "'");
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

	/**
	 * Updates a subject schedule record in the database.
	 * 
	 * @param intSequenceNo  Sequence number to update
	 * @param strSYear       New school year
	 * @param strSemester    New semester
	 * @param strCollegeCode New college code
	 * @param strBlockNo     New block number
	 * @param strSubjectCode New subject code
	 * @param strDay         New day
	 * @param strTime        New time
	 * @param strRoom        New room
	 * @param strType        New type
	 * @param strEmployeeId  New employee ID
	 */
	public void updateSubjectSchedule(String strSYear, String strSemester, String strCollegeCode, String strBlockNo,
			String strSubjectCode, String strDay, String strTime, String strRoom, String strType, int intSequenceNo,
			String strEmployeeId) {
		try (Statement ps = conn.createStatement()) {
			ps.execute("UPDATE finalsoop.subject_schedule SET syear = '" + strSYear + "', semester = '" + strSemester
					+ "', college_code = " + strCollegeCode
					+ ", block_no = '" + strBlockNo + "', subject_code = " + strSubjectCode + ", day = '" + strDay
					+ "', time = '" + strTime
					+ "', room = '" + strRoom 
                                        + "', type = '" + strType 
                                        + "', employee_id = " + strEmployeeId
                                        + ", sequence_no = " + intSequenceNo
					+ " WHERE subject_code = " + strSubjectCode + 
                                            " AND college_code = " + strCollegeCode + 
                                            " AND syear = '" + strSYear +
                                            "' AND semester = '" + strSemester + 
                                            "' AND block_no = '" + strBlockNo +
                                            "' AND sequence_no = " + intSequenceNo);
		} catch (SQLException e) {
			System.out.println(e);
                        System.out.println("UPDATE finalsoop.subject_schedule SET syear = '" + strSYear + "', semester = '" + strSemester
					+ "', college_code = '" + strCollegeCode
					+ "', block_no = '" + strBlockNo + "', subject_code = " + strSubjectCode + ", day = '" + strDay
					+ "', time = '" + strTime
					+ "', room = '" + strRoom 
                                        + "', type = '" + strType 
                                        + "', employee_id = " + strEmployeeId
                                        + ", sequence_no = " + intSequenceNo
					+ " WHERE subject_code = " + strSubjectCode + 
                                            " AND college_code = " + strCollegeCode + 
                                            " AND syear = '" + strSYear +
                                            "' AND semester = '" + strSemester + 
                                            "' AND block_no = '" + strBlockNo +
                                            "' AND sequence_no = " + intSequenceNo);
		}
	}

	/**
	 * Updates a grade record in the database.
	 * 
	 * @param strSyear       School year of the grade
	 * @param strSemester    Semester of the grade
	 * @param strStudentNo   Student number
	 * @param strSubjectCode Subject code
	 * @param strBlockNo     Block number
	 * @param dblGrade       New grade value
	 */
	public void updateGrade(String strSyear, String strSemester, String strStudentNo, String strSubjectCode,
			String strBlockNo, double dblGrade) {
		try (Statement ps = conn.createStatement()) {
			ps.execute("UPDATE finalsoop.grades SET grade = " + dblGrade + " WHERE syear = '" + strSyear
					+ "' AND semester = '" + strSemester
					+ "' AND student_no = '" + strStudentNo + "' AND subject_code = '" + strSubjectCode
					+ "' AND block_no = '" + strBlockNo + "'");
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

    void deleteCollege(String strCollegeCode, String strDescription, String strDateOpened, String strDateClosed) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
