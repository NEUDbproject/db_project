package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import library.Json;
import model.CourseraAbstract;
import model.SqlCourse;

public class SearchCourse extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public SearchCourse() {
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
		//1.get keyword
		//2.sql get course
		//3.get course 
		String api_prefix = "https://api.coursera.org/api/catalog.v1/courses?fields=photo&q=search&query=";
		String kwd =request.getParameter("querykwd");
		
		Json CourseraSearch = new Json();
		CourseraAbstract[] courses = CourseraSearch.getApiInfo(api_prefix+kwd);
		java.util.List<CourseraAbstract> clist = Arrays.asList(courses);
		/*SqlCourse csql = new SqlCourse();*/
		
		
		HttpSession session = request.getSession(true);
	   	if(courses != null){
			System.out.println("search res: "+courses.length);
			/*for(int i =0;i<courses.length;i++){
				String appid = courses[i].getId();
				String cid = csql.getCourseIdByAppId(appid);
				courses[i].setRate(csql.aveScore(cid));
			}*/
	   	}
	   	else{
	   		System.out.println("search res: NULL");
	   	}
	   	session.setAttribute("queryRes", clist);
   	 	session.setAttribute("kwd", kwd);
		response.sendRedirect("search.jsp");
		
		
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
