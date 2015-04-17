package model;



public class Post {
	private int CommentListId;
	private int UserId;
	private String PostTitle;
	private String PostContent;
	


	public int getCommentListId() {
		return CommentListId;
	}



	public void setCommentListId(int commentListId) {
		CommentListId = commentListId;
	}


	public int getUserId() {
		return UserId;
	}


	public void setUserId(int userId) {
		UserId = userId;
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

	/**
	 * @param commentListId
	 * @param userId
	 * @param postTitle
	 * @param postContent
	 */
	public Post(int commentListId, int userId, String postTitle,
			String postContent) {
		super();
		CommentListId = commentListId;
		UserId = userId;
		PostTitle = postTitle;
		PostContent = postContent;
	}



	public Post() {
		super();
		// TODO Auto-generated constructor stub
	}

}