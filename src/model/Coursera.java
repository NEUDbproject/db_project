package model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown=true)
public class Coursera {
	String id;
	String shortName;
	String name;
	String videoId;
	String photo;
	String aboutTheCourse;
	String courseSyllabus;
	String instructor;
	String estimatedClassWorkload;
	
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getVideoId() {
		return videoId;
	}
	public void setVideoId(String videoId) {
		this.videoId = videoId;
	}
	public String getShortName() {
		return shortName;
	}
	public void setShortName(String shortName) {
		this.shortName = shortName;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public String getAboutTheCourse() {
		return aboutTheCourse;
	}
	public void setAboutTheCourse(String aboutTheCourse) {
		this.aboutTheCourse = aboutTheCourse;
	}
	public String getCourseSyllabus() {
		return courseSyllabus;
	}
	public void setCourseSyllabus(String courseSyllabus) {
		this.courseSyllabus = courseSyllabus;
	}
	public String getInstructor() {
		return instructor;
	}
	public void setInstructor(String instructor) {
		this.instructor = instructor;
	}
	public String getEstimatedClassWorkload() {
		return estimatedClassWorkload;
	}
	public void setEstimatedClassWorkload(String estimatedClassWorkload) {
		this.estimatedClassWorkload = estimatedClassWorkload;
	}
	public Coursera(String id, String shortName, String name, String videoId,
			String aboutTheCourse, String courseSyllabus, String instructor,
			String estimatedClassWorkload,String photo) {
		super();
		this.id = id;
		this.shortName = shortName;
		this.name = name;
		this.videoId = videoId;
		this.aboutTheCourse = aboutTheCourse;
		this.courseSyllabus = courseSyllabus;
		this.instructor = instructor;
		this.estimatedClassWorkload = estimatedClassWorkload;
		this.photo = photo;
	}
	public Coursera() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
