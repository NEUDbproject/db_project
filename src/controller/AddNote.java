package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import model.SqlCourse;
import model.Note;
public class AddNote extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AddNote() {
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
		 Note NewNote = new Note();
		 String NoteUrl = request.getParameter("NoteURL");
		 String NoteTitle = "FourthTitle";
		 String courseAppId = request.getParameter("courseAppId");
		 String uid = request.getParameter("userId");
			System.out.println("Coursera Id: "+courseAppId);
			System.out.println("myuserid: "+uid);
		 SqlCourse csql = new SqlCourse();
		 String courseId = csql.getCourseIdByAppId(courseAppId);
		 String CommentListId = csql.findCommentListIdByUserAndCourse(uid, courseId,NoteUrl);
	  //   String PostTitle = request.getParameter("PostTitle");
	   //  Integer CommentListId = 100;
	   //  Integer CommentListId = request.getParameter("CommentListId")toString();
	     
	     NewNote.setNoteURL(NoteUrl);
	     NewNote.setNoteTitle(NoteTitle);
	     NewNote.setCommentListId(CommentListId);
	   
	     Boolean res = csql.AddNote(NewNote);
	     response.sendRedirect("GetCourse?cid="+courseAppId);
	     
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