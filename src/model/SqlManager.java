package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;



public class SqlManager {
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
	
	
	public int registor(User user)
	{
		Connection conn=ConnectSql();
		Statement st; 
		int userId = 0;
		try{
			String sql = "insert into User(FirstName, LastName, PassWord, Email)VALUES('"+user.getFirstName()+"','"+user.getLastName()+"','"+user.getPassWord()+"','"+user.getEmail()+"')";
			//System.out.println(sql); 
	        st = (Statement) conn.createStatement();
	        st.executeUpdate(sql);
	        conn.close();
	        
	        userId = findUserIdByEmail(user.getEmail());
	        System.out.println("The new userId: "+userId);
	        return userId;
        }
		catch(SQLException e)
		{
			System.out.println(e); 
			return -1;	
		}
		
	}
	
	/*authour Weiz */
	/*function Finad a user by his email and return only his ID  */
	public int findUserIdByEmail(String email)
	{
		Connection conn=ConnectSql();
		Statement st; 
		String sql="";
		int resId = 0;
		String type ="";
		try {  
			sql = "select UserId from User where Email='"+email+"'";
            st = (Statement) conn.createStatement();  
            ResultSet rs = st.executeQuery(sql); 
            while(rs.next())
            {
    
            	resId = rs.getInt("UserId");
	            
            }
            conn.close();   
    		return resId;
    		
              
        } catch (SQLException e) {  
        	System.out.println(e);
            return -1;
        }
	}
	
	public String findTypeByEmail(String email)
	{
		Connection conn=ConnectSql();
		Statement st; 
		String sql="";
		String type="";
		
		try {  
			sql = "select Type from User where Email='"+email+"'";
            st = (Statement) conn.createStatement();  
            ResultSet rs = st.executeQuery(sql); 
            while(rs.next())
            {
    
            	type = rs.getString("Type");
	            
            }
            conn.close();   
    		return type;
    		
              
        } catch (SQLException e) {  
        	System.out.println(e);
            return null;
        }
	}
	
	/*authour Weiz */
	/*function Login with users email and pwd  */
	public boolean LoginSql(String Email,String Pwd) 
	{
		Connection conn=ConnectSql();
		Statement st = null;  
		String res="";
		int resCount=0;
		
	    String sql = "select * from User where Email='"+Email+"' and PassWord='"+Pwd+"'"; 
	    System.out.println(sql);
	    try {
			st = (Statement)conn.createStatement();
			ResultSet rs = st.executeQuery(sql);
			rs.last();
			resCount = rs.getRow();
			System.out.println("resCount: "+resCount);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}    

	    if(resCount==1) {  
	        return true;
	    }  
	    else{
	    	return false;
	    	
	    }
	  
		
	}
	
	/*Function for addcourse */
	 public boolean addcourse(Course course)
	{
		Connection conn=ConnectSql();
		Statement st; 
		try{
			
			String sql = "insert into Course(CourseId, CourseAPPId, Provider)VALUES('"+course.getCourseId()+"','"+course.getCourseAPPId()+"','"+course.getProvider()+"')";
			 
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
	 

	 
	 public List<User> readAllUsers(){
		 List<User> userlist = new ArrayList<User>();
		 Connection conn=ConnectSql();
		 Statement st;
		 
		 
		 try{
			 String sql = "select * from User";
			 st = (Statement) conn.createStatement();  
			 
	         ResultSet res = st.executeQuery(sql);   
	         while (res.next()) { 
	        	
	        	
	        	int id = res.getInt("UserId");
	        	String firstname=res.getString("FirstName");
	        	String lastname=res.getString("LastName");
	        	String email=res.getString("Email");
	        	String password=res.getString("PassWord");
	        	String type=res.getString("Type");
	        	
	        	User user =new User();
                user.setUserId(id);
                user.setFirstName(firstname);
                user.setLastName(lastname);
                user.setEmail(email);
                user.setPassWord(password);
                user.setType(type);
                
                
	            userlist.add(user);
	            System.out.println(id);     
	            System.out.println("test"); 
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
		 return userlist;
}
	 
	 
	 
	 
	   public boolean deleteUser(String userid){
		   int id=Integer.parseInt(userid);
		   Connection conn=ConnectSql();
		    Statement st;
		   
		   try{
				
				String sql = "delete from User where UserId='"+id+"'";
				
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
	   
	   public boolean updateUser(User user)
		{
			Connection conn=ConnectSql();
			Statement st; 
			try{
				
				String sql = "update User set FirstName='"+user.getFirstName()+"',LastName='"+user.getLastName()+ "'where UserId='"+user.getUserId()+"'";
				
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
	   
	   
	   
		public User getUserById(String id)
		{
			int userid = Integer.parseInt(id);
			User user=new User();
			Connection conn=ConnectSql();
			Statement st; 
			String sql="";
			try {  
				sql = "select * from User where UserId='"+userid+"'";
	            st = (Statement) conn.createStatement();  
	            ResultSet res = st.executeQuery(sql); 
	            while(res.next())
	            {
		        	int uid = res.getInt("UserId");
		        	String firstname=res.getString("FirstName");
		        	String lastname=res.getString("LastName");
		        	String email=res.getString("Email");
		        	String password=res.getString("PassWord");
		        	String type=res.getString("Type");
		        	
		        	
	                user.setUserId(uid);
	                user.setFirstName(firstname);
	                user.setLastName(lastname);
	                user.setEmail(email);
	                user.setPassWord(password);
	                user.setType(type);
	            
		 
		           
	            }
	            conn.close();  
	    		return user;
	    		
	              
	        } catch (SQLException e) {  
	        	System.out.println(e);
	            return null;
	        }  
		}



	   
}

