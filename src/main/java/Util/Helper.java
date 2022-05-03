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
import java.util.*;
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
    public static String albumName(String name) {
    	Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String db = "jdbc:mysql://localhost/finalproj";
            conn = DriverManager.getConnection(db, Constant.DBUserName, Constant.DBPassword);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        String album = "";
        //Select cover_url FROM finalproj.albums where album_name LIKE '%Sour%';
		String sql = "SELECT * "
				+ "FROM albums "
				+ "WHERE album_name LIKE '%"+name+"%';";
        try (Statement st = conn.createStatement(); ResultSet rs = st.executeQuery(sql);) {
        	while(rs.next()) {
        		album = rs.getString("album_name");
        	}
 			
  		} catch (SQLException sqle) {
  			
  		}
        return album;
    }
    
    public static String getCover(String album) {
    	Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String db = "jdbc:mysql://localhost/finalproj";
            conn = DriverManager.getConnection(db, Constant.DBUserName, Constant.DBPassword);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        String cover = "";
        //Select cover_url FROM finalproj.albums where album_name LIKE '%Sour%';
		String sql = "SELECT * "
				+ "FROM albums "
				+ "WHERE album_name LIKE '%"+album+"%';";
        try (Statement st = conn.createStatement(); ResultSet rs = st.executeQuery(sql);) {
        	while(rs.next()) {
        		cover = rs.getString("cover_url");
        	}
 			
  		} catch (SQLException sqle) {
  			
  		}
        System.out.println("cover"+cover);
        return cover;
    }
    
    public static String getCover(int id) {
    	Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String db = "jdbc:mysql://localhost/finalproj";
            conn = DriverManager.getConnection(db, Constant.DBUserName, Constant.DBPassword);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        String cover = "";
        //Select cover_url FROM finalproj.albums where album_name LIKE '%Sour%';
		String sql = "SELECT * "
				+ "FROM albums "
				+ "WHERE album_id LIKE '%"+id+"%';";
        try (Statement st = conn.createStatement(); ResultSet rs = st.executeQuery(sql);) {
        	while(rs.next()) {
        		cover = rs.getString("cover_url");
        	}
 			
  		} catch (SQLException sqle) {
  			
  		}
        System.out.println("cover"+cover);
        return cover;
    }
    
    public static String getArtist(String album) {
    	Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String db = "jdbc:mysql://localhost/finalproj";
            conn = DriverManager.getConnection(db, Constant.DBUserName, Constant.DBPassword);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        String artist = "";
        //Select cover_url FROM finalproj.albums where album_name LIKE '%Sour%';
		String sql = "SELECT * "
				+ "FROM finalproj.ARTISTS as a "
				+ "INNER JOIN finalproj.ALBUMS AS al on a.artist_id = al.artist_id "
				+ "WHERE album_name LIKE '%"+album+"%' "
				+"ORDER BY al.releasedate DESC;";
		System.out.println(sql);
        try (Statement st = conn.createStatement(); ResultSet rs = st.executeQuery(sql);) {
        	while(rs.next()) {
        		artist = rs.getString("artist_name");
        	}
 			
  		} catch (SQLException sqle) {
  			
  		}
        System.out.println("name "+artist);
        return artist;
    }
    
    public static String getDate(String album) {
    	Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String db = "jdbc:mysql://localhost/finalproj";
            conn = DriverManager.getConnection(db, Constant.DBUserName, Constant.DBPassword);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        String date = "";
        //Select cover_url FROM finalproj.albums where album_name LIKE '%Sour%';
		String sql = "SELECT * "
				+ "FROM albums "
				+ "WHERE album_name LIKE '%"+album+"%';";
        try (Statement st = conn.createStatement(); ResultSet rs = st.executeQuery(sql);) {
        	while(rs.next()) {
        		date = rs.getString("releasedate");
        	}
 			
  		} catch (SQLException sqle) {
  			
  		}
        System.out.println("date "+date);
        return date;
    }
    
    public static int getID(String album) {
    	Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String db = "jdbc:mysql://localhost/finalproj";
            conn = DriverManager.getConnection(db, Constant.DBUserName, Constant.DBPassword);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        int albID = 0;
        //Select cover_url FROM finalproj.albums where album_name LIKE '%Sour%';
		String sql = "SELECT * "
				+ "FROM albums "
				+ "WHERE album_name LIKE '%"+album+"%';";
        try (Statement st = conn.createStatement(); ResultSet rs = st.executeQuery(sql);) {
        	while(rs.next()) {
        		albID = rs.getInt("album_id");
        	}
 			
  		} catch (SQLException sqle) {
  			
  		}
        System.out.println("id "+albID);
        return albID;
    }
    
    public static double getRating(String album) {
    	Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String db = "jdbc:mysql://localhost/finalproj";
            conn = DriverManager.getConnection(db, Constant.DBUserName, Constant.DBPassword);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        double rating = 0;
        //Select cover_url FROM finalproj.albums where album_name LIKE '%Sour%';
		String sql = "SELECT * "
				+ "FROM albums "
				+ "WHERE album_name LIKE '%"+album+"%';";
        try (Statement st = conn.createStatement(); ResultSet rs = st.executeQuery(sql);) {
        	while(rs.next()) {
        		rating = rs.getDouble("rating");
        	}
 			
  		} catch (SQLException sqle) {
  			
  		}
        System.out.println("rating "+rating);
        return rating;
    }
    
    public static Map<String,String> getReviews(String album) {
    	Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String db = "jdbc:mysql://localhost/finalproj";
            conn = DriverManager.getConnection(db, Constant.DBUserName, Constant.DBPassword);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        Map<String,String> revs = new HashMap<>();;
        //Select cover_url FROM finalproj.albums where album_name LIKE '%Sour%';
		String sql = "SELECT * "
				+ "FROM album_reviews as rev "
				+ "INNER JOIN USERS as us on rev.user_id = us.user_id "
				+ "WHERE rev.album_id LIKE '%"+String.valueOf(Helper.getID(album))+"%';";
        try (Statement st = conn.createStatement(); ResultSet rs = st.executeQuery(sql);) {
        	while(rs.next()) {
        		String review = rs.getString("review");
        		String username = rs.getString("username");
        		revs.put(username,review);
        		System.out.println("rev"+revs.get(username));
        	}
 			
  		} catch (SQLException sqle) {
  			
  		}
        return revs;
    }
    
    public static String getAlbumDuration(String album) {
    	Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String db = "jdbc:mysql://localhost/finalproj";
            conn = DriverManager.getConnection(db, Constant.DBUserName, Constant.DBPassword);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        int duration = 0;
        //Select cover_url FROM finalproj.albums where album_name LIKE '%Sour%';
		String sql = "SELECT * "
				+ "FROM albums "
				+ "WHERE album_name = '"+album+"'"
				+ " ORDER BY releasedate DESC;";
        try (Statement st = conn.createStatement(); ResultSet rs = st.executeQuery(sql);) {
        	while(rs.next()) {
        		duration = rs.getInt("duration");
        	}
 			
  		} catch (SQLException sqle) {
  			
  		}
        System.out.println("len "+ duration);
        int secs = duration % 60;
        int mins = duration / 60;
        String dur = String.valueOf(mins) + " mins " + String.valueOf(secs) + " secs";
        return dur;
    }
    
    public static String getUserName(String email) throws SQLException {
    	Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String db = "jdbc:mysql://localhost/finalproj";
            conn = DriverManager.getConnection(db, Constant.DBUserName, Constant.DBPassword);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        String pp = "";
		String sql = "SELECT r.username "
				+ "FROM USERS r "
				+ "WHERE r.email ='"+email+"';";
        try (Statement st = conn.createStatement(); ResultSet rs = st.executeQuery(sql);) {
        	while(rs.next()) {
        		pp = rs.getString("username");
        	}
 			
  		} catch (SQLException sqle) {
  			
  		}
        return pp;
    }

    public static ArrayList<String> getSongs(String album) {
    	Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String db = "jdbc:mysql://localhost/finalproj";
            conn = DriverManager.getConnection(db, Constant.DBUserName, Constant.DBPassword);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        String artist = "";
        //Select cover_url FROM finalproj.albums where album_name LIKE '%Sour%';
		String sql = "SELECT * "
				+ "FROM finalproj.SONGS as s "
				+ "INNER JOIN finalproj.ALBUMS AS al on s.album_id = al.album_id "
				+ "WHERE album_name = '"+album+"' "
				+"ORDER BY s.position ASC;";
		
		ArrayList<String> songs = new ArrayList<String>();
		System.out.println(sql);
        try (Statement st = conn.createStatement(); ResultSet rs = st.executeQuery(sql);) {
        	while(rs.next()) {
        		songs.add(rs.getString("song_name"));
        		System.out.println("song: "+rs.getString("song_name"));
        	}
 			
  		} catch (SQLException sqle) {
  			
  		}
        
        return songs;
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
