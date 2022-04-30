package Util;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.google.gson.*;

import com.google.gson.reflect.TypeToken;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
import java.lang.reflect.Type;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;

import Util.*;
import java.sql.*;
import java.io.*;

public class Helper {
    /**
     * check if name is valid
     *
     * @param name the name user provides
     * @return valid or not valid
     */
    public static boolean validName(String name) {
        return Constant.namePattern.matcher(name).matches();
    }

    /**
     * check if email is valid
     *
     * @param email the email user provides
     * @return valid or not valid
     */
    public static boolean isValidEmail(String email) {
        if (email == null) {
            return false;
        }
        return Constant.emailPattern.matcher(email).matches();
    }


    /**
     * check if the email and password matches
     *
     * @param email
     * @param password
     */
    public static boolean checkPassword(String email, String password) throws SQLException {
    	Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String db = "jdbc:mysql://localhost/finalproj";
            conn = DriverManager.getConnection(db, Constant.DBUserName, Constant.DBPassword);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        String pp = null;
		String sql = "SELECT r.pass "
				+ "FROM USERS r "
				+ "WHERE r.email ='"+email+"';";
        try (Statement st = conn.createStatement(); ResultSet rs = st.executeQuery(sql);) {
        	rs.next();
 			pp = rs.getString("pass");

  					
  			
  		} catch (SQLException sqle) {
  			//System.out.println ("SQLException: " + sqle.getMessage());
  		}
        if(password.equals(pp)) {
        	return true;
        }
        return false;
    }

    
    public static void addUser(String email, String password, String name) throws SQLException {
    	Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String db = "jdbc:mysql://localhost/finalproj";
            conn = DriverManager.getConnection(db, Constant.DBUserName, Constant.DBPassword);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
        	Random random = new Random();
        	int rand_id = random.nextInt(1000000);
        	String sql = "INSERT INTO USERS (user_id, username, email, pass, song_url) VALUES (?, ?, ?, ?, ?)";
        	PreparedStatement ps = conn.prepareStatement(sql);
        	 ps.setInt(1, rand_id);
        	 ps.setString(2, name);
        	 ps.setString(3, email);
        	 ps.setString(4, password);
        	 ps.setString(5, "");
        	 int row = ps.executeUpdate();   
        }
        catch (Exception e) {
        	 e.printStackTrace();
        }
       
    }

    /**
     * Check if email is already registered
     *
     * @param email
     * @param request
     * @param response
     * @return email registered or not
     * @throws ServletException
     * @throws IOException
     */
    public static boolean emailAlreadyRegistered(String email)
            throws ServletException {
    	Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String db = "jdbc:mysql://localhost/finalproj";
            conn = DriverManager.getConnection(db, Constant.DBUserName, Constant.DBPassword);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        String pp = null;
		String sql = "SELECT * "
				+ "FROM USERS r "
				+ "WHERE r.email ='"+email+"';";
        try (Statement st = conn.createStatement(); ResultSet rs = st.executeQuery(sql);) {
        	while(rs.next()) {
        		pp = rs.getString("email");
        	}

  		} catch (SQLException sqle) {
  			
  		}
        if(email.equals(pp)) {
        	return true;
        }
        return false;
        
    }
    

}
