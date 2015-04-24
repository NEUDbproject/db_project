package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class SqlRecommend {
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
	
	 public boolean addRecommend(Recommend recommend)
	{
		Connection conn=ConnectSql();
		Statement st; 
		try{
			
			String sql = "insert into Recommend(Meta, Value)VALUES('"+recommend.getMeta()+"','"+recommend.getValue()+"')";
			 
	        st = (Statement) conn.createStatement();
	        st.executeUpdate(sql);
	        conn.close();
	        return true;
	        
	        
       }
		catch(SQLException e)
		{
			System.out.println(e); 
			return false;	
		}
		
	}
	
		public String findMetaByValue(String value)
		{
			Connection conn=ConnectSql();
			Statement st; 
			String sql="";
			String meta="";
			try {  
				sql = "select Meta from Recommend where Value='"+value+"'";
	            st = (Statement) conn.createStatement();  
	            ResultSet rs = st.executeQuery(sql); 
	            while(rs.next())
	            {
	    
	            	meta = rs.getString("Meta");
		            
	            }
	            conn.close();   
	    		return meta;
	    		
	              
	        } catch (SQLException e) {  
	        	System.out.println(e);
	            return null;
	        }
		}
	 
}
