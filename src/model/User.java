package model;

import java.util.Date;

public class User {
	private Integer UserId;
	private String FirstName;
	private String LastName;
	private String PassWord;
	private String Email;
	//private Date Birth;
	private String Type;
	
	
	public Integer getUserId() {
		return UserId;
	}
	public void setUserId(Integer userId) {
		UserId = userId;
	}
	public String getFirstName() {
		return FirstName;
	}
	public void setFirstName(String firstName) {
		FirstName = firstName;
	}
	public String getLastName() {
		return LastName;
	}
	public void setLastName(String lastName) {
		LastName = lastName;
	}
	public String getPassWord() {
		return PassWord;
	}
	public void setPassWord(String password) {
		PassWord = password;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getType() {
		return Type;
	}
	public void setType(String type) {
		Type = type;
	}
	
	
	public User(Integer userId, String firstName, String lastName,
			String password, String email,String type) {
		super();
		UserId = userId;
		FirstName = firstName;
		LastName = lastName;
		PassWord = password;
		Email = email;
		Type = type;
	}
	
	
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

}
