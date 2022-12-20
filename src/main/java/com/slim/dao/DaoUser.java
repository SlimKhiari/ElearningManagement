package com.slim.dao;

import java.util.List;

import com.slim.beans.Student;

public interface DaoUser {
	void addStudent(Student student);
	List<Student> getStudents();
}
