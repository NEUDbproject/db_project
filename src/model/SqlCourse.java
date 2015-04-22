package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

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
}
