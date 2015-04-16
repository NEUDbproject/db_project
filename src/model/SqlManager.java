package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;



public class SqlManager {
	public Connection ConnectSql()
	{
		  Connection conn=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			try {
				conn=DriverManager.getConnection("jdbc:mysql://107.161.162.77:3306/app_dbproject","root","delete250");
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
	
	
	public boolean registor(User user)
	{
		Connection conn=ConnectSql();
		Statement st; 
		try{
			//System.out.println(Rname); 
			//System.out.println(Rpwd); 
			String sql = "insert into User(FirstName, LastName, PassWord, Email)VALUES('"+user.getFirstName()+"','"+user.getLastName()+"','"+user.getPassWord()+"','"+user.getEmail()+"')";
			//System.out.println(sql); 
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
}

