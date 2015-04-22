package model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown=true)
public class CourseraAbstract {
	String id;
	String shortName;
	String name;
	String photo;
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
	public CourseraAbstract(String id, String shortName, String name, String photo) {
		super();
		this.id = id;
		this.shortName = shortName;
		this.name = name;
		this.photo = photo;
	}
	
	public CourseraAbstract() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
