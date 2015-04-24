package controller;

import java.awt.List;
import java.io.IOException;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import library.Json;
import model.CourseraAbstract;
import model.SqlCourse;

/**
 * Servlet implementation class OrderCourse
 */
public class OrderCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderCourse() {
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
		String kwd = request.getParameter("kwd");
	    String orderBy = request.getParameter("OrderBy");
	    
	    String api_prefix = "https://api.coursera.org/api/catalog.v1/courses?fields=photo&q=search&query=";
		
		Json CourseraSearch = new Json();
		CourseraAbstract[] courses = CourseraSearch.getApiInfo(api_prefix+kwd);
		SqlCourse csql = new SqlCourse();
		java.util.List<CourseraAbstract> clist = Arrays.asList(courses);
		
		
		HttpSession session = request.getSession(true);
	   	if(courses != null){
			System.out.println("search res: "+courses.length);
			for(int i =0;i<courses.length;i++){
				String appid = courses[i].getId();
				String cid = csql.getCourseIdByAppId(appid);
				courses[i].setRate(csql.aveScore(cid));
			}
			
			//Could add other filter by else statement
			if(orderBy=="Rated"){
				Comparator<CourseraAbstract> comparator = new Comparator<CourseraAbstract>(){  
		            public int compare(CourseraAbstract s1, CourseraAbstract s2) {  
		                //rank first 
		                if(s1.getRate()!=s2.getRate()){  
		                    return (int)(s1.getRate()-s2.getRate());  
		                }  
		                else{  
		                    //id second  
		                    return s1.getId().compareTo(s2.getId()); 
		                }  
		            }  
		        }; 
		        
		        Collections.sort(clist,comparator); 
				
			}
			
	   	}
	   	else{
	   		System.out.println("search res: NULL");
	   	}
	   	
	   	
	   	session.setAttribute("queryRes", clist);
   	 	session.setAttribute("kwd", kwd);
		response.sendRedirect("search.jsp");
		
	}

}
