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
	 
	 /*Function for Addpost by Junwei */
	 
	 public boolean AddPost(Post Post)
	{
		Connection conn=ConnectSql();
		Statement st; 
		try{
			
			String sql = "insert into Post(PostContent, PostTitle, CommentListId)VALUES('"+Post.getPostContent()+"','"+Post.getPostTitle()+"','"+Post.getCommentListId()+"')";
			 
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
			 String sql = "Select * from User";
			 st = (Statement) conn.createStatement();  
	         ResultSet res = st.executeQuery(sql);   
	         while (res.next()) { 
	        	User user =new User();
                user.setUserId(res.getInt("id"));
                user.setFirstName(res.getString("firstname"));
                user.setLastName(res.getString("lastname"));
                user.setEmail(res.getString("email"));
                user.setPassWord(res.getString("password"));
                
	            userlist.add(user);
	                
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
}

