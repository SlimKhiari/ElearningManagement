package com.slim.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.slim.beans.Student;

public class Students {
private Connection connexion;
    
    public List<Student> getStudents() {
        List<Student> students = new ArrayList<Student>();
        Statement statement = null;
        ResultSet resultat = null;

        loadDatabase();
        
        try {
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
    
    private void loadDatabase() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
        }

        try {
            connexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/elearningmanagement", "root", "Slimetsalambo123&");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
