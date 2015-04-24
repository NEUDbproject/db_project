package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import library.Json;
import model.Coursera;
import model.CourseraAbstract;
import model.CourseraSession;
import model.SqlCourse;

/**
 * Servlet implementation class GetCourse
 */
public class GetCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetCourse() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String courseId = request.getParameter("cid");
		String uid = request.getSession().getAttribute("userId").toString();

		String api = "https://api.coursera.org/api/catalog.v1/courses?id="+courseId+"&fields=videoId,aboutTheCourse,courseSyllabus,instructor,estimatedClassWorkload,photo";
		String sapi	= "https://api.coursera.org/api/catalog.v1/sessions?id="+courseId+"&fields=startYear,startMonth,startDay";	
		Json CourseraSearch = new Json();
		Coursera course = CourseraSearch.getApiDetail(api);
		CourseraSession csession = CourseraSearch.getApiSession(api);
		System.out.println("Session Found: "+csession.getStartDay());

		HttpSession session = request.getSession(true);
		
		SqlCourse csql = new SqlCourse();
		String cid = csql.getCourseIdByAppId(courseId);
		if(csql.checkRated(uid, cid)==true){
			session.setAttribute("hasRated", "none");
		}
		else{
			session.setAttribute("hasRated", "black");
		}
		Double ave = csql.aveScore(cid);
				
		session.setAttribute("title", course.getName()+"|OCE");
		System.out.println("Course Found: "+course.getName());
		System.out.println("Course Instructor Found: "+course.getInstructor());
	   	session.setAttribute("courseRes", course);
	   	session.setAttribute("courseAve", ave);
	   	session.setAttribute("sessionRes", csession);
	   	session.setAttribute("title", course.getName());
	   	response.sendRedirect("classdetail.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
