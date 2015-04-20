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

public class UpdateUser extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public UpdateUser() {
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
		doPost(request, response);
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
		String FirstName = new String(request.getParameter("FirstName").getBytes("ISO8859-1"),"UTF-8");
	    String LastName = new String(request.getParameter("LastName").getBytes("ISO8859-1"),"UTF-8");
	    //String Type = request.getParameter("");
	    //String Password = request.getParameter("");
	    //String Email=new String(request.getParameter("Email").getBytes("ISO8859-1"),"UTF-8");
	   
	    int UserId=Integer.parseInt(request.getParameter("userid"));
	    
	    User newUser=new User();
	    newUser.setUserId(UserId);
	    newUser.setFirstName(FirstName);
	    newUser.setLastName(LastName);
//	    newUser.setEmail(Email);
	   
	    
	    SqlManager sql=new SqlManager();
	    boolean res=sql.updateUser(newUser);
	    if(res==true)
	     {
	    	 HttpSession session = request.getSession(true);
	    	 session.setAttribute("respondName", "success");
	    	 SqlManager gsql=new SqlManager();
    		 List<User> userlist=new ArrayList<User>();
    		 userlist=gsql.readAllUsers();
    		 //System.out.println("!!");
    		 //System.out.println(goodlist.size());
    		 session.setAttribute("userlist", userlist);
	    	 response.sendRedirect("manager.jsp");
		     return;
	     }
	     else if(res==false){
	    	 HttpSession session = request.getSession(true);
	    	
	    	 response.sendRedirect("manager.jsp");
		     return;
	     }
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
