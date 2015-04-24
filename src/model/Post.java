package model;



public class Post {
	private String CommentListId;
	private String PostTitle;
	private String PostContent;
	


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

	/**
	 * @param commentListId
	 * @param userId
	 * @param postTitle
	 * @param postContent
	 */
	public Post(String commentListId, String postTitle,
			String postContent) {
		super();
		CommentListId = commentListId;
		PostTitle = postTitle;
		PostContent = postContent;
	}



	public Post() {
		super();
		// TODO Auto-generated constructor stub
	}

}