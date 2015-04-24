package model;



public class Post {
	private String CommentListId;
	private String PostTitle;
	private String PostContent;
	private String UserId;
	private String Email;
	private String CourseId;
	


	public String getCommentListId() {
		return CommentListId;
	}



	public void setCommentListId(String commentListId) {
		CommentListId = commentListId;
	}




	public String getPostTitle() {
		return PostTitle;
	}


	public void setPostTitle(String postTitle) {
		PostTitle = postTitle;
	}


	public String getPostContent() {
		return PostContent;
	}

	public void setPostContent(String postContent) {
		PostContent = postContent;
	}
    
	public String getUserId() {
		return UserId;
	}



	public void setUserId(String userId) {
		UserId = userId;
	}



	public String getEmail() {
		return Email;
	}



	public void setEmail(String email) {
		Email = email;
	}



	public String getCourseId() {
		return CourseId;
	}



	public void setCourseId(String courseId) {
		CourseId = courseId;
	}







	/**
	 * @param commentListId
	 * @param postTitle
	 * @param postContent
	 * @param userId
	 * @param email
	 * @param courseId
	 */
	public Post(String commentListId, String postTitle, String postContent,
			String userId, String email, String courseId) {
		super();
		CommentListId = commentListId;
		PostTitle = postTitle;
		PostContent = postContent;
		UserId = userId;
		Email = email;
		CourseId = courseId;
	}
	
	public Post() {
		super();
		// TODO Auto-generated constructor stub
	}



}