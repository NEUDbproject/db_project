package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class SqlCourse {
	public Connection ConnectSql()
	{
		  Connection conn=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			try {
				conn=DriverManager.getConnection("jdbc:mysql://db4free.net:3306/appdbproject","macctown","appdbproject");
				System.out.println("connect Succ !");  
				return conn;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("connect Failed !"+e.toString());
				e.printStackTrace();
				return null;
			}
		
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block 
			e.printStackTrace();
			return null;
		}
	}
	
	/*Author: Wei Zhang*/
	/*add course id of Coursera and only add uniqle one*/
	public int refreshDatabase(CourseraAbstract[] courselist){
		Connection conn=ConnectSql();
		Statement st; 
		int total = 0;
		
		for(CourseraAbstract course : courselist){
			int appid = Integer.parseInt(course.getId());
			try {
				String sql = "insert ignore into Course(CourseAPPId, Provider)VALUES('"+appid+"','Coursera')";
				st = (Statement) conn.createStatement();
				total += st.executeUpdate(sql);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		    
			
		}

		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return total;
	}
	
	/*Used to list all course info in the course manage page*/
	
	 public List<Course> readAllCourses(){
		 List<Course> courselist = new ArrayList<Course>();
		 Connection conn=ConnectSql();
		 Statement st;
		 
		 
		 try{
			 String sql = "select * from Course";
			 st = (Statement) conn.createStatement();  
			 
	         ResultSet res = st.executeQuery(sql);   
	         while (res.next()) { 
	        	
	        	
	        	String id = res.getString("CourseId");
	        	String appid = res.getString("CourseAPPId");
	        	String provider = res.getString("Provider");
	        	
	        	
	        	Course course =new Course();
                course.setCourseId(id);
                course.setCourseAPPId(appid);
                course.setProvider(provider);

                
                
	            courselist.add(course);
	            //System.out.println(id);     
	            //System.out.println("test"); 
	            }  
		 }
		 
		 /*Below is closing the database*/
		 catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			// close SQL connection
			finally {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		 return courselist;
}
	   public boolean deleteCourse(String courseid){
		   int id=Integer.parseInt(courseid);
		   Connection conn=ConnectSql();
		    Statement st;
		   
		   try{
				
				String sql = "delete from Course where CourseId='"+id+"'";
				
		        st = (Statement) conn.createStatement();
		        st.executeUpdate(sql);
		        conn.close();
		        return true;
		       
		   }
		   
		   catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return false;
			}
		   
		
		  
	   }
	 
	 
}
