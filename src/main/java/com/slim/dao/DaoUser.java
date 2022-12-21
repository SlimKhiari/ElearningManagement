package com.slim.dao;

import java.util.List;

import com.slim.beans.Student;

public interface DaoUser {
	void addStudent(Student student);
	void deleteStudent(String studentID);
	List<Student> getStudents();
}
