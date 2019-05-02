//Author: Rashika Koul
//SWE 642 : Homework 4
//Class to store student data and getter/setter methods
package survey;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Student")
public class StudentBean {

	private static final long serialVersionUID = 1L;
	
	@Id
	private String studentID;
	private String userName;
    private String address;
    private String zipcode;
    private String city;
    private String state;
    private String phone;
    private String email;
    private String url;
    private String surveyDate;
    private String gradMonth;
    private String gradYear;
    
    private String likes;
    private String interest;   
    private String comments;
    private String recommend;
	
	public String getStudentID() {
		return studentID;
	}
	public void setStudentID(String studentID) {
		this.studentID = studentID;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getURL() {
		return url;
	}
	public void setURL(String url) {
		this.url = url;
	}
	public String getSurveyDate() {
		return surveyDate;
	}
	public void setSurveyDate(String date) {
		this.surveyDate = date;
	}
	public String getGradMonth() {
		return gradMonth;
	}
	public void setGradMonth(String month) {
		this.gradMonth = month;
	}
	public String getGradYear() {
		return gradYear;
	}
	public void setGradYear(String year) {
		this.gradYear = year;
	}
	public String getLikes() {
		return likes;
	}
	public void setLikes(String likes) {
		this.likes = likes;
	}
	public String getInterest() {
		return interest;
	}
	public void setInterest(String interest) {
		this.interest = interest;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getRecommend() {
		return recommend;
	}
	public void setRecommend(String recommend) {
		this.recommend = recommend;
	}
}
