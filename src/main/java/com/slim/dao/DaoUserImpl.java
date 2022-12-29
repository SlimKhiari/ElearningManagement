package com.slim.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.slim.beans.Professor;
import com.slim.beans.Student;
import com.slim.beans.Course;
import com.slim.beans.Exam;

public class DaoUserImpl implements DaoUser{
	private DaoFactory daoFactory;

		DaoUserImpl(DaoFactory daoFactory) {
	        this.daoFactory = daoFactory;
	    }

		@Override
		public void deleteStudent(String studentID)
		{
	        Connection connexion = null;
			PreparedStatement preparedStatement;
	        String query = "DELETE FROM students WHERE IDnumber=?";
	    	
			try {
				connexion = daoFactory.getConnection();
				preparedStatement = connexion.prepareStatement(query);
				preparedStatement.setNString(1, studentID);
				preparedStatement.execute();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		@Override
		public void deleteProfessor(String professorID)
		{
			Connection connexion = null;
			PreparedStatement preparedStatement;
	        String query = "DELETE FROM professors WHERE IDnumber=?";
	    	
			try {
				connexion = daoFactory.getConnection();
				preparedStatement = connexion.prepareStatement(query);
				preparedStatement.setNString(1, professorID);
				preparedStatement.execute();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	    @Override
	    public void addStudent(Student student)
	    {
	    	Connection connexion = null;
	    	PreparedStatement preparedStatement;
	    	
			try {
	            connexion = daoFactory.getConnection();
				preparedStatement = connexion.prepareStatement("INSERT INTO students(name,lastname,birthday,contact,section,IDnumber,password) VALUES(?,?,?,?,?,?,?);");
		    	preparedStatement.setString(1, student.getName());
		    	preparedStatement.setString(2, student.getLastname());
		    	preparedStatement.setString(3, student.getBirthday());
		    	preparedStatement.setString(4, student.getContact());
		    	preparedStatement.setString(5, student.getSection());
		    	preparedStatement.setString(6, student.getId());
		    	preparedStatement.setString(7, student.getPassword());
		    	preparedStatement.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	    }
	    
	    @Override
		public void addProfessor(Professor professor)
		{
	    	Connection connexion = null;
	    	PreparedStatement preparedStatement;
	    	
			try {
	            connexion = daoFactory.getConnection();
				preparedStatement = connexion.prepareStatement("INSERT INTO professors(name,lastname,birthday,contact,section,IDnumber,password) VALUES(?,?,?,?,?,?,?);");
		    	preparedStatement.setString(1, professor.getName());
		    	preparedStatement.setString(2, professor.getLastname());
		    	preparedStatement.setString(3, professor.getBirthday());
		    	preparedStatement.setString(4, professor.getContact());
		    	preparedStatement.setString(5, professor.getSection());
		    	preparedStatement.setString(6, professor.getId());
		    	preparedStatement.setString(7, professor.getPassword());		    	
		    	preparedStatement.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	    @Override
	    public List<Student> getStudents() {
	        List<Student> students = new ArrayList<Student>();
	        Statement statement = null;
	        ResultSet resultat = null;
	    	Connection connexion = null;

	        try {
	            connexion = daoFactory.getConnection();
	            statement = connexion.createStatement();
	            resultat = statement.executeQuery("SELECT id, name, lastname, birthday, contact, section, IDnumber FROM students;");

	            while (resultat.next()) {
	                String name = resultat.getString("name");
	                String lastname = resultat.getString("lastname");
	                String birthday = resultat.getString("birthday");
	                String contact = resultat.getString("contact");
	                String section = resultat.getString("section");
	                String id = resultat.getString("IDnumber");
	                               
	                Student student = new Student();
	                student.setName(name);
	                student.setLastname(lastname);
	                student.setBirthday(birthday);
	                student.setContact(contact);
	                student.setSection(section);
	                student.setId(id);

	                students.add(student);
	            }
	        } catch (SQLException e) {
	        } finally {
	            try {
	                if (resultat != null)
	                    resultat.close();
	                if (statement != null)
	                    statement.close();
	                if (connexion != null)
	                    connexion.close();
	            } catch (SQLException ignore) {
	            }
	        }
	        
	        return students;
	    }
	    
	    @Override
	    public List<Student> getStudentsByPromoID(String promoID)
	    {
	    	 	List<Student> students = new ArrayList<Student>();
	    	 	PreparedStatement preparedStatement = null;
		        ResultSet resultat = null;
		    	Connection connexion = null;
		    	String query = "SELECT id, name, lastname, birthday, contact, section, IDnumber FROM students WHERE section=?;";
		        try {
		            connexion = daoFactory.getConnection();
		            preparedStatement = connexion.prepareStatement(query);
					preparedStatement.setNString(1, promoID);
		            resultat = preparedStatement.executeQuery();

		            while (resultat.next()) {
		                String name = resultat.getString("name");
		                String lastname = resultat.getString("lastname");
		                String birthday = resultat.getString("birthday");
		                String contact = resultat.getString("contact");
		                String section = resultat.getString("section");
		                String id = resultat.getString("IDnumber");
		                               
		                Student student = new Student();
		                student.setName(name);
		                student.setLastname(lastname);
		                student.setBirthday(birthday);
		                student.setContact(contact);
		                student.setSection(section);
		                student.setId(id);

		                students.add(student);
		            }
		        } catch (SQLException e) {
		        } finally {
		            try {
		                if (resultat != null)
		                    resultat.close();
		                if (preparedStatement != null)
		                	preparedStatement.close();
		                if (connexion != null)
		                    connexion.close();
		            } catch (SQLException ignore) {
		            }
		        }
		        
		        return students;
	    }
	    
	    @Override
	    public List<Professor> getProfessors()
	    {
	    	    List<Professor> professors = new ArrayList<Professor>();
		        Statement statement = null;
		        ResultSet resultat = null;
		    	Connection connexion = null;

		        try {
		            connexion = daoFactory.getConnection();
		            statement = connexion.createStatement();
		            resultat = statement.executeQuery("SELECT id, name, lastname, birthday, contact, section, IDnumber FROM professors;");

		            while (resultat.next()) {
		                String name = resultat.getString("name");
		                String lastname = resultat.getString("lastname");
		                String birthday = resultat.getString("birthday");
		                String contact = resultat.getString("contact");
		                String section = resultat.getString("section");
		                String id = resultat.getString("IDnumber");
		                               
		                Professor professor = new Professor();
		                professor.setName(name);
		                professor.setLastname(lastname);
		                professor.setBirthday(birthday);
		                professor.setContact(contact);
		                professor.setSection(section);
		                professor.setId(id);

		                professors.add(professor);
		            }
		        } catch (SQLException e) {
		        } finally {
		            try {
		                if (resultat != null)
		                    resultat.close();
		                if (statement != null)
		                    statement.close();
		                if (connexion != null)
		                    connexion.close();
		            } catch (SQLException ignore) {
		            }
		        }
		        
		        return professors;
	    }
	    
	    @Override
	    public void attendanceTracker(Course course)
	    {
	    	Connection connexion = null;
	    	PreparedStatement preparedStatement;
	    	
			try {
	            connexion = daoFactory.getConnection();
				preparedStatement = connexion.prepareStatement("INSERT INTO attendancetracker (studentID, date, subject, time) VALUES(?,?,?,?);");
		    	preparedStatement.setString(1, course.getStudentID());
		    	preparedStatement.setString(2, course.getDate());
		    	preparedStatement.setString(3, course.getSubject());
		    	preparedStatement.setString(4, course.getTime());		    	
		    	preparedStatement.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	    }
	    
	    @Override
		public void attendanceTrackerCorrected(Course course)
		{
	    	Connection connexion = null;
	    	PreparedStatement preparedStatement;
	    	
			try {
	            connexion = daoFactory.getConnection();
				preparedStatement = connexion.prepareStatement("DELETE FROM attendancetracker WHERE studentID=? AND time=?;");
		    	preparedStatement.setString(1, course.getStudentID());
		    	preparedStatement.setString(2, course.getTime());		    	
		    	preparedStatement.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

        
	    @Override
	    public boolean isInDB(String login, String password, int studentOrProfessor)
	    {	
	    	boolean enter=false;
	    	PreparedStatement preparedStatement = null;
            ResultSet resultat = null;
        	Connection connexion = null;
	    	if (studentOrProfessor == 0) // "0" for professor and "1" for student
	    	{
		    	String query = "SELECT password FROM professors WHERE IDnumber=?;";
		        try {
		        	connexion = daoFactory.getConnection();
		            preparedStatement = connexion.prepareStatement(query);
					preparedStatement.setNString(1, login);
		            resultat = preparedStatement.executeQuery();
		            while (resultat.next()) {
		            	String getPassword = resultat.getString("password");
		            	if(getPassword.equals(password))
		            	{
		            		enter = true;
		            	}
		            }
		                          
		        } catch (SQLException e) {
		        } finally {
		            try {
		                if (resultat != null)
		                    resultat.close();
		                if (preparedStatement != null)
		                	preparedStatement.close();
		                if (connexion != null)
		                    connexion.close();
		            } catch (SQLException ignore) {
		            }
		        }	
	    	}
	    	else
	    	{
	    		String query = "SELECT password FROM students WHERE IDnumber=?;";
		        try {
		        	connexion = daoFactory.getConnection();
		            preparedStatement = connexion.prepareStatement(query);
					preparedStatement.setNString(1, login);
		            resultat = preparedStatement.executeQuery();
		            while (resultat.next()) {
		            	String getPassword = resultat.getString("password");
		            	if(getPassword.equals(password))
		            	{
		            		enter = true;
		            	}
		            }
		                          
		        } catch (SQLException e) {
		        } finally {
		            try {
		                if (resultat != null)
		                    resultat.close();
		                if (preparedStatement != null)
		                	preparedStatement.close();
		                if (connexion != null)
		                    connexion.close();
		            } catch (SQLException ignore) {
		            }
		        }	
	    	}
    		return enter;
	    }
	    
	    @Override
	    public void saveMarkInDB(Exam exam)
	    {
	    	Connection connexion = null;
	    	PreparedStatement preparedStatement;
	    	
			try {
	            connexion = daoFactory.getConnection();
				preparedStatement = connexion.prepareStatement("INSERT INTO studentsmarks (studentID, mark, subject) VALUES(?,?,?);");
		    	preparedStatement.setString(3, exam.getSubject());
		    	preparedStatement.setString(1, exam.getStudentID());
		    	preparedStatement.setString(2, exam.getMark());
		    	preparedStatement.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	    }
	    
	    @Override
	    public void deleteMarkFromDB(String subject,String studentID)
	    {
	    	Connection connexion = null;
	    	PreparedStatement preparedStatement;
	  
			try {
	            connexion = daoFactory.getConnection();
				preparedStatement = connexion.prepareStatement("DELETE FROM studentsmarks WHERE studentID=? AND subject=?;");
		    	preparedStatement.setString(1, studentID);
		    	preparedStatement.setString(2, subject);		    	
		    	preparedStatement.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	    }
	    
	    @Override
	    public 	List<Exam> getMarksFromDBBySubject(String subject)
	    {
	    	List<Exam> exams = new ArrayList<Exam>();
    	 	PreparedStatement preparedStatement = null;
	        ResultSet resultat = null;
	    	Connection connexion = null;
	    	String query = "SELECT studentID, mark FROM studentsmarks WHERE subject=?;";
	        try {
	            connexion = daoFactory.getConnection();
	            preparedStatement = connexion.prepareStatement(query);
				preparedStatement.setNString(1, subject);
	            resultat = preparedStatement.executeQuery();

	            while (resultat.next()) {
	            	
	                String studentID = resultat.getString("studentID");
	                String mark = resultat.getString("mark");
	                Exam exam = new Exam();
	                exam.setStudentID(studentID);
	                exam.setMark(mark);
	                exam.setSubject(subject);
	                exams.add(exam);
	            }
	        } catch (SQLException e) {
	        } finally {
	            try {
	                if (resultat != null)
	                    resultat.close();
	                if (preparedStatement != null)
	                	preparedStatement.close();
	                if (connexion != null)
	                    connexion.close();
	            } catch (SQLException ignore) {
	            }
	        }
	        
	        return exams;
	    }
	    
	    @Override
	    public 	List<Exam> getMarksFromDBByStudentID(String studentID)
	    {
	    	List<Exam> exams = new ArrayList<Exam>();
    	 	PreparedStatement preparedStatement = null;
	        ResultSet resultat = null;
	    	Connection connexion = null;
	    	String query = "SELECT mark, subject FROM studentsmarks WHERE studentID=?;";
	        try {
	            connexion = daoFactory.getConnection();
	            preparedStatement = connexion.prepareStatement(query);
				preparedStatement.setNString(1, studentID);
	            resultat = preparedStatement.executeQuery();

	            while (resultat.next()) {
	                String subject = resultat.getString("subject");
	                String mark = resultat.getString("mark");
	                Exam exam = new Exam();
	                exam.setStudentID(studentID);
	                exam.setMark(mark);
	                exam.setSubject(subject);
	                exams.add(exam);
	            }
	        } catch (SQLException e) {
	        } finally {
	            try {
	                if (resultat != null)
	                    resultat.close();
	                if (preparedStatement != null)
	                	preparedStatement.close();
	                if (connexion != null)
	                    connexion.close();
	            } catch (SQLException ignore) {
	            }
	        }
	        
	        return exams;
	    }
	    
	    @Override
	    public void saveFilesName(String fileName, String section)
	    {
	    	Connection connexion = null;
	    	PreparedStatement preparedStatement;
	    	
			try {
	            connexion = daoFactory.getConnection();
				preparedStatement = connexion.prepareStatement("INSERT INTO  uploadedfilesname (fileName, section) VALUES(?,?);");
		    	preparedStatement.setString(1, fileName);
		    	preparedStatement.setString(2, section);
		    	preparedStatement.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	    }
	    
	    @Override
	    public List<String> getFilesName(String section)
	    {
	    	List<String> filesNames = new ArrayList<String>();
    	 	PreparedStatement preparedStatement = null;
	        ResultSet resultat = null;
	    	Connection connexion = null;
	    	String query = "SELECT fileName FROM uploadedfilesname WHERE section=?;";
	        try {
	            connexion = daoFactory.getConnection();
	            preparedStatement = connexion.prepareStatement(query);
				preparedStatement.setNString(1, section);
	            resultat = preparedStatement.executeQuery();

	            while (resultat.next()) {
	                String fileName = resultat.getString("fileName");
	                filesNames.add(fileName);
	            }
	        } catch (SQLException e) {
	        } finally {
	            try {
	                if (resultat != null)
	                    resultat.close();
	                if (preparedStatement != null)
	                	preparedStatement.close();
	                if (connexion != null)
	                    connexion.close();
	            } catch (SQLException ignore) {
	            }
	        }
	        return filesNames;
	    }
	    
	    @Override
	    public String getSectionByStudentID(String studentID)
	    {
	    	String section = null;
    	 	PreparedStatement preparedStatement = null;
	        ResultSet resultat = null;
	    	Connection connexion = null;
	    	String query = "SELECT section FROM students WHERE IDnumber=?;";
	        try {
	            connexion = daoFactory.getConnection();
	            preparedStatement = connexion.prepareStatement(query);
				preparedStatement.setNString(1, studentID);
	            resultat = preparedStatement.executeQuery();

	            while (resultat.next()) {
	                section = resultat.getString("section");
	            }
	        } catch (SQLException e) {
	        } finally {
	            try {
	                if (resultat != null)
	                    resultat.close();
	                if (preparedStatement != null)
	                	preparedStatement.close();
	                if (connexion != null)
	                    connexion.close();
	            } catch (SQLException ignore) {
	            }
	        }
	        return section;
	    }
	    
	    @Override
	    public List<Course> getAttendanceFromDBByStudentID(String studentID)
	    {
	    	List<Course> courses = new ArrayList<Course>();
	    	
    	 	PreparedStatement preparedStatement = null;
	        ResultSet resultat = null;
	    	Connection connexion = null;
	    	String query = "SELECT date, subject, time FROM attendancetracker WHERE studentID=?;";
	        try {
	            connexion = daoFactory.getConnection();
	            preparedStatement = connexion.prepareStatement(query);
				preparedStatement.setNString(1, studentID);
	            resultat = preparedStatement.executeQuery();

	            while (resultat.next()) {
	                String subject = resultat.getString("subject");
	                String date = resultat.getString("date");
	                String time = resultat.getString("time");
	                Course course = new Course();
	                course.setStudentID(studentID);
	                course.setDate(date);
	                course.setTime(time);
	                course.setSubject(subject);
	                courses.add(course);
	            }
	        } catch (SQLException e) {
	        } finally {
	            try {
	                if (resultat != null)
	                    resultat.close();
	                if (preparedStatement != null)
	                	preparedStatement.close();
	                if (connexion != null)
	                    connexion.close();
	            } catch (SQLException ignore) {
	            }
	        }
	        
	        return courses;
	    }
}