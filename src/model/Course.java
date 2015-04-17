package model;

import java.util.Date;

public class Course {
	private String CourseId;
	private String CourseAPPId;
	private String Provider;
	//private String PassWord;
	//private String Email;
	//private Date Birth;
	//private String Type;
	
	
	public String getCourseId() {
		return CourseId;
	}
	public void setCourseId(String courseId) {
		CourseId = courseId;
	}
	public String getCourseAPPId() {
		return CourseAPPId;
	}
	public void setCourseAPPId(String courseappId) {
		CourseAPPId = courseappId;
	}
	public String getProvider() {
		return Provider;
	}
	public void setProvider(String provider) {
		Provider = provider;
	}
	
	public Course(String courseId,String courseappId, String provider) {
		super();
		CourseId = courseId;
		CourseAPPId = courseappId;
		Provider = provider;
	}
	
	
	public Course() {
		super();
		// TODO Auto-generated constructor stub
	}

}