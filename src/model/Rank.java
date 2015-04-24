package model;

public class Rank {
	
	private String CommentListId;
	private String Rank;
	private String UserId;
	private String CourseId;
	private String Email;
	public String getCommentListId() {
		return CommentListId;
	}
	public void setCommentListId(String commentListId) {
		CommentListId = commentListId;
	}
	public String getRank() {
		return Rank;
	}
	public void setRank(String rank) {
		Rank = rank;
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
	
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	/**
	 * @param commentListId
	 * @param rank
	 * @param provider
	 */

	public Rank() {
		super();
		// TODO Auto-generated constructor stub
	}
	/**
	 * @param commentListId
	 * @param rank
	 * @param userId
	 */
	public Rank(String commentListId, String rank, String userId, String courseId, String email) {
		super();
		CommentListId = commentListId;
		Rank = rank;
		UserId = userId;
		CourseId= courseId;
		Email = email;
	}
	
}
