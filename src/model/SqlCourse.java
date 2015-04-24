package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
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
	   
	   public String getCourseIdByAppId(String appid){
		   Connection conn=ConnectSql();
		   Statement st;
		   String courseId = "0";
		   try{	
				String sql = "select CourseId from Course where CourseAPPId='"+appid+"'";
		        st = (Statement) conn.createStatement();
		        ResultSet rs = st.executeQuery(sql);
		        while(rs.next())
	            {
		        	courseId = rs.getString("CourseId");
	            }
	            conn.close();     
	    		return courseId;
		       
		   }
		   
		   catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return "-1";
			}
		   		  
	   }
	   
	   
	   public boolean rateCourseById(String uid, String cid, String score){
		   Connection conn=ConnectSql();
		   PreparedStatement ps;
		   Statement st;
		   String courseId = "0";
		   String commentlistId = "0";
		   try{	
				String sql = "insert into CommentList(Content,CourseId,UserId)VALUES('RateCourse','"+cid+"','"+uid+"')";
				System.out.println("CL sql: "+sql);
		        ps = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
		        ps.executeUpdate();
		        
		        ResultSet rs = ps.getGeneratedKeys();
		        if (rs.next()) {
		        	commentlistId = Integer.toString(rs.getInt(1));
		        }
		        
		        
		        sql = "insert into Rank(CommentListId,Rank)VALUES('"+commentlistId+"','"+score+"')";
		        st = (Statement) conn.createStatement();
		        st.executeUpdate(sql);
				System.out.println("Rank sql: "+sql);
	            conn.close();     
	    		return true;
		   }
		   
		   catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return false;
			}
		   		  
	   }
	   
	   
	   public boolean checkRated(String uid, String cid){
		    Connection conn=ConnectSql();
			Statement st = null;  
			String res="";
			int resCount=0;
			
		    String sql = "select * from CommentList where Content='RateCourse' and UserId='"+uid+"' and CourseId='"+cid+"'"; 
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
	   
	   
	   public Double aveScore(String cid){
		    Connection conn=ConnectSql();
			Statement st = null;  
			double resCount=0;
			double totalScore = 0;
			
		    String sql = "select CommentListId from CommentList where Content='RateCourse' and CourseId='"+cid+"'"; 
		    //System.out.println(sql);
		    try {
				st = (Statement)conn.createStatement();
				ResultSet rs = st.executeQuery(sql);
				rs.last();
				resCount = rs.getRow();
				System.out.println("resCount: "+resCount);
				if(resCount==0){
					return 0.0;
				}else{
					String sql2 = "select SUM(Rank) from Rank where CommentListId in ("+sql+")";
					System.out.println("ave sql: "+sql2);
					st = (Statement)conn.createStatement();
					ResultSet result = st.executeQuery(sql2);
					 result.next();
				     String sum = result.getString(1);
				     System.out.println("Total Score: "+sum);
				     totalScore = Double.parseDouble(sum);
				     return totalScore/resCount;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return -1.0;
			}    		   		  
	   }
	   
	   
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
			public String findCommentListIdByUserAndCourse(String userid, String courseid, String postcontent)
			{
						Connection conn=ConnectSql();
						Statement st; 
						String sql="";
						String commentlistid = "0";
						PreparedStatement ps;
						try {  
							sql = "insert into CommentList(Content,CourseId,UserId)VALUES('"+postcontent+"','"+courseid+"','"+userid+"')";
							System.out.println("CL sql: "+sql);
							st = (Statement) conn.createStatement();  
					        ps = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
					        ps.executeUpdate();
					        
					        ResultSet rs = ps.getGeneratedKeys();
					        if (rs.next()) {
					        	commentlistid = Integer.toString(rs.getInt(1));
					        }
					        st = (Statement) conn.createStatement();
					        st.executeUpdate(sql); 
				            conn.close();   
				    		return commentlistid;
				              
				        } catch (SQLException e) {  
				        	System.out.println(e);
				            return null;
				        }		
			}
}
