package com.skilldistillery.cofish.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.validation.constraints.Email;

@Entity
public class User {

	// F I E L D S
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "user_name")
	private String userName;
	
	private String password;
	
	@Email
	private String email;
	
	private int role;
	
	private boolean active;
	
	@OneToMany(mappedBy="user")
	private List<Report> reports;

	
	// M E T H O D S
	
	public void addReport(Report report) {
		if (reports == null) {
			reports = new ArrayList<>();
		}
		
		if(!reports.contains(report)) {
			reports.add(report);
			
			if (report.getUser() != null) { 
			report.getUser().getReports().remove(report); //this line is saying if the incoming report already has an associated user, to remove that old user and use this new user
			}
			report.setUser(this); //new report's user is set here
		}
	}
	
	public void removeReport(Report report) {
		report.setUser(null); //remove the existing user first
		if (reports != null) {
			reports.remove(report);
		}
	}
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getUserName() {
		return userName;
	}
	
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public int getRole() {
		return role;
	}
	
	public void setRole(int role) {
		this.role = role;
	}
	
	public boolean isActive() {
		return active;
	}
	
	public void setActive(boolean active) {
		this.active = active;
	}
	
	public List<Report> getReports() {
		return reports;
	}
	
	public void setReports(List<Report> reports) {
		this.reports = reports;
	}
	
	
	@Override
	public String toString() {
		return "User [id=" + id + ", userName=" + userName + ", password=" + password + ", email=" + email + ", role="
				+ role + ", active=" + active + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		User other = (User) obj;
		if (id != other.id)
			return false;
		return true;
	}

	// C T O R S
	public User() {
		super();
	}

	public User(int id, String userName, String password, @Email String email, int role, boolean active,
			List<Report> reports) {
		super();
		this.id = id;
		this.userName = userName;
		this.password = password;
		this.email = email;
		this.role = role;
		this.active = active;
		this.reports = reports;
	}

	
	
}
