package com.slim.dao;

import java.util.List;

import com.slim.beans.Professor;
import com.slim.beans.Student;
import com.slim.beans.Course;
import com.slim.beans.Exam;

public interface DaoUser {
	void addStudent(Student student);
	void addProfessor(Professor professor);
	void deleteStudent(String studentID);
	List<Student> getStudents();
	List<Student> getStudentsByPromoID(String promoID);
    public Student getStudentBystudentID(String studentID);
    void updateStudentPassword(String password, String studentID);
	List<Professor> getProfessors();
	void deleteProfessor(String professorID);
	
	void attendanceTracker(Course course);
	void attendanceTrackerCorrected(Course course);
	List<Course> getAttendanceFromDBByStudentID(String studentID);
	
	boolean isInDB(String login, String password, int studentOrProfessor);
	
	void saveMarkInDB(Exam exam);
	void deleteMarkFromDB(String subject,String studentID);
	List<Exam> getMarksFromDBBySubject(String subject);
	public 	List<Exam> getMarksFromDBByStudentID(String studentID);

	void saveFilesName(String fileName, String section);
	List<String> getFilesName(String section);
	
	String getSectionByStudentID(String studentID);
}
