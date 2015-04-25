package model;



public class Note {
	private String CommentListId;
	private String NoteURL;
	private String NoteTitle;
	


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
		NoteTitle= noteTitle;
	}
    

	public Note(String commentListId, String noteURL, String noteTitle
			) {
		super();
		CommentListId = commentListId;
		NoteURL = noteURL;
		NoteTitle = noteTitle;
	}
	
	public Note() {
		super();
		// TODO Auto-generated constructor stub
	}



}