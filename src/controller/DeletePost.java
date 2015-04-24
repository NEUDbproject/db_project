package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.*;

public class DeletePost extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public DeletePost() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 String deleteID =request.getParameter("deleteid");
		 //System.out.println(deleteID); 
		 SqlRecommend sql=new SqlRecommend();
		 boolean res=sql.deletePost(deleteID);
		 if(res==true)
		 {
			 HttpSession session = request.getSession(true);
	    	 //session.setAttribute("respondName", "success");
    		 List<Post> postlist=new ArrayList<Post>();
    		 postlist=sql.readAllPost();
    		 System.out.println("success!!");
    		
    		 session.setAttribute("postlist", postlist);
    		 
    		 List<Post> newpostlist = (ArrayList<Post>) sql.readAllPost();
			
			 session.setAttribute("postlist", newpostlist);
		
			
	    	 response.sendRedirect("manager.jsp");
		     return; 
		 }
		 else{

		 }
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 doGet(request, response);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
