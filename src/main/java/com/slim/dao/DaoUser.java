package com.slim.dao;

import java.util.List;

import com.slim.beans.Professor;
import com.slim.beans.Student;

public interface DaoUser {
	void addStudent(Student student);
	void addProfessor(Professor professor);
	void deleteStudent(String studentID);
	void deleteProfessor(String professorID);
	List<Student> getStudents();
	List<Professor> getProfessors();
}
