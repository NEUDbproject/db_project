package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.SqlCourse;

/**
 * Servlet implementation class RateCourse
 */
public class RateCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RateCourse() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String courseAppId = request.getParameter("courseAppId");
		String uid = request.getParameter("userId");
		String score = request.getParameter("score");
		System.out.println("Coursera Id: "+courseAppId);
		System.out.println("Course Score: "+score);
		
		SqlCourse csql = new SqlCourse();
		String courseId = csql.getCourseIdByAppId(courseAppId);
		System.out.println("User Id: "+uid);
		
		csql.rateCourseById(uid, courseId, score);
		response.sendRedirect("GetCourse?cid="+courseAppId);
		
	}

}
