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
		
		 public List<Rank> readAllRank(){
			 List<Rank> ranklist = new ArrayList<Rank>();
			 Connection conn=ConnectSql();
			 Statement st;
			 
			 
			 try{
			 	 String sql = "select * from User,Rank,CommentList where CommentList.CommentListId = Rank.CommentListId and User.UserId = CommentList.UserId";
			  //   String sql ="select * from Rank";
				 st = (Statement) conn.createStatement();  
				 
		         ResultSet res = st.executeQuery(sql);   
		         while (res.next()) { 
		        	
		        	
		        	
		        	String rank =res.getString("Rank");
		        	String userid=res.getString("UserId");
		         	String courseid =res.getString("CourseId");
		            String email =res.getString("email");
		        	
		        	Rank Rank =new Rank();
		        	Rank.setRank(rank);
		        	Rank.setUserId(userid);
		        	Rank.setCourseId(courseid);
		        	Rank.setEmail(email);

		            ranklist.add(Rank);
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
			 return ranklist;
	}
		 
		 
		 public List<Post> readAllPost(){
			 List<Post> postlist = new ArrayList<Post>();
			 Connection conn=ConnectSql();
			 Statement st;
			 
			 
			 try{
			 	 String sql = "select * from User,Post,CommentList where CommentList.CommentListId = Post.CommentListId and User.UserId = CommentList.UserId";
			  //   String sql ="select * from Rank";
				 st = (Statement) conn.createStatement();  
				 
		         ResultSet res = st.executeQuery(sql);   
		         while (res.next()) { 
		        	
		        	
		        	
		        	String postcontent =res.getString("PostContent");
		        	String userid=res.getString("UserId");
		         	String courseid =res.getString("CourseId");
		            String email =res.getString("email");
		        	
		        	Post post =new Post();
		        	post.setPostContent(postcontent);
		        	post.setUserId(userid);
		        	post.setCourseId(courseid);
		        	post.setEmail(email);

		            postlist.add(post);
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
			 return postlist;
	}
		 
		 
			public List<Post> getPostByCourseId(String id)
			{
				int courseid = Integer.parseInt(id);
				
				List<Post> postlist = new ArrayList<Post>();
				Connection conn=ConnectSql();
				Statement st; 
				String sql="";
				try {  
					sql = "select * from User,Post,CommentList where Post.CommentListId = CommentList.CommentListId and CommentList.UserId = User.UserId and CommentList.CourseId='"+courseid+"'";
		            st = (Statement) conn.createStatement();  
		            ResultSet res = st.executeQuery(sql); 
		            while(res.next())
		            {
			        	String email = res.getString("Email");
			        	String postcontent=res.getString("PostContent");
			             
			        	Post post =new Post();
		                post.setEmail(email);
		                post.setPostContent(postcontent);
		                postlist.add(post);
		            
			 
			           
		            }
		            conn.close();  
		    		return postlist;
		    		
		              
		        } catch (SQLException e) {  
		        	System.out.println(e);
		            return null;
		        }  
			}
	 
}
