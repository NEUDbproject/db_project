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

public class Login extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public Login() {
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
		 MD5 md5er=new MD5();
	     String email = request.getParameter("email");
	     String pwd = request.getParameter("lpwd").trim();
	     String MDpwd=md5er.getMD5Str(pwd);
	     
	     System.out.println("Email: "+email+"  MDpwd: "+MDpwd);
	     
	     SqlManager sql=new SqlManager();
	     if(sql.LoginSql(email, MDpwd)==true){
	    	 System.out.println("Login Succ!");
	    	 int userId = sql.findUserIdByEmail(email);
	    	 String type =sql.findTypeByEmail(email);
	    	 HttpSession session = request.getSession(true);
	    	 
            /*IF login user is a User. He will move to the main page. If login user is a administrator. He will move to the manager.jsp*/
	    	 if(type.equals("User"))
	    	 {
		     session.setAttribute("userId", userId);
		     session.setAttribute("userEmail", email);
		     session.setAttribute("type", email);
	    	 session.setAttribute("title", "OCE|DBproject");
    		 response.sendRedirect("manager.jsp");
	    	 }
	    	 else
	    	 {
		    	 session.setAttribute("userId", userId);
		    	 session.setAttribute("userEmail", email);
		    	 session.setAttribute("type", type);
		    	 response.sendRedirect("manager.jsp");
	    	 }
    		
    		 return;
	     }
	     else{
	    	 System.out.println("Login Failed!");
	    	 response.sendRedirect("loginFail.jsp");
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
