package model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown=true)
public class CourseraSession {
	String startDay;
	String startMonth;
	String startYear;
	String homeLink;
	
	public String getHomeLink() {
		return homeLink;
	}
	public void setHomeLink(String homeLink) {
		this.homeLink = homeLink;
	}
	public String getStartDay() {
		return startDay;
	}
	public void setStartDay(String startDay) {
		this.startDay = startDay;
	}
	public String getStartMonth() {
		return startMonth;
	}
	public void setStartMonth(String startMonth) {
		this.startMonth = startMonth;
	}
	public String getStartYear() {
		return startYear;
	}
	public void setStartYear(String startYear) {
		this.startYear = startYear;
	}
	public CourseraSession(String startDay, String startMonth, String startYear, String homeLink) {
		super();
		this.startDay = startDay;
		this.startMonth = startMonth;
		this.startYear = startYear;
		this.homeLink = homeLink;
	}
	public CourseraSession() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
