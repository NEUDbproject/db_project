package model;

import java.util.Date;

public class CommentList {
	private String CommentListId;
	private String UserId;
	private String CourseId;
//
	
	public String getCommentListId() {
		return CommentListId;
	}
	public void setCommentListId(String commentListId) {
		CommentListId = commentListId;
	}
	public String getUserId() {
		return UserId;
	}
	public void setUserId(String userId) {
		UserId = userId;
	}
	public String getCourseId() {
		return CourseId;
	}
	public void setCourseId(String courseId) {
		CourseId = courseId;
	}
	
	public CommentList(String commentListId,String userId, String courseId) {
		super();
		CommentListId = commentListId;
		UserId = userId;
		CourseId = courseId;
	}
	
	
	public CommentList() {
		super();
		// TODO Auto-generated constructor stub
	}

}