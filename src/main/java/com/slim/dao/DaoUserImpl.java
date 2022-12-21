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
				preparedStatement = connexion.prepareStatement("INSERT INTO students(name,lastname,birthday,contact,section,IDnumber) VALUES(?,?,?,?,?,?);");
		    	preparedStatement.setString(1, student.getName());
		    	preparedStatement.setString(2, student.getLastname());
		    	preparedStatement.setString(3, student.getBirthday());
		    	preparedStatement.setString(4, student.getContact());
		    	preparedStatement.setString(5, student.getSection());
		    	preparedStatement.setString(6, student.getId());
		    	
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
				preparedStatement = connexion.prepareStatement("INSERT INTO professors(name,lastname,birthday,contact,section,IDnumber) VALUES(?,?,?,?,?,?);");
		    	preparedStatement.setString(1, professor.getName());
		    	preparedStatement.setString(2, professor.getLastname());
		    	preparedStatement.setString(3, professor.getBirthday());
		    	preparedStatement.setString(4, professor.getContact());
		    	preparedStatement.setString(5, professor.getSection());
		    	preparedStatement.setString(6, professor.getId());
		    	
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
}
