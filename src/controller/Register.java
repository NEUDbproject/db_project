package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import library.MD5;
import model.SqlManager;
import model.User;

public class Register extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public Register() {
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
		 User newUser = new User();
		 MD5 md5er=new MD5();
	     String firstname = request.getParameter("fname");
	     String lastname = request.getParameter("lname");
	     String pwd = request.getParameter("pwd").trim();
	     String MDpwd=md5er.getMD5Str(pwd);
	     String email = request.getParameter("email");
	     newUser.setFirstName(firstname);
	     newUser.setLastName(lastname);
	     newUser.setPassWord(MDpwd); 
	     newUser.setEmail(email);
	     
	    
	     SqlManager sql=new SqlManager();
	     int res = sql.registor(newUser);
	     if(res > 0 ){
	    	 System.out.println("Create User Succ!");
	    	 HttpSession session = request.getSession(true);
	    	 session.setAttribute("useremail", email);
	    	 session.setAttribute("userId", res);
	    	 session.setAttribute("Type", "User");
	    	 response.sendRedirect("customer.jsp");
		     return;
	     }else if(res == -1){
	    	 System.out.println("Create User Succ!");
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
