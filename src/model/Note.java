package model;



public class Note {
	private String CommentListId;
	private String NoteURL;
	private String NoteTitle;
	private String UserId;
	private String Email;
	private String CourseId;
	public String getCommentListId() {
		return CommentListId;
	}
	public void setCommentListId(String commentListId) {
		CommentListId = commentListId;
	}
	public String getNoteURL() {
		return NoteURL;
	}
	public void setNoteURL(String noteURL) {
		NoteURL = noteURL;
	}
	public String getNoteTitle() {
		return NoteTitle;
	}
	public void setNoteTitle(String noteTitle) {
		NoteTitle = noteTitle;
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
	public Note(String commentListId, String noteURL, String noteTitle,
			String userId, String email, String courseId) {
		super();
		CommentListId = commentListId;
		NoteURL = noteURL;
		NoteTitle = noteTitle;
		UserId = userId;
		Email = email;
		CourseId = courseId;
	}
	public Note() {
		super();
	}


}